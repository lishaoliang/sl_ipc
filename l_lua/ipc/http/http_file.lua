--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- brief  http file HTTP�ļ�����
-- @author ������
--]]
local string = require("string")
local table = require("table")
local l_sys = require("l_sys")
local l_file = require("l_file")
local h_code = require("ipc.http.h_code")
local util = require("base.util")
local http_mime = require("ipc.http.http_mime")


local http_file = {}


-- http�ļ����ظ�Ŀ¼
local root_path = '/opt/l_lua/www'
if 'hisi_linux' ~= l_sys.platform then
	root_path = './www'
end


local pack_200 = function (body_len, mime)
	local t = {}
	
	table.insert(t, 'HTTP/1.1 200 OK\r\n')
	table.insert(t, string.format('Server: %s\r\n', h_code.HTTP_SERVER))
	table.insert(t, 'Connection: close\r\n')							-- �����ӹر�
	table.insert(t, string.format('Content-Type: %s\r\n', mime))		-- ��������
	table.insert(t, string.format('Content-Length: %d\r\n', body_len))	-- ���ݳ���
	table.insert(t, 'Cache-Control: max-age=3600\r\n')					-- ����ʱ��(��)
	table.insert(t, 'Access-Control-Allow-Origin: *\r\n')				-- ��ɿ�������
	table.insert(t, '\r\n')
	
	return table.concat(t)
end

local get_mime = function (filename)
	local ext = string.match(filename, '[^.]*$')
	
	if nil ~= ext then
		ext = util.trim(ext)
		ext = string.lower(ext)
		
		local mime = http_mime[ext]
		if nil ~= mime then
			return mime
		end
	end
	
	return 'application/octet-stream' -- ��������,δ֪����
end

local get_filter_path = function (url)
	local path = string.match(url, '^[^?]*')	-- '/index.html?cmd=hello&llssid=123456&llauth=123456'	
	if nil == path then
		return '', ''
	end
	
	-- ��ֹʹ�����·��, �Ƿ������ļ�
	path = string.gsub(path, '\\', '/')			-- ��'\' �滻Ϊ '/'
	path = string.gsub(path, '[.]+/', '/')		-- ��'./','../' �滻Ϊ '/'
	path = string.gsub(path, '[/]+/', '/')		-- ��'//','///' �滻Ϊ '/'
	
	-- ��ȡ�ļ���
	local filename = string.match(path, '[^/]*$')	-- '/index.html'
	if nil == filename or 0 == string.len(filename) then
		return '', ''
	end
	
	return root_path .. path, get_mime(filename)
end

-- ��ȡ�ļ�
local read_file = function (path)
	local buf = nil
	local size = 0
	
	local file = l_file.open(path, 'rb')	-- ��ȡ������
	if nil ~= file then
		l_file.seek(file, 0, 'seek_end')
		local filelen = l_file.tell(file)
		
		if 0 < filelen then
			l_file.seek(file, 0, 'seek_set')
			buf, size = l_file.read(file, filelen)
			assert(size == filelen)
		end
		
		l_file.close(file)
	end
	
	return buf, size
end

-- @brief HTTP�������ļ���������
-- @param [in]	req[table]	������������
-- @param [in]	url[string]	�����·��
-- @return [number]		������
--			[string]	httpͷ
--			[string/userdata(lightuserdata)]	http������; �ı�, ������
http_file.request = function (req, url)	
	local req_url = url
	
	-- ��һ�γ��Զ�ȡ�ļ�
	-- �ڶ��γ��Զ�ȡ'/not_found.html'�ļ�
	local count = 2
	while 0 < count do
		local path, mime = get_filter_path(req_url)
		--print('http get:', path, mime)
		
		if 0 == string.len(path) then
			return h_code.HTTP_404, '', ''
		end
		
		local buf, size = read_file(path)
		if nil ~= buf then
			local head = pack_200(size, mime)
			--l_sys.free(buf)	-- ��Ҫ�ȵ�bufʹ����Ϻ��ͷ�
			
			return h_code.HTTP_200, head, buf
		end
		
		req_url = '/not_found.html'
		count = count - 1
	end
	
	return h_code.HTTP_404, '', ''
end

return http_file
