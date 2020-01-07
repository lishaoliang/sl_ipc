--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/20
--
-- @file    l_nsm_a.lua
-- @brief   ���ÿ�require("l_nsm_a"), net server man armģ��
--  \n require("l_net_a")
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/14/20 0.1 �����ļ�
-- @warning û�о���
--]]

local l_nsm_a = {}


-- @brief ����nsm����
-- @param [in]  	name[string]		nsm����
-- @param [in]  	l_skdr[l_skdr_a]	l_skdr_a����userdata(lightuserdata)
-- @return [nil, l_nsm_a] �����ɹ���l_nsm_a����
-- @note
--  \n ���̰߳�ȫ; ������l_net_a.init֮��, l_net_a.start֮ǰ����
l_nsm_a.create = function (name, l_skdr)
	return l_nsm
	-- return nil
end


-- @brief ��ȡnsm����
-- @param [in]  	name[string]	nsm����
-- @return [nil, l_nsm_a] �����ɹ���l_nsm_a����
-- @note
--  \n ���̰߳�ȫ;
l_nsm_a.get = function (name)
	return l_nsm
	-- return nil
end


-- @brief ��socket����nsmģ�����
-- @param [in]	l_nsm[l_nsm_a]			nsm����
-- @param [in]	l_socket[l_socket_a]	��������l_nmps_a.get_socket�����õ�l_socket
-- @param [in]	id[number]				����id
-- @param [in]	proto_main[number] 		��Э��
-- @param [in]	proto_sub[number] 		��Э��
-- @return [boolean] true.�ɹ�; false.ʧ��
-- @note false.ʧ�ܺ�, �����д��� l_socket
l_nsm_a.push = function (l_nsm, l_socket, id, proto_main, proto_sub)
	return true
end


-- @brief �ر�ֵΪid��socket
-- @param [in]	l_nsm[l_nsm_a]			nsm����
-- @param [in]	id[number]				����id
-- @return [boolean] true.�ɹ�; false.ʧ��
l_nsm_a.close = function (l_nsm, id)
	return true
end


-- @brief ��id�����ı�����
-- @param [in]	l_nsm[l_nsm_a]	nsm����
-- @param [in]	id[number]		����id
-- @param [in]	body[string]	�ı��ַ���
-- @return [boolean] true.�ɹ�; false.ʧ��
l_nsm_a.send = function (l_nsm, id, body)
	return true
end


-- @brief ��nsm�л�ȡ�ı�����
-- @param [in]	l_nsm[l_nsm_a]	nsm����
-- @return [boolean]			true.������; false.������
--  \n 		code[number]		0.�ɹ�; ��0.���������
--  \n		body[string]		�������ȡ���ַ���
--  \n		id[number]			����id
--  \n		proto_main[number]	��Э��
--  \n		proto_sub[number]	��Э��
l_nsm_a.recv = function (l_nsm)
	return false, 0, '', id, proto_main, proto_sub
end


-- @brief ��id���ͷ��ı�����(ý��OR������)
-- @param [in]	l_nsm[l_nsm_a]	nsm����
-- @param [in]	id[number]		����id
-- @param [in]	l_buf[l_buf]	�������
-- @return [boolean]			true.�ɹ�; false.ʧ��
l_nsm_a.send_md = function (l_nsm, id, l_buf)
	return true
	-- return false		-- ���� falseʱ, ��������Ҫ�������� l_buf
end


-- @brief ��nsm�л�ȡý��(������)����
-- @param [in]	l_nsm[l_nsm_a]	nsm����
-- @return [l_buf]				nil������, lightuserdata
--  \n		id[number]			����id
--  \n		proto_main[number]	��Э��
--  \n		proto_sub[number]	��Э��
l_nsm_a.recv_md = function (l_nsm)
	return nil, id, proto_main, proto_sub
	-- return l_buf, id, proto_main, proto_sub
end

return l_nsm_a
