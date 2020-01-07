--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_net ���粿��Э��
-- @author  ������
--]]
local string = require("string")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")

local p_net = {}


-- @brief ����ipv4
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_net.on_set_ipv4 = function (req, res, cmd)
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end	
	
	local ret, json, code = cfg.set('ipv4', param)
	
	if ret then
		imsg.post(imsg.update_phynet, 'ipv4', json, '')
		
		res[cmd] = {
			code = np_err.OK
		}
	else
		res[cmd] = {
			code = code
		}
	end
end

p_net.on_set_wireless = function (req, res, cmd)

	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end
	
	local ret, json, code = cfg.set('wireless', param)
	
	if ret then
		imsg.post(imsg.update_phynet, 'wireless', json, '')
		
		res[cmd] = {
			code = np_err.OK
		}
	else
		res[cmd] = {
			code = code
		}
	end
end


-- @brief ��������ipv4
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_net.on_set_wireless_ipv4 = function (req, res, cmd)
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end	
	
	local ret, json, code = cfg.set('wireless_ipv4', param)
	
	if ret then
		imsg.post(imsg.update_phynet, 'wireless_ipv4', json, '')
		
		res[cmd] = {
			code = np_err.OK
		}
	else
		res[cmd] = {
			code = code
		}
	end
end

-- @brief ���ö˿�
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_net.on_set_net_port = function (req, res, cmd)
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end	
	
	local ret, json, code = cfg.set('net_port', param)
	
	if ret then
		--imsg.post(imsg.update_wifi, 'net_port', json, '')
		
		res[cmd] = {
			code = np_err.OK
		}
	else
		res[cmd] = {
			code = code
		}
	end
end

return p_net
