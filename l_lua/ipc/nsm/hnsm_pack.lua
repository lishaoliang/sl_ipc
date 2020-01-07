--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/15
--
-- @file    hnsm_pack.lua
-- @brief   ���http�ظ�ͷ��
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local table = require("table")

local h_code = require("ipc.http.h_code")

local hnsm_pack = {}


--local status_200 = 'HTTP/1.1 200 OK\r\n'
--local status_401 = 'HTTP/1.1 401 Unauthorized\r\n'
--local ser = string.format('Server: %s\r\n', h_code.HTTP_SERVER)
--local ct = 'Content-Type: application/json\r\n'


hnsm_pack.pack_200 = function (req, body_len)
	--local cl = string.format('Content-Length: %d\r\n', body_len)
	
	--local llssid = ''
	--local llauth = ''
	
	--if '' == req['llssid'] then
	--	llssid = string.format('Set-Cookie: llssid=%s\r\n', '123456')
	--end
	
	--if '' == req['llauth'] then
	--	llauth = string.format('Set-Cookie: llauth=%s\r\n', '123456')
	--end
	
	--return string.format('%s%sConnection: close\r\n%s%s%s%s\r\n', status_200, ser, ct, llssid, llauth, cl)

	local t = {}
	
	table.insert(t, 'HTTP/1.1 200 OK\r\n')
	table.insert(t, string.format('Server: %s\r\n', h_code.HTTP_SERVER))
	table.insert(t, 'Connection: close\r\n')				-- �����ӹر�
	table.insert(t, 'Content-Type: application/json\r\n')	-- ��������

	-- cookie
	if '' == req['llssid'] then
		table.insert(t, string.format('Set-Cookie: llssid=%s\r\n', '123456'))
	end
	
	if '' == req['llauth'] then
		table.insert(t, string.format('Set-Cookie: llauth=%s\r\n', '123456'))
	end

	table.insert(t, string.format('Content-Length: %d\r\n', body_len))	-- ���ݳ���
	table.insert(t, 'Access-Control-Allow-Origin: *\r\n')	-- ��ɿ�������	
	table.insert(t, '\r\n')
	
	return table.concat(t)
end


hnsm_pack.pack_401 = function (req, body_len)
	--local cl = string.format('Content-Length: %d\r\n', body_len)
	
	--local llssid = string.format('Set-Cookie: llssid=%s\r\n', '123456')
	--local llauth = string.format('Set-Cookie: llauth=%s\r\n', '123456')
	
	--return string.format('%s%sConnection: close\r\n%s%s%s%s\r\n', status_401, ser, ct, llssid, llauth, cl)
	
	
	local t = {}
	
	table.insert(t, 'HTTP/1.1 401 Unauthorized\r\n')
	table.insert(t, string.format('Server: %s\r\n', h_code.HTTP_SERVER))
	table.insert(t, 'Connection: close\r\n')				-- �����ӹر�
	table.insert(t, 'Content-Type: application/json\r\n')	-- ��������

	-- cookie
	table.insert(t, string.format('Set-Cookie: llssid=%s\r\n', '123456'))
	table.insert(t, string.format('Set-Cookie: llauth=%s\r\n', '123456'))

	table.insert(t, string.format('Content-Length: %d\r\n', body_len))	-- ���ݳ���
	table.insert(t, 'Access-Control-Allow-Origin: *\r\n')	-- ��ɿ�������	
	table.insert(t, '\r\n')
	
	return table.concat(t)
end

return hnsm_pack
