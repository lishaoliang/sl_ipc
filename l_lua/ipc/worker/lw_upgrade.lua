--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/4/23
--
-- @file    lw_upgrade.lua
-- @brief   �����������߳�
-- @version 0.1
-- @author	������
-- @history �޸���ʷ
--  \n 2019/4/23 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local cjson = require("cjson")
local l_sys = require("l_sys")

local util = require("base.util")
local np_id = require("base.np_id")

local inet = require("ipc.inet")
local upgrade = require("ipc.upgrade.upgrade")


local lt_name = ''


local on_timer_recv = function (id, count, interval, tc, last_tc)
	
	-- upgrade��ʱ����
	upgrade.on_recv()
	
	return 0
end


init = function (param)
	--print('init .....', param)
	lt_name = param

	local nsm_upgrade = inet.get_nsm(inet.nsm_upgrade)
	assert(nsm_upgrade)
	
	upgrade.init(nsm_upgrade)
	
	-- ��Ӷ�ʱ��
	l_sys.add_timer(100, 10, on_timer_recv)		-- ��ʱȡ��Ϣ
		
	return 0
end

quit = function ()
	--print('quit .....')
	
	l_sys.remove_timer(100)

	upgrade.quit()
	
	return 0
end

on_cmd = function (msg, lparam, wparam, cobj)
	--print('on_cmd.name:'..lt_name, msg, lparam, wparam)
	
	local cmd_low = string.lower(msg) -- ������key�ֶδ�Сд
	
	return 0
end
