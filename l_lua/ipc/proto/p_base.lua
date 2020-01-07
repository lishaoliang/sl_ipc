--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_base base��������Э��
-- @author  ������
--]]
local string = require("string")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")
local cjson = require("cjson.safe")

local p_base = {}


-- @brief �����豸����
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_base.on_set_name = function (req, res, cmd)
	
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end	
	
	local ret, json, code = cfg.set('name', param)
	
	if ret then
		--imsg.post(imsg.update_wifi, 'name', json, '')
		
		res[cmd] = {
			code = np_err.OK
		}
	else
		res[cmd] = {
			code = code
		}
	end
end


-- @brief ��ȡ�豸ʱ��
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_base.on_time = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end


-- @brief �����豸ʱ��
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_base.on_set_time = function (req, res, cmd)
	
	res[cmd] = {
		code = np_err.OK
	}
end


-- @brief ����NTP
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_base.on_set_ntp = function (req, res, cmd)
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end	
	
	local ret, json, code = cfg.set('ntp', param)
	
	if ret then
		iworker.post(iworker.lw_dev_ipc, 'ntp', json, '{}')	
		
		res[cmd] = {
			code = np_err.OK
		}
	else
		res[cmd] = {
			code = code
		}
	end
end


-- @brief ��������ntpͬ��
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_base.on_ntp_sync = function (req, res, cmd)
	local param = req.body[cmd]
	
	if 'table' ~= type(param) and
		'string' ~= type(param['server'])
		'number' ~= type(param['port']) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end
	
	local o = {
		server = param['server'],
		port = param['port']
	}
	
	local json = cjson.encode(o)
	iworker.post(iworker.lw_dev_ipc, 'ntp_sync', json, '{}')
		
	res[cmd] = {
		code = np_err.OK
	}
end


return p_base
