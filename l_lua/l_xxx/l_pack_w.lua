--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/04/26
--
-- @file    l_pack_w.lua
-- @brief   ��չ��require("l_pack_w"), ���
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/04/26 0.1 �����ļ�
-- @warning û�о���
--]]

local l_pack_w = {}


-- @brief ��һ��������(д����, ʹ��'wb'��ʽ���ļ�)
-- @param [in]	path_name[string]	��·����
-- @param [in]	offset[number]		[��ѡ,Ĭ��0]�ļ���ʼƫ��
-- @return [nil, l_pack_w] д�������lpkf_w
l_pack_w.open = function (path_name, offset)
	return lpkf_w
	-- return nil
end


-- @brief �ر�д�������lpkf_w
-- @param [in]	lpkf_w[l_pack_w]	д�������lpkf_w
-- @return ��
-- @note �ر��ļ�ʱ, ��������Ϣ,�ļ�ͷ��д�뵽Ŀ�����
l_pack_w.close = function (lpkf_w)
	return
end


-- @brief ������Կ��Ϣ
-- @param [in]	lpkf_w[l_pack_w]	д�������lpkf_w
-- @param [in]	key[string]			��Կ��Ϣ[1,1024]
-- @return [boolean] true.�ɹ�; false.ʧ��
-- @note ������ open֮��, add֮ǰ����
l_pack_w.enc = function (lpkf_w, key)
	return true
end



-- @brief ����ļ���д�������lpkf_w
-- @param [in]	lpkf_w[l_pack_w]	д�������lpkf_w
-- @param [in]	key_path[string]	�ؼ���: ����'/opt/aaa.lua'
-- @param [in]	path_name[string]	����ӵ��ļ�·����
-- @return [number] 0.ʧ��; ����0.����ļ��Ĵ�С
l_pack_w.add = function (lpkf_w, key_path, path_name)
	return 0
end


return l_pack_w
