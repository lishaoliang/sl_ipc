--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/04
--
-- @file    t_set_sta.lua
-- @brief   ����staģʽ
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/04 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local l_sys = require("l_sys")

local write_wpa_cfg = require("ipc.phynet.write_wpa_cfg")
local wlan = require("ipc.phynet.wlan")
local wpa_cli = require("ipc.phynet.wpa_cli")


-- ��Ҫ���ӵ�·������Ϣ
local ssid = 'HUAWEI-7NLNPF_5G'
local passwd = 'qwertyuiop1234567890'


-- ���������ļ�
write_wpa_cfg(ssid, passwd)


-- ���û���Ϊsta ģʽ, �����ӵ�wifi
wlan.env_sta()


-- ���� dhcp �� ��̬ip ѡ��һ��

-- ����dhcpc
--wlan.set_sta_dhcp()


-- ���þ�̬ip
wlan.set_sta_ipv4('192.168.9.218', '255.255.255.0', '192.168.9.1')
