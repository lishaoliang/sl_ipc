--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_com ͨ����Ӧ����
-- @author  ������
--]]
local string = require("string")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")

local p_com = {}


-- @brief ͨ�û�ȡ������Ŀ, ����ȡ��������
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_com.on_get_cfg = function (req, res, cmd)

	local v = cfg.get(cmd)
	if nil ~= v then
		res[cmd] = v
		res[cmd].code = np_err.OK
	else
		res[cmd] = {
			code = np_err.NOTFOUND
		}
	end
end


-- @brief ͨ�û�ȡ������Ŀ, ����ȡ��������
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_com.on_get_default_cfg = function (req, res, cmd)

	-- ���� ��default_name��, ʵ����Ҫȡ 'name'
	local real_cmd = string.match(cmd, 'default_([%w_]+)')

	local v = cfg.default(real_cmd)
	if nil ~= v then
		res[cmd] = v
		res[cmd].code = np_err.OK
	else
		res[cmd] = {
			code = np_err.NOTFOUND
		}
	end
end

-- @brief ͨ�û�ȡ������Ŀ, ����ȡ��������; ��ͨ��/����ŷ�ʽ
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_com.on_get_cfg_chnn_idx = function (req, res, cmd)

	local key = cmd
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end
	
	local chnn = param['chnn']
	local idx = param['idx']

	if 'number' ~= type(chnn) or
		'number' ~= type(idx) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return
	end
	
	local key_c_i = cfg.key_chnn_idx(key, chnn, idx)

	local v = cfg.get(key_c_i)
	if nil ~= v then
		res[cmd] = v
		res[cmd].code = np_err.OK
		res[cmd].chnn = chnn
		res[cmd].idx = idx
	else
		res[cmd] = {
			code = np_err.NOTFOUND
		}
	end
end


-- @brief ͨ�û�ȡ������Ŀ, ����ȡĬ����������; ��ͨ��/����ŷ�ʽ
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_com.on_get_default_cfg_chnn_idx = function (req, res, cmd)
	
	-- ���� default_stream, ʵ����Ҫȡ 'stream'
	local real_cmd = string.match(cmd, 'default_([%w_]+)')
	
	--
	local key = real_cmd
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end
	
	local chnn = param['chnn']
	local idx = param['idx']

	if 'number' ~= type(chnn) or
		'number' ~= type(idx) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return
	end
	
	local key_c_i = cfg.key_chnn_idx(key, chnn, idx)

	local v = cfg.default(key_c_i)
	if nil ~= v then
		res[cmd] = v
		res[cmd].code = np_err.OK
		res[cmd].chnn = chnn
		res[cmd].idx = idx
	else
		res[cmd] = {
			code = np_err.NOTFOUND
		}
	end
end


-- @brief ͨ�û�ȡ������Ŀ, ����ȡ��������; ��ͨ����ʽ
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_com.on_get_cfg_chnn = function (req, res, cmd)
	
	local key = cmd
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end
	
	local chnn = param['chnn']

	if 'number' ~= type(chnn) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return
	end
	
	local key_c = cfg.key_chnn(key, chnn)

	local v = cfg.get(key_c)
	if nil ~= v then
		res[cmd] = v
		res[cmd].code = np_err.OK
		res[cmd].chnn = chnn
	else
		res[cmd] = {
			code = np_err.NOTFOUND
		}
	end
end


-- @brief ͨ�û�ȡ������Ŀ, ����ȡĬ����������; ��ͨ����ʽ
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_com.on_get_default_cfg_chnn = function (req, res, cmd)

	-- ���� default_image, ʵ����Ҫȡ 'image'
	local real_cmd = string.match(cmd, 'default_([%w_]+)')

	--
	local key = real_cmd
	local param = req.body[cmd]
	
	if 'table' ~= type(param) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return 
	end
	
	local chnn = param['chnn']

	if 'number' ~= type(chnn) then
		res[cmd] = {
			code = np_err.PARAM
		}
		return
	end
	
	local key_c = cfg.key_chnn(key, chnn)

	local v = cfg.default(key_c)
	if nil ~= v then
		res[cmd] = v
		res[cmd].code = np_err.OK
		res[cmd].chnn = chnn
	else
		res[cmd] = {
			code = np_err.NOTFOUND
		}
	end
end


return p_com
