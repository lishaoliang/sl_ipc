--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/20
--
-- @file    l_skdr_x.lua
-- @brief   ���ÿ�require("l_skdr_x"), �����첽io�����߳�
--  \n require("l_skdr_x")
--  \n ������l_net_x.init֮��, l_net_x.start֮ǰ������̵߳�l_skdr_x.create����
--  \n �������й�����, ���ɶ�̬�޸�
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/14/20 0.1 �����ļ�
-- @warning û�о���
--]]

local l_skdr_x = {}


-- @brief ����skdr�߳�
-- @param [in]  	name[string]	����
-- @return [nil, l_skdr_x] l_skdr_x����
l_skdr_x.create = function (name)
	return l_skdr_x
end


-- @brief ��ȡskdr�߳�
-- @param [in]  	name[string]	����
-- @return [nil, l_skdr_x] l_skdr_x����
l_skdr_x.get = function (name)
	return l_skdr_x
end


return l_skdr_x
