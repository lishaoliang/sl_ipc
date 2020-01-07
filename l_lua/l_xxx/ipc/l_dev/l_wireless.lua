--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_wireless.lua
-- @brief   ��չ���ÿ�"l_wireless", ����˵��
-- @version 0.1
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_wireless = {}


-- @brief ��ȡwifi����ģʽ
-- @return [string] "ap", "sta", "other"
l_wireless.mode_probe = function ()
	return 'ap'
	-- return false
end


-- @brief �л���"ap"ģʽ(��Ϊwifi�ȵ�)
l_wireless.mode_switch2ap = function ()

end


-- @brief ��apģʽ,��ȡ���ӵ��ն���Ŀ
-- @return [number] �����ϵ��ն���Ŀ
l_wireless.ap_connected_count = function()
	return 0
end


-- @brief ���������� 'sta'ģʽ
l_wireless.boot_mode_sta = function ()

end


-- @brief �л���"sta"ģʽ(��Ϊ�ն�)
l_wireless.mode_switch2sta =  function ()

end


-- @brief ��apģʽ,��ȡ���ӵ��ն���Ŀ
-- @return [number][string]
-- @note
--  \n 0 ������
--  \n 1 ������, ����ssid
--  \n 2 ������, ȡ����ssid
l_wireless.sta_get_linkstatus = function ()
	return 0, 'ssid'
end


-- @brief ��staģʽ��, scan���ܳ�ʼ��
l_wireless.sta_wpa_cli_start = function ()

end


-- @brief ��staģʽ��, scan���ܷ���ʼ��
l_wireless.sta_wpa_cli_cleanup = function ()

end


-- @brief ��staģʽ��, ɨ���ȵ�
-- @return [table] �ȵ�����
--  \n {
--       {ssid="xxx",flags="xxx",signal="xxx", freq="xxx", bssid="xxx"},...
--  \n }
l_wireless.sta_get_scan_result = function ()
	return {}
end


-- @brief 'sta'ģʽ���ӵ��ȵ�
-- @param [in] ssid[string]		ssid
-- @param [in] passwd[string]	����
-- @param [in] flags[string]	���ӱ��
-- @return [boolean] �ɹ�,ʧ��
l_wireless.sta_connect2ap = function (ssid, passwd, flags)
	return true
end


-- @brief 'sta'ģʽ�¿���dhcpc�ͻ���
l_wireless.sta_dhcpc_start = function ()

end


-- @brief 'sta'ģʽ�¹ر�dhcpc�ͻ���
l_wireless.sta_dhcpc_exit = function ()

end


-- @brief 'sta'ģʽ������ip��ַ
-- @param [in] name[string]		��������,����"wlan0"
-- @param [in] ip[string]		ip��ַ
-- @param [in] netmask[string]	����
-- @param [in] gateway[string]	����
l_wireless.set_ipaddr = function (name, ip, netmask, gateway)

end


return l_wireless
