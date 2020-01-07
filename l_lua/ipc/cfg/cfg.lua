--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  ����������
-- @author ������
--]]
local string = require("string")
local cjson = require("cjson")
local l_cfg = require("l_cfg")

local util = require("base.util")
local np_err = require("base.np_err")

local default = require("ipc.cfg.default")

local cfg = {}


-- brief �����ļ��汾
-- note  ÿ���޸�������Ŀ, �����޸����ð汾[���� <= 15]
cfg.version = 'v1.0.8'


-- brief ��ȡ��ǰkey�Ŀɱ�����ֵ
-- key [string]		  ��������
-- return [nil,table] ������������, ��������ʹ��
local get_cur_cfg_v = function (key)
	-- ��ȡĬ��ֵ
	local def_v = default.get_v(key)
	
	if nil ~= def_v then
		
		-- �������ļ���ȡ����, ���ȡ������, ���������
		local str = l_cfg.get(key)
		if 0 < string.len(str) then
			local ret, f_v = pcall(cjson.decode, str)		
			if ret then
				util.t_cp_by(def_v, f_v)
			end
		end
	end
	
	-- ���շ��� = Ĭ��ֵ ���� �޸�ֵ
	return def_v
end

-- brief ��ȡ����
-- key [string]		  ��������
-- return [nil,table] ������������, ��������ʹ��
cfg.get = function (key)
	
	local def_v = get_cur_cfg_v(key)	
	local def_r = default.get_r(key)	
	
	local u = util.t_union(def_v, def_r)	-- ��ǰֵ �� ֻ��ֵ����
	return u
end

-- brief ��ȡĬ������
-- key [string]		  ��������
-- return [nil,table] ������������, ��������ʹ��
cfg.default = function (key)
	local def_v = default.get_v(key)
	local def_r = default.get_r(key)
	
	local u = util.t_union(def_v, def_r)	-- Ĭ��ֵ �� ֻ��ֵ����	
	return u
end


-- brief У�����ò�����Ϣ
-- param [table]	��������
-- r [table]	����ֵ
-- return [boolean]	true.ͨ��У��; false.��������
local check_param = function (param, r)
	-- ����. r.range ���б�������������Χ
	-- δ�� r.range ��Լ���ķ�Χ, ��ʹ��Э��Լ��ֵ
	local n_min = 0		-- number.min
	local n_max = 100	-- number.max
	
	local s_l_min = 0	-- string len .min
	local s_l_max = 128	-- string len .max

	if not util.t_is_not_empty(param) then
		return false	-- ������ table, ��������
	end
	
	local range = util.t_item(r, 'range')
	
	for k, v in pairs(param) do
		if 'string' == type(k) then
			local t = type(v)		
			if 'number' == t then
				local n_keys = util.t_item(range, k)
				if util.t_is_array(n_keys) then
					-- Լ����ֵȡֵ
					local b_in_keys = false
					for m, n in ipairs(n_keys) do
						if n == v then
							b_in_keys = true
							break
						end
					end
					
					if not b_in_keys then
						return false	-- ���ڸ����ķ�Χ
					end
				else
					-- Լ����ֵȡֵ��Χ
					local min = util.t_item(range, k, 'min') or n_min
					local max = util.t_item(range, k, 'max') or n_max
				
					if v < min or max < v then
						return false
					end
				end
			elseif 'string' == t then
				local s_keys = util.t_item(range, k)				
				if util.t_is_array(s_keys) then
					-- Լ���ַ���ȡֵ��Χ
					local b_in_keys = false
					for m, n in ipairs(s_keys) do
						if n == v then
							b_in_keys = true
							break
						end
					end
					
					if not b_in_keys then
						return false	-- ���ڸ����ķ�Χ
					end
				else
					-- ����, Լ��Ϊ�޶����ȷ�Χ
					local len = string.len(v)
					if len < s_l_min or s_l_max < len then
						return false
					end
				end
			else
				-- ���������
			end
		end
	end
	
	return true
end


local set_cfg = function (key, value, save)
	-- ��ȡ��ǰֵ
	local v = get_cur_cfg_v(key)
	if nil == v then
		return false, '{}', np_err.NOTFOUND
	end
	
	-- ���µ�ǰֵ
	util.t_cp_by(v, value)

	-- ��ȡֻ��ֵ
	local r = default.get_r(key)

	-- ͳһ�������
	if not check_param(v, r) then
		return false, '{}', np_err.PARAM
	end
	
	-- ����
	local code = np_err.SAVE
	local json = cjson.encode(v)
	local ret = l_cfg.set(key, json)
		
	--print('cfg.set:', ret, json)
	if ret and save then
		l_cfg.save() --�����ļ�
		code = np_err.OK
	end
	
	return ret, json, code
end

-- brief ��������
-- key [string]		��������
-- value [table]	����ֵ
-- return ret[boolean]	�Ƿ����óɹ�
--		v[string]		�����õ�json�ַ���
--		code[number]	������
cfg.set = function (key, value)
	local ret, json, code = set_cfg(key, value, true)
	
	return ret, json, code
end

-- @brief ��ȡ���� ͨ��, ����Ź�������ʵ����key
cfg.key_chnn_idx = function (key, chnn, idx)
	local txt = string.format('%s_chnn%d_idx%d', key, chnn, idx)
	return txt
end


-- @brief ��ȡ���� ͨ����ʵ����key
cfg.key_chnn = function (key, chnn)
	local txt = string.format('%s_chnn%d', key, chnn)
	return txt
end


-- @brief ��ȡ���� �û��йص���ʵ����key
cfg.key_user_index = function (index)
	local txt = string.format('user_name%d', index)
	return txt
end

-- @brief ��ȡ��ǰ���е�keyֵ
cfg.keys = function ()
	return util.t_copy(default.keys)
end


-- brief ���ó�ʼ��
cfg.init = function ()
	
	-- ��ʼ��C����ģ��
	l_cfg.init(cfg.version)

	-- ��������ļ��Ƿ�����쳣, �����쳣���޸�����ǰ�汾
	if not l_cfg.is_ok() then
		print('lua cfg is not ok, repair!')
		
		for k, v in pairs(default.default_v) do
			if 'string' == type(k) then
				local str = l_cfg.get_old(k)
				if 0 < string.len(str) then
					local dec, o = pcall(cjson.decode, str)
					if dec then
						set_cfg(k, o, false)
					end
				end
			end	
		end
		
		-- �����ļ�
		l_cfg.save()
	end

	--local test = {
	--	name = 'hello world!'
	--}
	
	--cfg.set('system', test)
	--l_cfg.save()
end


-- brief �����˳�
cfg.quit = function ()
	l_cfg.quit()
end

-- brief ��λ����
cfg.reset = function()
	l_cfg.reset()	-- ��λ�ڴ�
	l_cfg.save()	-- �����ļ�
end


-- ��ʼ����ǰĬ��ֵ
default.init()


return cfg
