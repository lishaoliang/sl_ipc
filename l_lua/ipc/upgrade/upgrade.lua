--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/4/23
--
-- @file    upgrade.lua
-- @brief   ����ģ��
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/4/23 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local io = require("io")
local os = require("os")
local l_sys = require("l_sys")
local l_net_a = require("l_net_a")
local l_nsm_a = require("l_nsm_a")


local util = require("base.util")
local np_err = require("base.np_err")
local np_id = require("base.np_id")

local l_file = require("l_file")


local upgrade = {}


local ipc_upgrade_file = '/nfsmem/upgrade/ipc_upgrade_file.lpk'	-- �����ļ�
local ipc_upgrade = '/nfsmem/upgrade/ipc_upgrade.txt'			-- �������
local ipc_root = ''

if 'hisi_linux' ~= l_sys.platform then
	-- ��Ŀ��ƽ̨, �ض�λĿ¼
	ipc_upgrade_file = './upgrade/ipc_upgrade_file.lpk'
	ipc_upgrade = './upgrade/ipc_upgrade.txt'
	ipc_root = './upgrade/root'
end


local up_nsm = nil
local up_conn = {
	id = 0,
	
	blk_count = 0,
	pf = nil,
	pf_w_size = 0
}

local send = function (body)
	assert(0 ~= up_conn.id)
	local t = type(body)
	
	if 'string' == t then
		l_nsm_a.send(up_nsm, up_conn.id, body)
	elseif 'table' == t then
		local txt = cjson.encode(body)
		l_nsm_a.send(up_nsm, up_conn.id, txt)
	else
		assert(false)
	end
end

local close_connect = function ()

	print('upgrade close connect.', up_conn.pf_w_size)
	
	-- �ر�����
	local id = up_conn.id;
	l_nsm_a.close(up_nsm, id)
	
	-- �ر��ļ�
	if nil ~= up_conn.pf then
		l_file.close(up_conn.pf)
	end
	
	up_conn.id = 0
	up_conn.pf = nil
	up_conn.blk_count = 0;
	up_conn.pf_w_size = 0;
end

local on_cmd_upgrade = function (json_obj)
	local res_up = {
		cmd = 'upgrade',
		upgrade = {
			code = 0
		}
	}
	
	if nil == up_conn.pf then
		up_conn.pf = l_file.open(ipc_upgrade_file, 'wb')
		assert(0 == up_conn.blk_count)
	end	
	
	send(res_up)
end

local on_cmd_upgrade_packs = function (json_obj)
	local res_up_packs = {
		cmd = 'upgrade_packs',
		upgrade_packs = {
			code = 0,
			packs = up_conn.blk_count,
			bits = up_conn.pf_w_size
		}
	}
	
	send(res_up_packs)
end


local on_cmd_upgrade_ok = function (json_obj)
	local res_up_ok = {
		cmd = 'upgrade_ok',
		upgrade_ok = {
			code = 0,
			all_packs = up_conn.blk_count,
			all_bits = up_conn.pf_w_size
		}
	}
	
	send(res_up_ok)
	
	-- У�����ݰ���С �����Ƿ��������
	local up = false
	
	local bits = util.t_item(json_obj, 'upgrade_ok', 'all_bits')
	if 'number' == type(bits) and bits == up_conn.pf_w_size then
		up = true
	end
	
	if nil ~= up_conn.pf then
		l_file.close(up_conn.pf)
		up_conn.pf = nil
	end
		
	if up then
		-- ��������		
		local file = io.open(ipc_upgrade, 'w')
		assert(file)
		
		if file then
			file:write('1')
			file:close()
		end
	else
		print('recv upgrade all_bits error!remove!')
		os.remove(ipc_upgrade_file)
	end
	
	close_connect()	-- �ر�����
end


local on_commond = function (json_obj)
	local cmd = json_obj['cmd'] or ''
	if 'string' ~= type(cmd) then
		send('{}')
		return
	end
	
	local low_cmd = string.lower(cmd)	
	if 'upgrade' == low_cmd then
		on_cmd_upgrade(json_obj)	
	elseif 'upgrade_packs' == low_cmd then
		on_cmd_upgrade_packs(json_obj)
	elseif 'upgrade_ok' == low_cmd then
		on_cmd_upgrade_ok(json_obj)
	else
		send('{}')
	end
end


local open_connect = function (id)	
	local file = io.open(ipc_upgrade, 'r')
	if file then
		io.close(file)
		return false			-- �Ѿ�׼��Ҫ������, ���ٽ�������
	end
	
	up_conn.id = id				-- ֻ����һ������	
	return true
end


local on_recv_txt = function ()
	-- һ�ν������ı���Ϣ��ȡ���
	while true do
		local ret, code, body, id, main, sub = l_nsm_a.recv(up_nsm)	
		if ret then
			if 0 == code then
				if 0 ~= up_conn.id and id == up_conn.id then
					local dec, json_obj = pcall(cjson.decode, body)
					if dec then
						on_commond(json_obj)
					else
						close_connect()
					end
				else
					l_nsm_a.close(up_nsm, id)
				end
			elseif np_err.CONNECT == code then	-- �����ӽ���
				if 0 == up_conn.id and open_connect(id) then
					-- ֻ����һ������
				else
					l_nsm_a.close(up_nsm, id)
				end
			else
				if 0 ~= up_conn.id and id == up_conn.id then
					close_connect()
				else
					l_nsm_a.close(up_nsm, id)	-- ���ӶϿ�
				end
			end
		else
			break	-- �˳�
		end	
	end
end

local on_recv_md = function ()
	while true do
		local buf, id = l_nsm_a.recv_md(up_nsm)
	
		if nil ~= buf then
			if id == up_conn.id then
				local ret = false
				local w_size = 0
				if nil ~= up_conn.pf then
					ret, w_size= l_file.write(up_conn.pf, buf)
				end
				
				if ret then
					up_conn.blk_count = up_conn.blk_count + 1		--д��ɹ�, ����+1
					up_conn.pf_w_size = up_conn.pf_w_size + w_size	--д���������
					
					--print('upgrade write:', up_conn.blk_count, up_conn.pf_w_size)
				else
					print('net upgrade l_file.write error!', ret)
					l_sys.free(buf)
				end
			else
				print('net upgrade id error!', id, up_conn.id)
				l_sys.free(buf)	-- �͵�ǰ���Ӷ�Ӧ����
			end
		else
			break
		end
	end
end

upgrade.on_recv = function ()

	on_recv_txt()
	on_recv_md()
	
	return 0
end


upgrade.init = function (nsm)
	up_nsm = nsm
end


upgrade.quit = function ()
	up_nsm = nil
end

return upgrade
