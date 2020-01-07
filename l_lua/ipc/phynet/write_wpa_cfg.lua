--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/04
--
-- @file    write_wpa_cfg.lua
-- @brief   дwpa�������ļ�
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/04 0.1 �����ļ�
-- @warning û�о���
--]]
local io = require("io")

local write_wpa_cfg = function (ssid, passwd)
	local content = "ctrl_interface=/var/run/wpa_supplicant\n".."update_config=1\n".."network={\nssid=\""..ssid.."\"\npsk=\""..passwd.."\"\n}"
	local f = assert(io.open("/opt/configfile/wpa_0_8.conf", 'w'))
    f:write(content)
	f:close()
end

return write_wpa_cfg
