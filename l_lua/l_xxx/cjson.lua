--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    cjson.lua
-- @brief   ���ÿ� require("cjson"), ����˵��
--  \n ���ÿ� require("cjson.safe"), ���׳��쳣�汾
-- @version 2.1.0
-- @author  Mark Pulford
--  \n Դ���ַ: 
--  \n �ٷ��ֲ�: 
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
-- @note ע��ʹ�� ���õ�cjson����׳��쳣
--]]
local cjson = {}


-- @brief ����������json
-- @param [in] t[table] table����
-- @return [string] json�ַ���
cjson.encode = function (t)
	return ''
end


-- @brief ��json�ַ��������table����
-- @param [in] json[string] json�ַ���
-- @return [table] table����
-- @note ע��˺������׳��쳣, ���÷�������
-- local ret, obj = pcall(cjson.decode, txt)
cjson.decode = function (json)
	return {}
end


return cjson
