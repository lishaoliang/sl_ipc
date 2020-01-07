--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/04
--
-- @file    t_scan.lua
-- @brief   ɨ��wifi
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/04 0.1 �����ļ�
-- @warning û�о���
--]]

local string = require("string")
local l_sys = require("l_sys")

local util = require("base.util")
local util_ex = require("base.util_ex")

local wlan = require("ipc.phynet.wlan")
local wpa_cli = require("ipc.phynet.wpa_cli")



local wpa, ping = wpa_cli.ping()

if not wpa then
	wlan.env_sta()			-- û������wpa_supplicant, ��������sta����
else
	wpa_cli.disconnect()	-- �Ѿ�����wpa_supplicant, ��Ͽ�����, ����ȫ��wifi
end

-- �ٴ�ping 
wpa, ping = wpa_cli.ping()

-- ����ɹ�, ����Կ�ʼ����
if ping then	
	wpa_cli.scan()	
	
	local count = 5
	while 0 < count do
		count = count - 1	
		--wpa_cli.scan()

		l_sys.sleep(1000)	
		util_ex.printf('scan_results:', wpa_cli.scan_results())
	end
	
	wpa_cli.reconnect()
end

print('t_scan over...')
