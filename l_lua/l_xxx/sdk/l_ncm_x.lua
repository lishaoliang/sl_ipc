--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/20
--
-- @file    l_ncm_x.lua
-- @brief   ���ÿ�require("l_ncm_x"), net client man x86ģ��
--  \n require("l_ncm_x")
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/14/20 0.1 �����ļ�
-- @warning û�о���
--]]

local l_ncm_x = {}


-- @brief ����nsm����
-- @param [in]  	name[string]	nsm����
-- @param [in]  	l_skdr[l_skdr_x]	l_skdr_x����userdata(lightuserdata)
-- @return [nil, l_ncm_x] �����ɹ���l_ncm_x����
-- @note
--  \n ���̰߳�ȫ; ������l_net_x.init֮��, l_net_x.start֮ǰ����
l_ncm_x.create = function (name, l_skdr)
	return l_ncm
	-- return nil
end


-- @brief ��ȡnsm����
-- @param [in]  	name[string]	nsm����
-- @return [nil, l_ncm_x] �����ɹ���l_ncm_x����
-- @note
--  \n ���̰߳�ȫ;
l_ncm_x.get = function (name)
	return l_ncm
	-- return nil
end


-- @brief ʹ��proto_main:proto_subЭ�� ��ip:port ��������
-- @param [in]	l_ncm[l_ncm_x]			ncm����
-- @param [in]	id[number]				����id
-- @param [in]	proto_main[number] 		��Э��
-- @param [in]	proto_sub[number] 		��Э��
-- @param [in]	ip[string]				IP��ַ
-- @param [in]  port[number]			�˿�
-- @return [boolean] true.�ɹ�; false.ʧ��
l_ncm_x.connect = function (l_ncm, id, proto_main, proto_sub, ip, port)
	return true
	-- return false
end



-- @brief �ر�ֵΪid��socket
-- @param [in]	l_ncm[l_ncm_x]			nsm����
-- @param [in]	id[number]				����id
-- @return [boolean] true.�ɹ�; false.ʧ��
l_ncm_x.close = function (l_ncm, id)
	return true
end


-- @brief ��id�����ı�����
-- @param [in]	l_ncm[l_ncm_x]	nsm����
-- @param [in]	id[number]		����id
-- @param [in]	body[string]	�ı��ַ���
-- @return [boolean] true.�ɹ�; false.ʧ��
l_ncm_x.send = function (l_ncm, id, body)
	return true
end


-- @brief ��nsm�л�ȡ�ı�����
-- @param [in]	l_ncm[l_ncm_a]	nsm����
-- @return [boolean]			true.������; false.������
--  \n 		code[number]		0.�ɹ�; ��0.���������
--  \n		body[string]		�������ȡ���ַ���
--  \n		id[number]			����id
--  \n		proto_main[number]	��Э��
--  \n		proto_sub[number]	��Э��
l_ncm_x.recv = function (l_ncm)
	return false, 0, '', id, proto_main, proto_sub
end


-- @brief ��id���ͷ��ı�����(ý��OR������)
-- @param [in]	l_ncm[l_ncm_a]	nsm����
-- @param [in]	id[number]		����id
-- @param [in]	l_buf[l_buf]	�������
-- @return [boolean]			true.�ɹ�; false.ʧ��
l_ncm_x.send_md = function (l_ncm, id, l_buf)
	return true
	-- return false		-- ���� falseʱ, ��������Ҫ�������� l_buf
end


-- @brief ��nsm�л�ȡý��(������)����
-- @param [in]	l_ncm[l_ncm_a]	ncm����
-- @return [l_buf]				nil������, lightuserdata
--  \n		id[number]			����id
--  \n		proto_main[number]	��Э��
--  \n		proto_sub[number]	��Э��
l_ncm_x.recv_md = function (l_ncm)
	return nil, id, proto_main, proto_sub
	-- return l_buf, id, proto_main, proto_sub
end

return l_ncm_x
