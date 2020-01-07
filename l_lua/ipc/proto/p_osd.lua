--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief p_image image��������Э��
-- @author  ������
--]]
local string = require("string")
local cjson = require("cjson")
local np_err = require("base.np_err")
local cfg = require("ipc.cfg.cfg")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")


local p_osd = {}


-- @brief ����OSD����ͨ�ô�����
-- @param [in]		osd_key[string]	osd��������keyֵ
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
local set_osd_xxx = function (osd_key, req, res, cmd)
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
	
	local key_c = cfg.key_chnn(osd_key, chnn)	
	local ret, json, code = cfg.set(key_c, param)
	
	if ret then
		local obj_chnn = {
			chnn = chnn
		}
		
		local str_chnn = cjson.encode(obj_chnn)
		iworker.post(iworker.lw_dev_ipc, osd_key, json, str_chnn)
		
		res[cmd] = {
			code = np_err.OK
		}
	else
		res[cmd] = {
			code = code
		}
	end
end

-- @brief ����OSDʱ���
-- @param [in]		req[table]	����
-- @param [in,out]	res[table]	�ظ�����
-- @param [in]		cmd[string]	����
-- @return ��
p_osd.on_set_osd_timestamp = function (req, res, cmd)
	set_osd_xxx('osd_timestamp', req, res, cmd)
end


return p_osd
