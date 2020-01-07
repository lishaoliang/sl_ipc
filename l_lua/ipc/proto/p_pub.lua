--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_pub Э�����
-- @author  ������
--]]
local string = require("string")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")

local p_pub = {}

-- brief hello����
-- @param [in]		req[table]	����
-- res [table]	�ظ�����
-- cmd [string] �����ַ���[azAZ09_]����� ��������
p_pub.on_hello = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK,
		msg = 'welcome!'
	}
end

-- brief ���������Կ
-- res [table]	�ظ�����
-- cmd [string] �����ַ���[azAZ09_]����� ��������
p_pub.on_encrypt = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK,
		type = 'none',
		key = '123456'
	}
end

return p_pub
