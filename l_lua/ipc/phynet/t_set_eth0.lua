--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/08
--
-- @file    t_set_eth0.lua
-- @brief   ����staģʽ
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/08 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local l_sys = require("l_sys")

local eth0 = require("ipc.phynet.eth0")


-- ���� dhcp �� ��̬ip ѡ��һ��

-- ��̬ip
eth0.set_ipv4('192.168.3.218', '255.255.255.0', '192.168.3.1')

-- dhcp
--eth0.set_dhcp()

