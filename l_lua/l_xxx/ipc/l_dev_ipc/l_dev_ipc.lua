--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_dev_ipc.lua
-- @brief   ���ÿ�"l_dev_ipc", IPCӲ���豸���
-- @version 0.1
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_dev_ipc = {}


-- @brief ipcӲ���豸��ʼ��
-- @return [number] ���ش�����
l_dev_ipc.init = function ()
	return 0
	-- return 1
end


-- @brief ipcӲ���豸����ʼ��
l_dev_ipc.quit = function ()
	
end


-- @brief ipcӲ��start
-- @return [number] ���ش�����
l_dev_ipc.start = function ()
	return 0
	-- return 1
end

-- @brief ipcӲ��stop
l_dev_ipc.stop = function ()

end


-- @brief �����������
-- @param [in] name[string] ����
-- @param [in] ptr[LUA_TLIGHTUSERDATA] ������ָ��
-- @note ptr������C����ԭ��
-- \n typedef int(*ldev_stream_cb)(int chnn, ldev_stream_id_e id, l_md_fmt_e fmt, ldev_stream_t* p_stream);
l_dev_ipc.add_listener = function (name, ptr)

end

return l_dev_ipc
