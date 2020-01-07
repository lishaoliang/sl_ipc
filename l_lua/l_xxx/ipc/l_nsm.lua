--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_nsm.lua
-- @brief   ���ÿ�"l_nsm", ����˵��
-- @version 0.1
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_nsm = {}



-- @brief �������ݻص�������
-- @param [in] cb[function] 
-- @return [boolean] �����Ƿ�ɹ�
-- @note [number] = cb(id, protocol, body)
--  \n [in] id[number] ����id
--  \n [in] protocol[number] Э��ֵ;�ο� base.np_id
--  \n [in] body �ͻ��˷��͹������ı�������
--  \n return [number] 0.��ʾ��������; ��0.�Ͽ�����
l_nsm.set_recv = function (cb)
	return true
	-- return false
end

-- @brief �������ӶϿ��ص�������
-- @param [in] cb[function] 
-- @return [boolean] �����Ƿ�ɹ�
-- @note [number] = cb(id, protocol, body)
--  \n [in] id[number] ����id
--  \n [in] protocol[number] Э��ֵ;�ο� base.np_id
--  \n return [number] 0.��ʾ��������; ��0.�Ͽ�����
l_nsm.set_disconnect = function (cb)
	return true
	-- return false
end

-- @brief ��������
-- @param [in] id[number]	���͵�����id
-- @param [in] body[string] �ı�����
-- @return [boolean] �����Ƿ��ͳɹ�
l_nsm.send = function (id, body)
	return true
	-- return false
end


-- @brief ��������ý����
-- @param [in] id[number]	 ���͵�����id
-- @param [in] chnn[number]	 ͨ��
-- @param [in] idx[number]	 �����
-- @param [in] md_id[number] ý��id
-- @return [number]
l_nsm.open_stream =  function (id, chnn, idx, md_id)
	return 0
end


-- @brief �رշ���ý����
-- @param [in] id[number]	 ���͵�����id
-- @param [in] chnn[number]	 ͨ��
-- @param [in] idx[number]	 �����
-- @param [in] md_id[number] ý��id
-- @return [number]
l_nsm.close_stream =  function (id, chnn, idx, md_id)
	return 0
end

-- @brief ��ȡͨ������SPS/PPS(base64�����ַ���)
-- @param [in] chnn[number]	 ͨ��
-- @param [in] idx[number]	 �����
-- @return [string],[string] SPS/PPS
l_nsm.get_sps_pps = function (chnn, idx)
	return '', ''
end

-- @brief ��ȡͨ������SPS/PPS(base64�����ַ���)
-- @param [in] chnn[number]	 ͨ��
-- @param [in] idx[number]	 �����
-- @return [nil, l_obj_buf_t]	���ݿ�
--			size[number]		���������ݴ�С
--			[string]			����: 'jpeg'
l_nsm.get_frame = function (chnn, idx)
	return nil, 0, ''
	-- return xxx, 1200, 'jpeg'
end

return l_nsm
