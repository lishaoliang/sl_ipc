--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_cfg ���ò�������Э��
-- @author  ������
--]]
local string = require("string")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")

local p_cfg = {}


-- @brief ��������
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_cfg.on_cfg_export = function (req, res, cmd)

	res[cmd] = {
		code = np_err.OK
	}
end


-- @brief ��������
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_cfg.on_cfg_inport = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end


-- @brief ���׻ظ�����
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_cfg.on_cfg_default = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end

-- @brief ���״󲿷�����
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_cfg.on_cfg_default_all = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end


return p_cfg
