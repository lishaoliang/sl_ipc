--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/20
--
-- @file    l_skdr_a.lua
-- @brief   ���ÿ�require("l_skdr_a"), �����첽io�����߳�
--  \n require("l_net_a")
--  \n ������l_net_a.init֮��, l_net_a.start֮ǰ������̵߳�l_skdr_a.create����
--  \n �������й�����, ���ɶ�̬�޸�
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/14/20 0.1 �����ļ�
-- @warning û�о���
--]]

local l_skdr_a = {}


-- @brief ����skdr�߳�
-- @param [in]  	name[string]	����
-- @return [nil, l_skdr_a] l_skdr_a����
l_skdr_a.create = function (name)
	return l_skdr_a
end


-- @brief ��ȡskdr�߳�
-- @param [in]  	name[string]	����
-- @return [nil, l_skdr_a] l_skdr_a����
l_skdr_a.get = function (name)
	return l_skdr_a
end


return l_skdr_a
