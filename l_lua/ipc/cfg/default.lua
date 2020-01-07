--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  Ĭ�����ô���ģ��
-- @author ������
--]]
local util = require("base.util")

local default = {}

default.default_v = require("ipc.cfg.default_v")
default.default_r = require("ipc.cfg.default_r")

default.keys = {}


-- @brief ��ʼ��
--  \n ��ʼ��keys 
default.init = function ()
	local t = {}
	
	for k, v in pairs(default.default_v) do
		if 'string' == type(k) then
			table.insert(t, k)
		end
	end

	for k, v in pairs(default.default_r) do
		if 'string' == type(k) and nil == t[k] then
			table.insert(t, k)
		end
	end
	
	default.keys = t
end



-- brief ��ȡ�ɱ�������Ŀ
-- key [string]		  ��������
-- return [nil,table] ������������, ��������ʹ��
default.get_v = function (key)
	local value = default.default_v[key]
	
	if nil ~= value then
		-- Ĭ�����õ����ݲ��ñ��ⲿ��Ⱦ
		return util.t_copy(value)
	end
	
	return nil
end

-- brief ��ȡֻ����
-- key [string]		  ��������
-- return [nil,table] ������������, ��������ʹ��
default.get_r = function (key)
	local value = default.default_r[key]
	
	if nil ~= value then
		-- Ĭ�����õ����ݲ��ñ��ⲿ��Ⱦ
		return util.t_copy(value)
	end
	
	return nil
end

return default
