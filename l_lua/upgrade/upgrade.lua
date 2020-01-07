--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/4/28
--
-- @file    upgrade.lua
-- @brief   ��������
--  \n �������̲��������ļ�ϵͳ
--  \n �����ļ�: /nfsmem/upgrade/ipc_upgrade_file.lpk	*.lpk�ļ�
--  \n �������: /nfsmem/upgrade/ipc_upgrade.txt		�ַ���,����'1'��Ϊ������
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/4/28 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local os = require("os")
local io = require("io")
local lfs = require("lfs")
local l_sys =  require("l_sys")
local l_file = require("l_file")
local l_pack = require("l_pack")

local util = require("base.util")
local unix = require("base.unix")


local ipc_upgrade_file = '/nfsmem/upgrade/ipc_upgrade_file.lpk'	-- �����ļ�
local ipc_upgrade = '/nfsmem/upgrade/ipc_upgrade.txt'			-- �������
local ipc_root = ''


if 'hisi_linux' ~= l_sys.platform then
	-- ��Ŀ��ƽ̨, �ض�λĿ¼
	ipc_upgrade_file = './upgrade/ipc_upgrade_file.lpk'
	ipc_upgrade = './upgrade/ipc_upgrade.txt'
	ipc_root = './upgrade/root'
end


local do_check = function ()	
	return l_pack.check(ipc_upgrade_file)
end


local filter_file = function (path)
	-- У��Ŀ¼�Ϸ���, ������µ�����Ҫ���ļ�,Ŀ¼
	-- ֻ�����ļ�: '/mm.sh'
	-- ֻ����Ŀ¼: '/opt', '/komod'
	-- ������Ŀ¼: '/opt/config' '/opt/configfile'
	if nil == path then
		return false, ''
	end
	
	local w_path = path
	local mm_file = '/mm.sh'
	local dir_opt = '/opt'
	local dir_komod = '/komod'
	local dir_opt_cfg = '/opt/config'
	local dir_opt_cfgfile = '/opt/configfile'
	
	if 'hisi_linux' ~= l_sys.platform then
		w_path = string.format('%s%s', ipc_root, path)
		mm_file = string.format('%s%s', ipc_root, mm_file)
		dir_opt = string.format('%s%s', ipc_root, dir_opt)
		dir_komod = string.format('%s%s', ipc_root, dir_komod)
		dir_opt_cfg = string.format('%s%s', ipc_root, dir_opt_cfg)
		dir_opt_cfgfile = string.format('%s%s', ipc_root, dir_opt_cfgfile)
	else
		-- ��ȫ����
	end
	
	-- �����Ը��µ�Ŀ¼
	if 1 == string.find(w_path, dir_opt_cfg) or
		1 == string.find(w_path, dir_opt_cfgfile) then
		return false, ''
	end

	-- ��ɸ��µ�Ŀ¼���ļ�
	if mm_file == w_path then
		return true, w_path
	end
	
	if 1 == string.find(w_path, dir_opt) then
		return true, w_path
	end
	
	if 1 == string.find(w_path, dir_komod) then
		return true, w_path
	end
	
	return false, ''
end

local my_mkdir = nil
my_mkdir = function (path, cur)
	local left = string.sub(path, string.len(cur) + 1)
	local f = string.find(left, '/')
	if nil ~= f then
		local pwd = string.sub(path, 1, f + string.len(cur))
		
		local b_mk = true
		if nil == lfs.attributes(pwd) then
			b_mk = lfs.mkdir(pwd)
		end
		
		if b_mk then
			return my_mkdir(path, pwd)
		else
			return false
		end
	end
	
	return true
end

local mkdir = function (path)
	return my_mkdir(path, '')
end


local update_file = function (pkr, path)
	
	-- ȷ��Ŀ¼����
	mkdir(path)
	
	local file = l_file.open(path, 'wb')
	if nil == file then
		print('update_file open error!path:' .. path)
		return false
	end

	local b_write = true
	local size = 0

	local offset = 0
	while true do
		local buf, r = l_pack.iter_read(pkr, offset)	
		if nil ~= buf then				
			offset = offset + r
			local ret, w = l_file.write(file, buf)
			
			if ret and w == r then
				size = size + w
			else
				b_write = false
			end
		else
			break
		end
	end
	
	l_file.close(file)
	
	if b_write then
		print('update_file ok.path:' .. path, size)
	else
		print('update_file error.path:' .. path, size)
	end
