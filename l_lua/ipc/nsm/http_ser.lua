--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- brief  http ser ģ��
-- @author ������
--]]
local string = require("string")
local cjson = require("cjson")
local l_sys = require("l_sys")
local l_http = require("l_http")
local l_nsm = require("l_nsm")


local util = require("base.util")
local h_code = require("ipc.http.h_code")
local http_file = require("ipc.http.http_file")

local hnsm_parser = require("ipc.nsm.hnsm_parser")
local hnsm_pack = require("ipc.nsm.hnsm_pack")
local json_request = require("ipc.nsm.json_request")

local http_ser = {
	s_http = nil,
	b_res = true
}

local send = function (id, head, body)
	http_ser.s_http:send(id, head, body)
	http_ser.b_res = true
end

local send_err = function (id, code)
	if h_code.HTTP_403 == code then
		send(id, h_code.HTTP_403_HEAD, '')
	else
		send(id, h_code.HTTP_404_HEAD, h_code.HTTP_404_BODY)
	end	
end

-- brief ����http��body����
-- req [table]   �������
-- txt [string]  HTTP��body����
local parser_body = function (req, txt)
	if 0 == string.len(txt) then
		return false
	end
	
	-- ��body ����ת��Ϊ lua ��table
	local ret, obj = pcall(cjson.decode, txt)
	--print(ret, obj)

	if ret and 'table' == type(obj) then
		req.body = obj
	end
	
	-- ���body ���� llssid, llauth, ������µ� req.ck, ��ȷ��Ȩ�޼��ok
	if nil ~= req.body then
		if 'string' == type(req.body['llssid']) then
			req['llssid'] = req.body['llssid']		-- ��ȡllssid
		end
		
		if 'string' == type(req.body['llauth']) then
			req['llauth'] = req.body['llauth']		-- ��ȡllauth
		end
		
		if 'string' == type(req.body['cmd']) then
			req['cmd'] = req.body['cmd']			-- ��ȡcmd
		end
	end	
end

-- brief ����http��url����
-- req [table]   �������
-- url [string]  url
local parser_url = function (req, url)
	-- url ���� /luajson?cmd=support&llssid=123456&llauth=123456
	-- ������ʹ��
	-- ','����url�����ַ�����ʮ�ֹ淶
	
	for k, v in string.gmatch(url, '([%w_,]+)=([%w_,]+)') do
		local low_k = string.lower(k)	
		if 'llssid' == low_k and '' == req['llssid'] then
			req['llssid'] = v
		elseif 'llauth' == low_k and '' == req['llauth'] then
			req['llauth'] = v
		elseif 'cmd' == low_k then
			req['cmd'] = v
		end	
	end
end

local on_http_frame = function (id, req, url)
	local chnn = 0
	local idx = 65	-- ͼƬ��2

	-- ������·����, ��������
	local path, param = string.match(url, '([^?]*)(.*)')
	if nil ~= path then
		for line in string.gmatch(path, '([%w]+)') do
			if nil ~= line then
				local k, v = string.match(line, '([%a]+)([%d]+)')
				if nil ~= k and nil ~= v then
					k = string.lower(util.trim(k))
					v = util.trim(v)
					
					if 'chnn' == k then
						chnn = tonumber(v)
					elseif 'idx' == k then
						idx = tonumber(v)
					end
				end
			end
		end
	end
	
	-- ��ʱ��֧��ͼƬ��
	if 65 ~= idx then
		idx = 65
	end
	
	local buf, size, frame_type = l_nsm.get_frame(chnn, idx)
	
	if nil ~= buf then
		local t = {}
		table.insert(t, 'HTTP/1.1 200 OK\r\n')
		table.insert(t, string.format('Server: %s\r\n', h_code.HTTP_SERVER))
		table.insert(t, 'Connection: close\r\n')
		table.insert(t, string.format('Content-Type: %s\r\n', 'image/jpeg'))	-- text/html
		table.insert(t, string.format('Content-Length: %d\r\n', size))
		table.insert(t, '\r\n')
		local head = table.concat(t)
		
		send(id, head, buf)
		
		l_sys.free(buf)
		return h_code.HTTP_200
	end	
	
	return h_code.HTTP_404
end


local on_http_file = function (id, req, url)
	-- GET����, ����'/opt/l_lua/www'Ŀ¼�ļ�
	local ret, head, body = http_file.request(req, url)
	
	if h_code.HTTP_200 == ret then
		send(id, head, body)
		
		if 'userdata' == type(body) then
			l_sys.free(body)	-- �ͷŶ���������
		end
		
		return h_code.HTTP_200
	end
	
	return h_code.HTTP_404
end


-- brief ���մ�C���ֹ�����HTTP����
-- id [number]   ����id
-- head [string] HTTPͷ
-- body [string] HTTP��Body����
-- return 0
http_ser.on_recv = function (id, head, body)
	http_ser.b_res = false -- �������, ��Ǳ���ظ�
	local code = h_code.HTTP_404
	
	local req = hnsm_parser(id, head)
	local res = {}
	
	local url = string.lower(req.url)
	parser_url(req, url)	
	
	-- lua ��1��ʼ����, ����jsonЭ��Ŀ¼, ��Ϊ����json��Ϣ
	if 1 == string.find(url, '/luajson') then
		parser_body(req, body)	
		json_request(req, res)		
		
		local body_txt = cjson.encode(res)
		local head_txt = hnsm_pack.pack_200(req, string.len(body_txt))
		
		send(id, head_txt, body_txt)
		
		code = h_code.HTTP_200
	--elseif 1 == string.find(url, '/luaframe') then
	--	
	--	-- ����ʵʱ֡, BUG.�����������,���ݷ��Ͳ���ʱʱ, �Ὣ�ڴ�ľ� 
	--	--code = on_http_frame(id, req, url)
	--	
	elseif 'get' == req['method'] then
		if '/' == url or '' == url then
			url = '/index.html'	-- �ض�λ����ҳ
		end
		
		-- ����'get'����, ����Ϊ�ӷ���������ļ�
		code = on_http_file(id, req, url)	-- GET����, ����'/opt/l_lua/www'Ŀ¼�ļ�
	end
	
	if h_code.HTTP_200 ~= code then
		send_err(id, code)
	end
	
	assert(true == http_ser.b_res) -- ���ÿ�������Ƿ���Ӧ
	return 0
end


http_ser.setup = function ()
	
	-- ��ʼ��	
	http_ser.s_http = l_http.create_s_http()
	
	-- ����http����˽��պ���
	l_http.set_s_recv(http_ser.on_recv)
end

return http_ser
