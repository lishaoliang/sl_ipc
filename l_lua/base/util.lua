--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  ��������ģ��
-- @author ������
--]]
local string = require("string")

local util = {}


local socket_id = 1000


-- @brief ��ȡ��һ��socket id (1000, 2147418112)
util.next_socket_id = function ()
	socket_id = socket_id + 1
	if 2147418112 <= socket_id then -- (1000 0x7FFF0000)
		socket_id = 1000
	end	
	
	return socket_id
end

-- @brief ȥ���ַ�����β�ո�
-- @param [in]		s[string]	�ַ���
-- @return [string] ȥ����β�ո���ַ���
util.trim = function(s)
	return (string.gsub(s, '^%s*(.-)%s*$', '%1'))
end


-- @brief ȥ���ַ�����β�����ַ�'\n'
util.trim_c = function(s)
	return (string.gsub(s, '^%c*(.-)%c*$', '%1'))
end


-- @brief ȥ���ַ�����β:�����ַ�'\n',�ո�
util.trim_cs = function(s)
	return (string.gsub(s, '^%c*%s*(.-)%c*%s*$', '%1'))
end

-- �ж�table�Ƿ�Ϊ����
-- t [table,nil] table����
-- return [boolean]
util.t_is_array = function(t)
	if 'table' ~= type(t) then 
		return false
	end
	
	local n = #t
	for i, v in pairs(t) do
		if 'number' ~= type(i) then
			return false  
		end
		
		if n < i then
			return false
		end
	end
	
	return true
end

-- �ж�table�Ƿ�Ϊ��
-- t [table,{}] table����
-- return [boolean]
util.t_is_empty = function(t)
	if 'table' ~= type(t) then
		return true
	end

	if nil ~= next(t) then
		return false
	end
	
	return true
end

-- brief �ж�table��Ϊ��
-- t [table,nil,{}] table����
-- return [boolean]
util.t_is_not_empty = function(t)
	if 'table' == type(t) then
		if nil ~= next(t) then
			return true
		end
	end
	
	return false
end


-- brief ��ȡtable������
-- t [table] ��
-- {...}	 key�ַ���
-- return nil, .
util.t_item = function (t, ...)
	local o = t
	for k, v in ipairs({...}) do
		if 'table' ~= type(o) then
			return nil
		end
		o = o[v]
	end
	return o
end


-- brief ��ȡ dst, src �Ĳ���, ������ dst ��
-- dst [table] Ŀ���
-- src [table] ԭ��
-- return [table] dst
-- note ֻ���� [number, string, boolean]
-- �������ͬkey, �� src�Ḳ�� dst�е�ͬkeyֵ
util.t_union = function (dst, src)
	if nil == dst then
		return util.t_copy(src)
	end
	
	if nil ~= src then
		for k, v in pairs(src) do
			local skt = type(src[k])
			local dkt = type(dst[k])
			
			if 'number' == skt or 'string' == skt or 'boolean' == skt then
				dst[k] = src[k]
			end
				
			if 'table' == skt then
				if 'table' == dkt then
					dst[k] = util.t_union(dst[k], src[k])
				else
					dst[k] = util.t_copy(src[k])
				end
			end
		end
	end
	
	return dst
end


-- brief ����src�е�[number, string, boolean]���Ƶ���Ӧ��dst��
-- dst [table] Ŀ���
-- src [table] ԭ��
-- return [table] dst
util.t_cp_by = function (dst, src)
	
	if nil ~= dst then
		for k, v in pairs(dst) do
			local dkt = type(dst[k])
			local skt = type(src[k])
			
			if dkt == skt then
				if 'number' == dkt or 'string' == dkt or 'boolean' == dkt then
					dst[k] = src[k]
				end
				
				if 'table' == dkt then
					util.t_cp_by(dst[k], src[k])
				end
			end
		end
	end
	
	return dst
end


-- brief ����һ��table,ֻ����:number, string, boolean
-- src [table]	  ԭʼtable
-- return [table] �����Ƶ���table
util.t_copy = function(src)
	if nil == src then
		return nil
	end

	local dst = {}
	for k, v in pairs(src) do
		if 'table' == type(src[k]) then
			dst[k] = util.t_copy(v)
		elseif 'number' == type(src[k]) or 'string' == type(src[k]) or 'boolean' == type(src[k]) then
			dst[k] = v
		else
			
		end
	end
	
	return dst
end

return util
