--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/23
--
-- @file    l_file.lua
-- @brief   ���ÿ� require("l_file"), �ṩ�������ļ���д
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/4/23 0.1 �����ļ�
-- @warning û�о���
--]]

local l_file = {}


-- @brief ���ļ�
-- @param [in]	file_path[string]	�ļ�·��
-- @param [in]	wrb[string]			�򿪷�ʽ: 'wb', 'rb', 'rb+'
-- @return [nil, l_file] nil.��ʧ��; ��nil.�򿪳ɹ�
l_file.open = function (file_path, wrb)
	return nil
	-- return l_file
end

-- @brief �ر��ļ�
-- @param [in]	file[l_file]	�ļ�����
-- @return ��
l_file.close = function (file)
	return
end

-- @brief ��λ�ļ�
-- @param [in]	file[l_file]	�ļ�����
-- @param [in]	offset[number]	�������
-- @param [in]	origin[string]	��λ��ʽ: 'seek_set', 'seek_cur', 'seek_end'
-- @return [boolean] true.�ɹ�; false.ʧ��
-- @note
--  \n 'seek_set' : ���ļ���ͷ
--  \n 'seek_cur' : �ӵ�ǰλ��
--  \n 'seek_end' : ���ļ�ĩβ����
l_file.seek = function (file, offset, origin)
	return true
end


-- @brief ��ȡ��ǰ�ļ�λ��
-- @param [in]	file[l_file]	�ļ�����
-- @return [number] �����ļ�λ��
l_file.tell = function(file)
	return 0
end


-- @brief ��ȡ����������
-- @param [in]	file[l_file]	�ļ�����
-- @param [in]	size[number]	(��ѡ)��ȡ��С: Ĭ��32K
-- @return [nil, l_buf] nil.û�ж�ȡ���ݻ��ļ�����; l_buf���������ݻ���
--  \n size[number]		���������ݴ�С
l_file.read = function (file, size)
	return nil, 0
	-- return l_buf, 30 * 1024
end

-- @brief ���ļ�д�뻺������
-- @param [in]	file[l_file]	�ļ�����
-- @param [in]	buf[l_buf]		�������
-- @return [boolean] true.�ɹ�; false.ʧ��
--  \n 		size[number]		д������ݴ�С
l_file.write = function (file, buf)
	return false, 0
	-- return true, 30 * 1024
end

-- @brief ͬ��file�ļ�ϵͳ����
-- @param [in]	file[l_file]	�ļ�����
-- @return ��
l_file.flush = function (file)
	return 
end

return l_file
