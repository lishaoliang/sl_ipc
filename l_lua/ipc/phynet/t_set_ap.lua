--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/04
--
-- @file    t_set_ap.lua
-- @brief   ����apģʽ
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/04 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local l_sys = require("l_sys")

local wlan = require("ipc.phynet.wlan")
local wpa_cli = require("ipc.phynet.wpa_cli")


-- ���û���Ϊ ap ģʽ
wlan.env_ap()
