--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/12/10
--
-- @file    mcache.lua
-- @brief	����������߳�֮�乲�������
-- @version 0.1
-- @author  ������
--   ��ģ������ l_tpool.init()
--   �� l_tpool.quit() ֮��, �޷�ʹ��
--]]

local string = require("string")
local io = require("io")
local os = require("os")
local l_sys = require("l_sys")
local l_tpool = require("l_tpool")
local l_mcache = require("l_mcache")


local mcache = {}


-- �������ݲ��ֵ�ֻ��Ĭ��ֵ
local mkeys_r = {
	-- 
	
	
	-- surport �Ƿ�֧����
	surport_wireless = true,	-- �Ƿ�֧����������
	surport_ipc_pool = true,	-- �Ƿ�֧��ipc�������ڴ��: Ӱ�����������Ƿ�֧������
	surport_listen = true,		-- �Ƿ�֧�ּ�����׼(80)�˿�
	surport_listen_local = true,-- �Ƿ�֧�ּ������ض˿�
	surport_ui = false,			-- �Ƿ�֧��UIģ��
	surport_shm = false			-- �Ƿ�֧�ֽ��̼乲���ڴ�ģ��(share mem)
}


-- @brief �ڽ����ڹ���ģ��, ��������
-- @param [in]	k[string]					key�ؼ���
-- @param [in]	v[string,boolean,number]	ֵ
-- @return ��
mcache.set = function (k, v)
	local default_v = mkeys_r[k]
	
	if nil == default_v then
		print('mcache.set not found!', k, v)
		return
	end
	
	if type(v) ~= type(default_v) then
		print('mcache.set type error!', k, v)
		return
	end
	
	l_mcache.set(k, v)
end


-- @brief �ӽ����ڹ���ģ��, ��ȡ����
-- @param [in]	k[string]	key�ؼ���
-- @return [nil,string,boolean,number]	ֵ
mcache.get = function (k)
	local default_v = mkeys_r[k]
	
	if nil == default_v then
		return nil
	end

	local v, t1 = l_mcache.get(k)
	
	if type(v) == type(default_v) then
		return v
	else
		return default_v
	end	
end


-- @brief ��ʼ��
mcache.init = function ()
	-- ��֧����Ŀ¼ '/nfsmem/surport'
	-- ��ȡ�ļ� '/nfsmem/surport/surport_*' ��һ����ֵ, �����Ϊ0 ��֧��
	if 'hisi_linux' == l_sys.platform then
		for k, v in pairs(mkeys_r) do
			if 1 == string.find(k, 'surport_') then
				local path = '/nfsmem/surport/' .. k
				local file = io.open(path)
				if nil ~= file then
					local num = file:read('*n')	-- ���ļ��ж�ȡһ������				
					if 0 ~= num then
						mcache.set(k, true)
					else
						mcache.set(k, false)
					end
					file:close()
				end
			end
		end
	end
	
	-- ��ӡ֧����Ŀ
	for k, v in pairs(mkeys_r) do
		if 1 == string.find(k, 'surport_') then
			print(k, mcache.get(k))
		end
	end
end


return mcache
