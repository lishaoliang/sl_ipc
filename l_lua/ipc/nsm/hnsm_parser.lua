--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/15
--
-- @file    hnsm_parser.lua
-- @brief   ����http����ͷ��
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/15 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")

-- ȥ���ַ�����β����
local trim = function (s)
	return (string.gsub(s, '^%s*(.-)%s*$', '%1'))
end

local parser_k_v = function (req, k, v)
	local low_k = string.lower(k)
	if 'host' == low_k then
		req.host = v
	elseif 'cookie' == low_k  then
		req.cookie = v
	end	
end

-- brief �� req �н��� ���ǹ��ĵ� llssid �� llauth
-- ����鵽��һ��������, �ظ����� k, v ����
local parser_cookie = function (req)	
	for k, v in string.gmatch(req.cookie, '(%w+)=(%w+)') do
		local low_k = string.lower(k)	
		if 'llssid' == low_k and '' == req['llssid'] then
			req['llssid'] = v
		elseif 'llauth' == low_k and '' == req['llauth'] then
			req['llauth'] = v
		end	
	end
end

hnsm_parser = function (id, head)
	local req = {
		method = '',	-- �����ִ�Сд
		url = '',		-- �����ִ�Сд
		host = '',
		cookie = '',
		
		id = id,
		cmd = '',		-- ����Ķ�������, ������ͷ,body.cmd����ȡ
		llssid = '',	-- �ͻ��� llssid
		llauth = '',	-- �ͻ�����Ȩ�� llauth
		
		local_unix = false, -- �Ƿ�Ϊ��������
		body = {}		-- �������и��� json ����, ����н���
	}

	if nil == head then
		return req
	end

	--print('----------------------------')
	--print(head)
	--print('----------------------------')

	-- ��ȡ����ͷ��Ϣ
	local first = true
	for line in string.gmatch(head, '[^\r\n]+[\r\n]*') do
		--print(line)
		if first then
			local method, url, ver = string.match(line, '([^ ]+) +([^ ]+) +([^ ]+)') -- ƥ������ͷ
			--print(method, url, ver)
			if nil ~= method and nil ~= url and nil ~= ver then
				req.method = string.lower(method)
				req.url = string.lower(url)
			end
			
			first = false
		else
			local k, v = string.match(line, '([^:]+):(.*)') -- ƥ�����
			if nil ~= k and nil ~= v then
				k = trim(k)
				v = trim(v)
				--print(k, v)
				parser_k_v(req, k, v)
			end
		end
	end
	
	-- �����ǹ��ĵ� cookie ������ req.ck.llssid, req.ck.llauth
	parser_cookie(req)
	
	return req
end

-- test

--local t_req_str = "GET / HTTP/1.1\r\n\
--Host: 127.0.0.1:3456\r\n\
--User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0\r\n\
--Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n\
--Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2\r\n\
--Accept-Encoding: gzip, deflate\r\n\
--Connection: keep-alive\r\n\
--Cookie: llssid=123456; llauth=789456\r\n
--Upgrade-Insecure-Requests: 1\r\n\
--\r\n"

--hnsm_parser(t_req_str)

return hnsm_parser
