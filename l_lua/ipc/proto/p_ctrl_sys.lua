--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_ctrl_sys ϵͳ����Э��
-- @author  ������
--]]
local string = require("string")
local l_ctrl_sys = require("l_ctrl_sys")

local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")


local p_ctrl_sys = {}


-- @brief ��������
-- @param [in]  	req[table]	����
-- @param [out]		res[table]	�ظ�����
-- @param [in]		cmd[string]	�����ַ���[azAZ09_]����� ��������
-- @return �޷���ֵ
p_ctrl_sys.on_test = function (req, res, cmd)

	res[cmd] = {
		code = np_err.OK
	}
end


-- @brief ����
-- @param [in]  	req[table]	����
-- @param [out]		res[table]	�ظ�����
-- @param [in]		cmd[string]	�����ַ���[azAZ09_]����� ��������
-- @return �޷���ֵ
p_ctrl_sys.on_ctrl_reboot = function (req, res, cmd)
	
	--l_ctrl_sys.reboot()

	res[cmd] = {
		code = np_err.OK
	}
end

return p_ctrl_sys
