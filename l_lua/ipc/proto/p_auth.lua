--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_auth Ȩ�޲���Э��
-- @author  ������
--]]
local string = require("string")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")

local user = require("ipc.auth.user")

local p_auth = {}

-- brief ����
-- res [table]	�ظ�����
-- cmd [string] �����ַ���[azAZ09_]����� ��������
p_auth.on_login = function (req, res, cmd)

	local ret, llssid, llauth= user.login(nil)

	res[cmd] = {
		code = ret,
		llssid = llssid,
		llauth = llauth
	}
end

-- brief �ǳ�
-- res [table]	�ظ�����
-- cmd [string] �����ַ���[azAZ09_]����� ��������
p_auth.on_logout = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end

return p_auth
