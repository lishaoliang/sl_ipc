--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/11/15
--
-- @file    libl_lif.so
-- @brief   ����Э��ӿ�; ���ļ�ģ������libl_lif.so����lua�ӿ���
-- @version 0.1
-- @author  ������
--]]

local l_lif = {}



-- @brief ��ʼ��sdk
-- @param [in] cfg[string]	json�ַ��� 
-- @return [number] 0.�ɹ�; ��0.������
l_lif.init = function (cfg)
	return 0
end


-- @brief �˳�sdk
l_lif.quit = function ()
	
end


-- @brief ��¼�豸
-- @param [in] param[string]	json�ַ��� 
-- @return [number] err			������
l_lif.login = function (param)
	return err
end


-- @brief �ǳ��豸
-- @return [number] err ������
l_lif.logout = function ()
	return err
end


-- @brief ��������
-- @param [in] str_req[string]	����json�ַ���
-- @return err[number] ������
-- @return str_res[string] err=0ʱ,�ӷ���˻ظ�������
l_lif.request = function (str_req)
	return err, str_res
end


return l_lif
