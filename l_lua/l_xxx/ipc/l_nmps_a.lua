--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/20
--
-- @file    l_nmps_a.lua
-- @brief   ���ÿ�require("l_nmps_a"), �����˿ڶ�·����
--  \n require("l_net_a")
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/14/20 0.1 �����ļ�
-- @warning û�о���
--]]

local l_nmps_a = {}


-- @brief �򿪼����˿�
-- @param [in]  	name[string]	���� < 64
-- @param [in]  	port[number]	�����˿�
-- @return [boolean] true.�ɹ�; false.ʧ��
l_nmps_a.open = function (name, port)
	return true
end

-- @brief �򿪼����˿�,
-- @param [in]  	name[string]	���� < 64
-- @param [in]  	port[number]	�����˿�
-- @param [in]		path[string]	unix����socket·��; ����"/tmp/xxx.xxx"
-- @return [boolean] true.�ɹ�; false.ʧ��
-- @note unix��ʹ�ñ���socket
--  \n windows��ʹ��port����һ��socket
l_nmps_a.open_unix = function (name, port, path)
	return true
end


-- @brief �رռ����˿�
-- @param [in]  	name[string]	���� < 64
-- @return [boolean] true.�ɹ�; false.ʧ��
l_nmps_a.close = function (name)
	return true
end


-- @brief ��ȡ�����õ���socket
-- @return  [nil,l_socket] l_obj����: l_socket
--  \n 		20 [number]		��Э��
--  \n 		0 [number]		��Э��
--  \n 		x [string]		������ı�Э��, ��Ϊ�����URLǰһ����(���Լ64�ֽ�)
l_nmps_a.get_socket = function ()
	return l_socket, 20, 0, 'xxx'
	-- return nil, 0, 0, ''
end


return l_nmps_a
