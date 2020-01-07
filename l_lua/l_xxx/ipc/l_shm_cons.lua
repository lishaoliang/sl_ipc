--[[
-- Copyright(c) 2020, �人˴����� All Rights Reserved
-- Created: 2020/1/7
--
-- @file    l_shm_cons.lua
-- @brief   ���ÿ�require("l_shm_cons"), ����̹����ڴ�(������)
--  \n require("l_tpool")
--  \n ������l_tpool.init֮��, l_tpool.quit֮ǰ
--  \n ���й�����, ���ɶ�̬�޸�
-- @version 0.1
-- @history �޸���ʷ
--  \n 2020/1/5 0.1 �����ļ�
-- @warning û�о���
--]]

local l_shm_cons = {}


-- @brief (���̼�)������ڴ����, ���:[1,N]
-- @return [number] ������ڴ����
l_shm_cons.max = function ()
	return 8
end


-- @brief (���̼�)�򿪹����ڴ�
-- @param [in] index[number]	�ڴ���:[1,N]
-- @param [in] path[string]	·��/����: ''
-- @return [boolean] �Ƿ�ɹ�
l_shm_cons.open = function (index, path)
	return true
	-- return false
end


-- @brief (���̼�)�رչ����ڴ�
-- @param [in] index[number]	�ڴ���:[1,N]
-- @return [boolean] �Ƿ�ɹ�
l_shm_cons.close = function (index)
	return true
	-- return false
end

return l_shm_cons