end

local check_enc = function (enc)
	local dec, obj = pcall(cjson.decode, enc)	

	if not dec then
		return false
	end

	local check = false
	for k, v in pairs(obj) do
		if v == l_sys.chip then
			check = true
			break
		end
	end
	
	return check
end

local do_upgrade = function ()
	local pkr = l_pack.open(ipc_upgrade_file)
	
	if nil == pkr then
		print('do_upgrade,open upgrade file error!', ipc_upgrade_file)
		return false
	end

	local enc = l_pack.enc(pkr)
	print('do_upgrade,enc:', enc)
	
	if not check_enc(enc) then
		print('do_upgrade,check enc error!')
		l_pack.close(pkr)
		return false
	end
	

	local begin = l_pack.iter_begin(pkr)
	while begin do
		local path = l_pack.iter_path(pkr)
	
		-- �����ļ�, ֻ����ĳЩĿ¼�ļ�
		local filter, filter_path = filter_file(path)
		if filter then
			update_file(pkr, filter_path)	-- �����ļ�
		else
			print('do_upgrade drop path:' .. path)
		end
		
		if not l_pack.iter_next(pkr) then
			break
		end
	end	
	
	l_pack.close(pkr)

	return true
end

local do_killall = function ()
	-- ɱ������������
	unix.kill('llua', 'ipc.lua')		-- ɱ��������
	
	-- ɱ����������
	unix.killall('udhcpc')
	unix.killall('wpa_supplicant')
	unix.killall('dnsmasq')
	unix.killall('hostapd')
	
	unix.killall('telnetd')
end


-- �����쳣�˳�
local on_exit = function()
	-- �ر�ҵ��
	
	print('upgrade exit!.....')
	return 0
end

l_on_exit(on_exit)


-- �������������
local proc_main = function ()
	
	-- ��ȡ ipc_upgrade �ļ��еı��
	local file = io.open(ipc_upgrade)
	if nil ~= file then
		local num = file:read('*n')
		file:close()
		
		local b_reboot = false
		
		if num and 1 <= num and do_check() then
			print('proc_main upgrade...')
			do_killall()
			
			if do_check() then			-- �ٴμ���ļ���, �Է�ֹ�� killall ʱ, ���ݰ�����д
				do_upgrade()
			
				unix.shell('sync')		-- ͬ���ļ�ϵͳ
				l_sys.sleep(100)
				print('proc_main upgrade over.need reboot!...')
			end

			b_reboot = true
		else
			print('proc_main check error!remove upgrade!')
		end
		
		-- ��δ���֮��, ɾ�������ļ�
		os.remove(ipc_upgrade)
		os.remove(ipc_upgrade_file)
		
		unix.shell('sync')		-- ͬ���ļ�ϵͳ
		l_sys.sleep(100)
		
		if b_reboot then
			print('reboot now!...')
			unix.shell('reboot')	-- ����
		end
		
		return not b_reboot
	end
	
	return true
end


-- ��̨�ػ�: ���ipc����������ҵ�, �������豸
local check_ipc = function ()
	
	local o = unix.ps('llua', 'ipc.lua')
	if util.t_is_empty(o) then
		print('check_ipc not found!...')
		print('reboot now!...')
		unix.shell('reboot')	-- ����
		return false
	end
	
	return true
end


print('upgrade start ok...')


-- ��ѭ��
local tc_collect = 0
local count = 0
while true do
	if proc_main() then
		count = count + 1000
		if 180000 < count then		-- 3 * 60 * 1000, 3����
			count = 0

			-- �ڴ�����
			collectgarbage('collect')	
			
			-- ���ڼ���������Ƿ�OK
			if not check_ipc() then
				break
			end
		end
		
		-- ����ִ��lua�ڴ����
		tc_collect = tc_collect + 1000
		if 10000 < tc_collect then
			tc_collect = 0
			collectgarbage('collect')
		end
		
		l_sys.sleep(1000)
	else
		break
	end
end
