--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_tpool_thread.lua
-- @brief   ��l_tpool.open_thread()����������ȫuserdata
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_tpool_thread = {}


-- @brief �ر��߳�
l_tpool_thread:close = function ()

end


-- @brief ���߳�post��Ϣ
-- @param [in] msg[string]	��Ϣ
-- @param [in] lparam[string] lparam����
-- @param [in] wparam[string] wparam����
-- @param [in] cobj[userdata] c����ָ��
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊ�߳��Ѿ�close
l_tpool_thread:post = function (msg, lparam, wparam, cobj)
	return true
	-- return false
end


-- @brief ��ȡ�߳�����
-- @return [string] �����ַ���
l_tpool_thread:name = function ()
	return 'aaa'
end

-- @brief ��ȡ�߳�����״̬
-- @return [string] 'run' �� 'close'
l_tpool_thread:status = function ()
	return 'run'
	-- return 'close'
end

-- @brief ��ȡ�̵߳�������Ŀ
-- @return ret[boolean] true:��ʾ�߳�������; false:��ʾ�߳�close��
-- \n 		num[number]	���Ϊtrue,���ʾ��ǰִ�е�������Ŀ
l_tpool_thread:job_size = function ()
	return false, 0
	--return true, 1
end


return l_tpool_thread
