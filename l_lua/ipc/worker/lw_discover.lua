--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- @brief	�豸���ַ������߳�
-- @author	������
--]]

local string = require("string")
local cjson = require("cjson")

local l_sys = require("l_sys")
local broadcast_ser = require("ipc.discover.broadcast_ser")

local lt_name = ''


local on_recv = function(id, count, interval, tc, last_tc)

-- ret[boolean]	true.��ȡ������; false.û������
--	\n	code[number]		0.��ȡ�㲥��Ϣ; ��0.��ȡ��������
--	\n	body[string]		�㲥��Ϣ
--	\n	protocol[number]	Э��
--	\n	id[number]			id��
--	\n	ip[string]			���͹㲥��IP
--	\n	port[number]		�˿�

	while true do
		local ret, code, body, protocol, id, ip, port = broadcast_ser.recv()
	
		if ret then
			--print('broadcast recv:' .. code, ip .. ':' .. port, body)
		else
			break
		end
	end

	return 0
end

local on_update = function(id, count, interval, tc, last_tc)
	
	broadcast_ser.update()
	
	return 0
end


init = function (param)
	--print('init .....', param)
	lt_name = param

	-- �㲥����˳�ʼ��
	broadcast_ser.init()

	--[[
	-- ����Ĭ��������Ӧ
	local discover = 
	{
		cmd = 'discover',
		sn = 'xxxx',
			
		discover = {
			name = 'x',
			port = 80,
			hw_ver = 'h0.0.0',
			sw_ver = 'v0.0.0',
			model = 'wifi-ipc',
			dev_type = 'ipc',
			chnn_max = 1,
			txt_enc = '',
			md_enc = ''
		}
	}
	broadcast_ser.set_respond(discover)
	--]]		
		
	-- ��Ӷ�ʱ��
	l_sys.add_timer(100, 10, on_recv)		-- ��ȡ�㲥��Ϣ
	l_sys.add_timer(101, 30000, on_update)	-- Ĭ�ϼ�����ʱ���� 30S
	
	return 0
end

quit = function ()
	--print('quit .....')
	
	l_sys.remove_timer(101)
	l_sys.remove_timer(100)

	broadcast_ser.quit()
	
	return 0
end

on_cmd = function (msg, lparam, wparam, cobj)
	--print('on_cmd.name:'..lt_name, msg, lparam, wparam)
	
	local cmd_low = string.lower(msg) -- ������key�ֶδ�Сд
	
	if 'broadcast_ser.set_respond' == cmd_low then
		broadcast_ser.set_respond(lparam)
	elseif 'broadcast_ser.update' == cmd_low then
		broadcast_ser.update()
	else
		print('unsupport!name:'..lt_name, msg, lparam, wparam)
	end
	
	return 0
end
