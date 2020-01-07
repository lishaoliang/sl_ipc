--[[
-- Copyright(c) 2020, �人˴����� All Rights Reserved
-- Created: 2020/1/7
--
-- @file    l_shm_prod.lua
-- @brief   ���ÿ�require("l_shm_prod"), ����̹����ڴ�(������)
--  \n require("l_tpool")
--  \n ������l_tpool.init֮��, l_tpool.quit֮ǰ
--  \n ���й�����, ���ɶ�̬�޸�
-- @version 0.1
-- @history �޸���ʷ
--  \n 2020/1/5 0.1 �����ļ�
-- @warning û�о���
--]]

local l_shm_prod = {}


-- @brief (���̼�)������ڴ����, ���:[1,N]
-- @return [number] ������ڴ����
l_shm_prod.max = function ()
	return 8
end


-- @brief (���̼�)�򿪹����ڴ�
-- @param [in] index[number]	�ڴ���:[1,N]
-- @param [in] path[string]	·��/����: ''
-- @param [in] size[number]	�ڴ��С: 4K������
-- @return [boolean] �Ƿ�ɹ�
l_shm_prod.open = function (index, path, size)
	return true
	-- return false
end


-- @brief (���̼�)�رչ����ڴ�
-- @param [in] index[number]	�ڴ���:[1,N]
-- @return [boolean] �Ƿ�ɹ�
l_shm_prod.close = function (index)
	return true
	-- return false
end


-- @brief ��ȡ���ݽ�����: ���ݴ���ص�����
-- @param [in] index[number]	�ڴ���:[1,N]
-- @return [nil, userdata] ���ݴ���ص�����
l_shm_prod.get_receiver = function (index)
	return nil
	-- return void*
end


return l_shm_prod
