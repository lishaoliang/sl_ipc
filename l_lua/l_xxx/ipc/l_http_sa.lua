--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/05/07
--
-- @file    l_http_sa.lua
-- @brief   ���ÿ�require("l_http_sa"), http client armģ��
--  \n require("l_net_a")
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/05/07 0.1 �����ļ�
-- @warning û�о���
--]]

local l_http_sa = {}


-- @brief ����http����
-- @param [in]  	name[string]		http����
-- @param [in]  	l_skdr[l_skdr_a]	l_skdr_a����userdata(lightuserdata)
-- @return [nil, l_http_sa] �����ɹ���l_http_ca����
-- @note
--  \n ���̰߳�ȫ; ������l_net_a.init֮��, l_net_a.start֮ǰ����
l_http_sa.create = function (name, l_skdr)
	return l_nsm
	-- return nil
end


-- @brief ��ȡhttp����
-- @param [in]  	name[string]	nsm����
-- @return [nil, l_http_sa] �����ɹ���l_nsm_a����
-- @note
--  \n ���̰߳�ȫ;
l_http_sa.get = function (name)
	return l_nsm
	-- return nil
end


-- @brief ��socket����httpģ�����
-- @param [in]	http[l_http_sa]			http����
-- @param [in]	l_socket[l_socket_a]	��������l_nmps_a.get_socket�����õ�l_socket
-- @param [in]	id[number]				����id
-- @param [in]	proto_main[number] 		��Э��
-- @return [boolean] true.�ɹ�; false.ʧ��
-- @note false.ʧ�ܺ�, �����д��� l_socket
l_http_sa.push = function (http, l_socket, id, proto_main)
	return true
end


-- @brief �ر�ֵΪid��socket
-- @param [in]	http[l_http_sa]	http����
-- @param [in]	id[number]		����id
-- @return [boolean] true.�ɹ�; false.ʧ��
l_http_sa.close = function (http, id)
	return true
end


-- @brief ��id�����ı�����
-- @param [in]	http[l_http_sa]	http����
-- @param [in]	id[number]		����id
-- @param [in]	body[string]	�ı��ַ���
-- @return [boolean] true.�ɹ�; false.ʧ��
l_http_sa.send = function (http, id, body)
	return true
end


-- @brief ��http�л�ȡ�ı�����
-- @param [in]	http[l_http_sa]	http����
-- @return [boolean]			true.������; false.������
--  \n 		code[number]		0.�ɹ�; ��0.���������
--  \n		head[string]		httpͷ��
--  \n		body[string]		http��body
--  \n		id[number]			����id
--  \n		proto_main[number]	��Э��
l_http_sa.recv = function (http)
	return false, 0, '', '', id, proto_main
end

return l_http_sa
