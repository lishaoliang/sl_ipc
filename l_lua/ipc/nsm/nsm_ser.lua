--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- Created: 2018/12/21
--
-- @file   nsm_ser.lua
-- @brief  nsm����˶�Ӧ�Ĵ�����
-- @author ������
--]]
local string = require("string")
local cjson = require("cjson")
local l_nsm = require("l_nsm")

local np_id = require("base.np_id")
local json_request = require("ipc.nsm.json_request")
local rtsp_ser = require("ipc.nsm.rtsp_ser")
local nspp_http_ser = require("ipc.nsm.nspp_http_ser")
local flv_http_ser = require("ipc.nsm.flv_http_ser")

local nsm_ser = {
	b_res = true
}


local send = function (id, body)
	local t = type(body)
	
	if 'string' == t then
		l_nsm.send(id, body)
		nsm_ser.b_res = true
	elseif 'table' == t then
		local txt = cjson.encode(body)
		l_nsm.send(id, txt)
		nsm_ser.b_res = true
	else
		assert(false)
	end
end


local parser_req = function(id, txt)
	local req ={
		id = id,			-- ����id
		cmd = '',			-- cmd,llssid,llauth ��������뱻��ȡ����
		llssid = '',		-- �ͻ��� llssid
		llauth = '',		-- �ͻ�����Ȩ�� llauth
		
		local_unix = false, -- �Ƿ�Ϊ��������
		body = {}			-- �����������, ���Ľ������Ϊtable
	}

	-- txt ���ݴ��������, ������ȫ����
	if 'string' == type(txt) and 0 < string.len(txt) then
		local ret, obj = pcall(cjson.decode, txt)		
		--print(ret, obj)
		
		if ret and 'table' == type(obj) then
			req.body = obj
		end	
		
		if 'string' == type(req.body['cmd']) then
			req.cmd = req.body['cmd']
		end
		
		if 'string' == type(req.body['llssid']) then
			req.llssid = req.body['llssid']
		end
		
		if 'string' == type(req.body['llauth']) then
			req.llauth = req.body['llauth']
		end
	end
	
	return req
end


-- @brief ���յ��ı����ݴ���
-- @param [in]	id[number]			����id
-- @param [in]	protocol[number]	Э������
-- @param [in]	body[string]		�ı�����
-- @return 0.��������; 1.�Ͽ�����
local on_recv = function (id, protocol, body)
	nsm_ser.b_res = false -- �������, ��Ǳ���ظ�
	local ret = 1	

	if np_id.NSPP == protocol then
		
		local req = parser_req(id, body)	-- ������������
		req.local_unix = false
		
		local res = {}
		
		ret = json_request(req, res)	-- ������
		
		send(id, res)					-- �ظ��Զ�
	elseif np_id.NSPP_LOCAL == protocol then
		local req = parser_req(id, body)	-- ������������
		req.local_unix = true
		
		local res = {}
		
		ret = json_request(req, res)	-- ������
		
		send(id, res)					-- �ظ��Զ�
	elseif np_id.RTSP == protocol then
		
		local res = ''
		ret, res = rtsp_ser.sdp_request(id, body)
		
		send(id, res)					-- �ظ��Զ�
	elseif np_id.NSPP_HTTP == protocol then
		ret = nspp_http_ser.request(id, body)
		nsm_ser.b_res = true
	elseif np_id.HTTP_FLV == protocol then
		ret = flv_http_ser.request(id, body)
		nsm_ser.b_res = true
	end

	if 0 == ret then
		assert(true == nsm_ser.b_res)	-- ���ÿ�������Ƿ���Ӧ
	end
	
	return ret -- ����0 ��ʾ��������, ��0��ʾ�Ͽ�����
end


-- @brief ���ӶϿ�����
-- @param [in]	id[number]			����id
-- @param [in]	protocol[number]	Э������
-- @return 0
local on_disconnect = function (id, protocol)
	if np_id.RTSP == protocol then
		rtsp_ser.on_disconnect(id)
	elseif np_id.NSPP_HTTP == protocol then
		nspp_http_ser.on_disconnect(id)
	elseif np_id.HTTP_FLV == protocol then
		flv_http_ser.on_disconnect(id)
	end
	
	return 0
end


-- @brief ��ʼ������
-- @return ��
nsm_ser.setup = function ()
	
	l_nsm.set_recv(on_recv)					-- ע�����ݽ��պ���
	l_nsm.set_disconnect(on_disconnect)		-- ע�ᵱ���ӶϿ��Ļص�����
end

return nsm_ser
