--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/04/26
--
-- @file    l_pack.lua
-- @brief   ��չ��require("l_pack"), ���
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/04/26 0.1 �����ļ�
-- @warning û�о���
--]]

local l_pack = {}


-- @brief У����Ƿ�OK
-- @param [in]	path_name[string]	��·����
-- @param [in]	offset[number]		[��ѡ,Ĭ��0]�ļ���ʼƫ��
-- @return [boolean] true.ͨ��У��; false.δͨ��У��
l_pack.check = function (path_name, offset)
	return true
	-- return false
end


-- @brief ��һ��������(д����, ʹ��'rb'��ʽ���ļ�)
-- @param [in]	path_name[string]	��·����
-- @param [in]	offset[number]		[��ѡ,Ĭ��0]�ļ���ʼƫ��
-- @return [nil, l_pack] ��ȡ������lpkf_r
l_pack.open = function (path_name, offset)
	return lpkf_r
	-- return nil
end


-- @brief �رհ�����lpkf_r
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return ��
l_pack.close = function (lpkf_r)
	return
end


-- @brief ��ȡ������lpkf_r����Կ��Ϣ
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return [string]	��Կ��Ϣ. ''Ϊû��
l_pack.enc = function (lpkf_r)
	return ''
end


-- @brief ��ȡ���������ļ���Ŀ
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return [number] �ļ���Ŀ
l_pack.size = function (lpkf_r)
	return 0
end


-- @brief ��ȡ���������ļ�������Ϣ
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return [table] �ļ�������Ϣ
--  \n ����ֵʾ��:
--  \n {
--  \n   {'path':'/opt/aaa.lua','filelen':1024},
--  \n   {'path':'/opt/bbb.lua','filelen':547},
--  \n }
l_pack.files = function (lpkf_r)
	return {}
end


-- @brief �ڰ�������·��
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @param [in]	path[string]	·����,����'/opt/aaa.lua'
-- @return [boolean] true.����������; false.δ����������
-- @note �����Ӳ���
l_pack.iter_search = function (lpkf_r, path)
	return true
	--return false
end


-- @brief ��λ����ʼ
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return [boolean] true.������; false.��������
-- @note �����Ӳ���
l_pack.iter_begin = function (lpkf_r)
	return true
	--return false
end


-- @brief ��һ��
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return [boolean] true.������; false.��������
-- @note �����Ӳ���
l_pack.iter_next = function (lpkf_r)
	return true
	--return false
end


-- @brief ��ȡ��ǰ(������)·��
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return [string] ·��
-- @note �����Ӳ���
l_pack.iter_path = function (lpkf_r)
	return '/opt/aaa.lua'
end


-- @brief ��ȡ��ǰ(������)�ļ���С
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @return [number] �ļ���С
-- @note �����Ӳ���
l_pack.iter_filelen = function (lpkf_r)
	return 1024
end


-- @brief ��ȡ��ǰ(������)����
-- @param [in]	lpkf_r[l_pack]	������lpkf_r
-- @param [in]	offset[number]	ƫ��λ��
-- @param [in]	buf_max[number]	[��ѡ,Ĭ��32K]��󻺴�; range:[4K, 4M]
-- @return [nil, l_buf]	l_buf�������
--  \n  size[number]	��ȡ���ݴ�С
-- @note �����Ӳ���
l_pack.iter_read = function (lpkf_r, offset, buf_max)
	return l_buf, 1024
	-- return nil, 0
end


return l_pack
