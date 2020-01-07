--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_ipc.lua
-- @brief   ���ÿ�"l_ipc", IPC�����ҵ��
-- @version 0.1
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_ipc = {}


-- @brief ��ʼ��
-- @return [number] ���ش�����
l_ipc.init = function ()
	return 0
	-- return 1
end


-- @brief ����ʼ��
l_ipc.quit = function ()
	
end


-- @brief start
-- @return [number] ���ش�����
l_ipc.start = function ()
	return 0
	-- return 
end

-- @brief stop
l_ipc.stop = function ()

end


-- @brief ��ȡ����ý�����ӿ�
-- @return LUA_TLIGHTUSERDATA ������ָ��
-- @note ptr������C����ԭ��
-- \n typedef int(*ldev_stream_cb)(int chnn, ldev_stream_id_e id, l_md_fmt_e fmt, ldev_stream_t* p_stream);
l_ipc.get_push_stream = function ()
	return ptr -- LUA_TLIGHTUSERDATA
end


-- @brief ��ģ�����socket
-- @param [in]	l_socket[l_socket]	l_socket����
-- @param [in]	id[number]			socket��id���
-- @param [in]	proto_main[number]	��Э��
-- @param [in]	proto_sub[number]	��Э��
-- @return [boolean] true.�ɹ�; false.ʧ��, ʧ��ʱ��������Ҫ���д���l_socket
l_ipc.push = function (l_socket, id, proto_main, proto_sub)
	return true
	-- return false
end


return l_ipc
