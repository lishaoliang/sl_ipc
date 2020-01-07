--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_ncm.lua
-- @brief   ���ÿ�"l_ncm", ����˵��
-- @version 0.1
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_ncm = {}


-- @brief ����sdk�ӿڲ���
-- @param [in] cb_login[function] ���ӿ�login������ʱ�Ļص�
-- @param [in] cb_logout[function] ���ӿ�logout������ʱ�Ļص�
-- @param [in] cb_request[function] ���ӿ�request������ʱ�Ļص�
-- @return [boolean] �����Ƿ�ɹ�
-- @note 
--  \n [number][number] = cb_login(seq, id, param)
--  \n [in] seq[number] �Ự����
--  \n [in] id[number] ��¼id(������id)
--  \n [in] param[string] ��¼�ַ�������(json)
--  \n return [number] ������
--  \n [number] = cb_logout(seq, id)
--  \n [in] seq[number] �Ự����
--  \n [in] id[number] ��¼id(������id)
--  \n return [number] ������
--  \n [number] = cb_request(seq, id, str_req)
--  \n [in] seq[number] �Ự����
--  \n [in] id[number] ��¼id(������id)
--  \n [in] str_req[string] �����ַ���(json)
--  \n return [number] ������
l_ncm.set_sdk = function (cb_login, cb_logout, cb_request)
	return 0
end


l_ncm.set_sdk_discover = function (cb_discover_open, cb_discover_close, cb_discover_run, cb_discover_get_devs, cb_discover_request)
	return 0
end

-- @brief �ظ�sdk����
-- @param [in] seq[number]	�Ự���к�
-- @param [in] id[number]	��¼id
-- @param [in] code[number]	������
-- @param [in] str_res[string] �ı�����
-- @return [boolean] �Ƿ�ظ��ɹ�
l_ncm.response_sdk = function (seq, id, code, str_res)
	return true
end


-- @brief �������ݻص�������
-- @param [in] cb[function] �������������ݵĻص�����
-- @return [boolean] �����Ƿ�ɹ�
-- @note [number] = cb(id, protocol, body)
--  \n [in] id[number] ����id
--  \n [in] protocol[number] Э��ֵ;�ο� base.np_id
--  \n [in] body[string] �ͻ��˷��͹������ı�������
--  \n return [number] 0.��ʾ��������; ��0.�Ͽ�����
l_ncm.set_recv = function (cb)
	return true
	-- return false
end


-- @brief �������ӶϿ��Ļص�������
-- @param [in] cb[function] �����ӶϿ��Ļص�����
-- @return [boolean] �����Ƿ�ɹ�
-- @note [number] = cb(id, code)
--  \n [in] id[number] ����id
--  \n [in] code[number] ������
--  \n return [number] 0.�ɹ�
l_ncm.set_disconnect = function (cb)
	return true
	-- return false
end


-- @brief �����緢������
-- @param [in] id[number]	���͵�����id
-- @param [in] body[string] �ı�����
-- @return [boolean] �����Ƿ��ͳɹ�
l_ncm.send = function (id, body)
	return true
	-- return false
end


-- @brief ��������
-- @param [in] ip[string]	Ŀ��ip
-- @param [in] port[number]	Ŀ��˿�
-- @param [in] id[number]	�ͻ���id(������id)
-- @param [in] protocol[number] Ŀ��Э��(Ĭ��np_id.NSPP)
-- @return [boolean] �Ƿ�������
-- @note ��ֻ�Ƿ�������, �Ƿ����ӳɹ�, �� set_recv�Ļص������и������
l_ncm.connect = function (ip, port, id, protocol)
	return true,10000
	-- return false,0
end


-- @brief ��ȡncm����
-- @param [in] name[string] ��������: 'upgrade'
-- @return [nil, l_ncm_x] ����l_ncm_x����
l_ncm.get_ncm = function (name)
	return nil
	-- return l_ncm_x
end


return l_ncm
