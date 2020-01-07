--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/20
--
-- @file    l_mcache.lua
-- @brief   ���ÿ�require("l_mcache"), Lua�����߳�֮���k, v��ʽ������
--  \n require("l_tpool")
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/14/20 0.1 �����ļ�
-- @warning û�о���
--]]

local l_mcache = {}


-- @brief ����ģ���ʼ��
-- @param [in]  	ht_size[number]	hash table ��С(Ĭ��4096, ��С100)
--l_mcache.init = function (ht_size)
--	return
--end


-- @brief ����ģ�鷴��ʼ��
--l_mcache.quit = function ()
--	return
--end


-- @brief �������k, v
l_mcache.clear = function ()
	return
end


-- @brief ����k, v
-- @param [in]  	k[string]	�ؼ���
-- @param [in]		v[~]		ֵ
--  \n v = l_obj, boolean, number, string
-- @return [boolean] true.�ɹ�; false.ʧ��
--  \n ͬk���滻����ֵ
l_mcache.set = function (k, v)
	return true
end


-- @brief ��ȡk��vֵ
-- @param [in]  	k[string]	�ؼ���
-- @return v	= nil, l_obj, boolean, number, string
--  \n     type	= 'nil', 'l_obj', 'boolean', 'number', 'string'
l_mcache.get = function (k)
	return nil, 'nil'
	-- return l_obj, 'l_obj'
	-- return true, 'boolean'
	-- return 0, 'number'
	-- return '', 'string'
end


return l_mcache
