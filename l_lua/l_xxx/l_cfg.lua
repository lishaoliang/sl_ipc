--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_cfg.lua
-- @brief   ���ÿ�require("l_cfg"), ����˵��
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_cfg = {}



-- @brief �����ļ���ʼ��
-- @param [in] version[string] �汾��Ϣ(0,15],����"v1.0.0"
-- @return [boolean] �����Ƿ�ɹ�
l_cfg.init = function (version)
	return true
	-- return false
end

-- @brief �����ļ��˳�
l_cfg.quit = function ()
	return
end


-- @brief �����ļ��Ƿ�����
-- @return [boolean] �����Ƿ�����
-- @note ����false, ����Ҫ�޸������ļ�
l_cfg.is_ok = function ()
	return true
	-- return false
end


-- @brief ��ȡ������ֵ
-- @param [in] key[string] ���õ�key�ַ���(0,255]
-- @return [string] ���صõ�������ֵ���߿��ַ���
l_cfg.get_old = function(key)
	return ''	
end


-- @brief ��ȡ��ǰ����ֵ
-- @param [in] key[string] ���õ�key�ַ���(0,255]
-- @return [string] ���صõ�������ֵ���߿��ַ���
l_cfg.get = function(key)
	return ''
end


-- @brief ��������
-- @param [in] key[string] ���õ�key�ַ���(0,255]
-- @param [in] v[string] ���õ�v�ַ���(0,128K]
-- @return [boolean] �����Ƿ�ɹ�
l_cfg.set = function(key, v)
	return ''
end


-- @brief ��λ����: ֻ��λ�ڴ��е�����, ���������ļ�
-- @return [boolean] ��λ�Ƿ�ɹ�
l_cfg.reset = function()
	return true
end


-- @brief ��������(����д�ļ�)
-- @return [boolean] �����Ƿ�ɹ�
l_cfg.save = function()
	return true
end


return l_cfg
