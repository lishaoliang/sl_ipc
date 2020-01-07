--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_user Э�����
-- @author  ������
--]]
local string = require("string")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")

local p_user = {}


-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)
p_user.on_user_add = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end


-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)
p_user.on_user_remove = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end

-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)
p_user.on_user_modify = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end

-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)
p_user.on_user_all = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end

-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)
p_user.on_user_modify_pwd = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end

-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)
p_user.on_user_info = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end


-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)
p_user.on_user_online = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end

return p_user
