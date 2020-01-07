--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_tpool.lua
-- @brief   ��չ��require("l_tpool"), �ṩ�̳߳�֧��
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_tpool = {}


-- @brief l_tpool ģ���ʼ��
-- @param [in]	ht_size[number]		(��ѡ)hash table ��С(Ĭ��4096, ��С100)
--  \n ���̰߳�ȫ
l_tpool.init = function (ht_size)

end

-- @brief l_tpool ģ���˳�
--  \n ���̰߳�ȫ
l_tpool.quit = function ()

end


-- @brief ��������Ϊname���߳�
-- @param [in] name[string] �߳�����
-- @param [in] tc_sleep[number]	�߳�����ʱ��[����]; ��С1����
-- @param [in] loader_path[string] ����lua����ļ�
-- @param [in] param[string] ���ݸ���lua�����Ĳ���
-- @param [in] cb_loader[userdata] ����lua_env_loader_cb, ����ʹ���Զ�����غ���
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name���߳�
-- @note ���̰߳�ȫ
-- \n ������ʹ��ǰ, �������̴߳�����
l_tpool.create = function (name, tc_sleep, loader_path, param, cb_loader)
	return true
	--return false
end


-- @brief ������Ϊname���߳�post��Ϣ
-- @param [in] name[string] �߳�����
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name���߳�
-- @note ���̰߳�ȫ
l_tpool.destroy = function (name)
	return true
	--return false
end


-- @brief ������Ϊname���߳�post��Ϣ
-- @param [in] name[string] �߳�����
-- @param [in] msg[string]	��Ϣ
-- @param [in] lparam[string] lparam����
-- @param [in] wparam[string] wparam����
-- @param [in] cobj[userdata] c����ָ��
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name���߳�
l_tpool.post = function (name, msg, lparam, wparam, cobj)
	return true
	-- return false
end


-- @brief ��һ���������ҵ�, ��Կ��е��߳�
-- @param [in] t[table] �߳���������
-- @return [string] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name���߳�
-- @note 
--  \n t = {'aaa', 'bbb', 'ccc', 'ddd'} ����ʽ
l_tpool.find_idle = function (t)
	return ''
	-- return 'aaa'
end


-- @brief ��������Ϊname���߳�
-- @param [in] name[string] �߳�����
-- @param [in] tc_sleep[number]	�߳�����ʱ��[����]; ��С1����
-- @param [in] loader_path[string] ����lua����ļ�
-- @param [in] param[string] ���ݸ���lua�����Ĳ���
-- @param [in] cb_loader[userdata] ����lua_env_loader_cb, ����ʹ���Զ�����غ���
-- @return [userdata] ��ȫuserdata
-- @note ������Lua�й�, ����GC������߳�
--  \n �˺������� l_tpool.init, ������l_tpoolȫ��ģ�����
--  \n ֻ��ͨ�����ص�userdata�������߳�
l_tpool.open_thread = function (name, tc_sleep, loader_path, param, cb_loader)
	return l_tpool_thread
end


return l_tpool
