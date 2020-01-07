--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_tmsg.lua
-- @brief   ��չ��require("l_tmsg"), Lua�����߳�֮����ı���Ϣͨ��
--  \n require("l_tpool")
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_tmsg = {}


-- @brief l_tmsg ģ���ʼ��
--  \n �Ƕ��߳���ȫ
--l_tmsg.init = function ()
--
--end

-- @brief l_tmsg ģ���˳�
--  \n �Ƕ��߳���ȫ
--l_tmsg.quit = function ()
--
--end

-- @brief l_tmsgע����Ϣ����
-- @param [in] name[string] ��Ϣ��������
-- @return [boolean] �Ƿ�ɹ�
-- @note ������l_tpool.init����֮��, post/get/clear�Ⱥ���֮ǰ���������Ϣ���е�ע��
--  \n �Ƕ��߳���ȫ
l_tmsg.register = function (name)
	return true
	-- return false
end


-- @brief ������Ϊname����Ϣ����post��Ϣ
-- @param [in] name[string] ��Ϣ��������
-- @param [in] msg[string]	��Ϣ
-- @param [in] lparam[string] lparam����
-- @param [in] wparam[string] wparam����
-- @param [in] cobj[userdata] c����ָ��
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name�Ķ���
-- @note ���߳���ȫ
l_tmsg.post = function (name, msg, lparam, wparam, cobj)
	return true
	-- return false
end

-- @brief ������Ϊname����Ϣ�����л�ȡ��Ϣ
-- @param [in] name[string] ��Ϣ��������
-- @return	ret[boolean] 	true��ʾ������
--  \n		msg[string]		��Ϣ
--  \n		lparam[string]	lparam����
--  \n		wparam[string]	wparam����
--  \n 		cobj[userdata]	c����ָ��
-- @note ���߳���ȫ
l_tmsg.get = function (name)
	return true, msg, lparam, wparam, cobj
	-- return false, '', '', '', NULL
end

-- @brief �������Ϊname�Ķ����е�������Ϣ
-- @param [in] name[string] ��Ϣ��������
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name�Ķ���
-- @note ���߳���ȫ
-- \n ע�����ѹ������ݺ���C����, C���󽫲��ᱻ�ͷ�
l_tmsg.clear = function (name)
	return true
	-- return false
end


return l_tmsg
