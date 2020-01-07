--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/29
--
-- @file    inet.lua
-- @brief	��������й������绷����ʼ��
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/29 0.1 �����ļ�
-- @warning û�о���
--]]

local inet = {}


local l_net_a = require("l_net_a")
local l_nmps_a = require("l_nmps_a")
local l_skdr_a = require("l_skdr_a")
local l_nsm_a = require("l_nsm_a")
local l_discover = require("l_discover")

local l_ipc = require("l_ipc")


-- @name   inet.skdr_com
-- @export ͨ��skdr, ����ҵ��ѹ��С��ģ��
--  \n ����: 1. ����ģ��
inet.skdr_com = 'skdr_com'


-- @name   inet.nsm_upgrade
-- @export ������Э��nsm����ģ��
inet.nsm_upgrade = 'nsm_upgrade'



inet.init = function ()
	-- @1 �������������ʼ��
	l_net_a.init()

	-- @2 ���� skdr
	local skdr_com = l_skdr_a.create(inet.skdr_com)
	
	-- @3 ��������ģ��
	l_nsm_a.create(inet.nsm_upgrade, skdr_com)
	
	-- ���緢��ģ��
	l_discover.init()
	
	-- ��ipcҵ��
	l_ipc.init()
end


inet.quit = function ()
	l_ipc.quit()
	l_discover.quit()	
	l_net_a.quit()
end


inet.start = function ()
	l_net_a.start()	
	l_discover.start()	
	l_ipc.start()
end

inet.stop = function ()
	l_ipc.stop()
	l_discover.stop()	
	l_net_a.stop()
end


inet.get_nsm = function (nsm_name)
	return l_nsm_a.get(nsm_name)
end


inet.get_listener = function ()
	return l_ipc.get_push_stream()
end


return inet
