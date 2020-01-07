--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  ��չ����ģ��,����֧�ֻ�����: "cjson"
-- @author ������
--]]
local cjson = require("cjson")

local util_ex = {}


local copy_t_p = nil
copy_t_p = function(t)
	local dst = {}
	
	for k, v in pairs(t) do
		if type(v) == 'table' then
			dst[k] = copy_t_p(v)
		elseif type(v) == 'string' or type(v) == 'number' or type(v) == 'boolean' then
			dst[k] = v
		else
			dst[k] = tostring(v)
		end
	end
	
	return dst
end

-- ��json��ʽ��ӡ
-- �˺������Դ�ӡ����Lua����, ��Ч�ʵ���; ֻ����ʱ����ʹ��
util_ex.printf = function(...)
	local arg = {...} -- arg Ϊ����
	local tmp = copy_t_p(arg)

	print(cjson.encode(tmp))
end

return util_ex
