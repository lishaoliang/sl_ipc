--[[
-- Copyright (c) 2019 �人˴�����, All Rights Reserved
-- Created: 2019/11/15
--
-- @brief	��lua��tableת��Ϊjson�ı�
-- @author	������
-- @see https://github.com/lishaoliang/l_sdk_doc
--]]

local cjson = require("cjson.safe")


-- @brief ��lua��tableת��Ϊjson�ı�
-- @param [in]  	o[table]	lua��table
-- @return [string]	json�ַ���
local to_json = function (o)
	local t = type(o)
	
	if 'string' == t then
		return o
	elseif 'table' == t then
		local txt = cjson.encode(o)
		return txt
	else
		assert(false)
	end
	
	return '{}'
end

return to_json
