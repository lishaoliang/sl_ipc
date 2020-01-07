--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_sdk.lua
-- @brief   ��Ϊ��̬����չ"l_sdk", ����˵��
-- @version 0.1
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_sdk = {}



-- @brief ��ʼ��sdk
-- @param [in] cfg[string]	json�ַ��� 
-- @return [number] 0.�ɹ�; ��0.������
l_sdk.init = function (cfg)
	return 0
end


-- @brief �˳�sdk
l_sdk.quit = function ()
	
end


-- @brief ��¼�豸
-- @param [in] param[string]	json�ַ��� 
-- @return [number] err			������
-- @return [number] id			err=0ʱ, ��Ч�ĵ�¼id
l_sdk.login = function (param)
	return err, id
end


-- @brief �ǳ��豸
-- @param [in] id[number]	��¼id
-- @return [number] err ������
l_sdk.logout = function (id)
	return err
end


-- @brief ��������
-- @param [in] id[number]	��¼id
-- @param [in] str_req[string]	����json�ַ���
-- @return err[number] ������
-- @return str_res[string] err=0ʱ,�ӷ���˻ظ�������
l_sdk.request = function (id, str_req)
	return err, str_res
end


-- @brief �����緢�ַ���
-- @return err[number] ������
l_sdk.discover_open = function (param)
	return 0
end


-- @brief �ر����緢�ַ���
-- @return err[number] ������
l_sdk.discover_close = function ()
	return 0
end

-- @brief ��/�ر�����
-- @param [in] b_open[boolean]	true: ������; false: �ر�����
-- @return err[number] ������
l_sdk.discover_run = function (b_open)
	return 0
end


-- @brief ��ȡ���������豸
-- @return devs[string] �豸��json����
-- @note ǰ������Ϊ: discover_open(), discover_run(true)
l_sdk.discover_get_devs = function ()
	return '{}'
end


-- @brief �鲥����
-- @param [in] str_req[string]	�����json�ַ���
-- @return err[number] ������
--  \ncm	str_res[string] err=0ʱ,�ӷ���˻ظ�������
-- @note ǰ������Ϊ: discover_open()
l_sdk.discover_request = function (str_req)
	return err, str_res
end


return l_sdk
