--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/16
--
-- @file    check_env.lua
-- @brief   ���л������
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/16 0.1 �����ļ�
-- @warning û�о���
--]]
local string = require("string")
local io = require("io")
local unix = require("base.unix")

local l_sys = require("l_sys")
local sh = l_sys.sh


local shell = function (tool, msg)
	local cmd = string.format('%s %s', tool, msg)
	
	local ret, str = sh(cmd)
	print('check_env cmd:'..cmd, ret, str)	
	
	return ret, str	
end

local reset_eth0_hw = function (mac)	
	--ifconfig eth0 down
	--ifconfig eth0 hw ether $mac
	--ifconfig eth0 192.168.1.247 up
	--ifconfig lo up
	
	shell('ifconfig eth0 down', '')
	shell('ifconfig eth0 hw ether', mac)
	shell('ifconfig eth0 192.168.1.247 up', '')
	shell('ifconfig lo up', '')
end


-- @brief ���mac
local rand_mac = function ()
	local hexs = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'}
	local mac = ''
	for i = 1, 6, 1 do
		if 1 == i then
			local v1 = hexs[l_sys.rand(16)]
			local v2 = 0 -- �ڶ�λ��Ϊ4��������, �򵥴���ֱ��Ϊ0
			
			mac = string.format('%s%s', v1, v2)
		else
			local v1 = hexs[l_sys.rand(16)]
			local v2 = hexs[l_sys.rand(16)]			
			mac = string.format('%s:%s%s', mac, v1, v2)
		end
	end
	
	return mac
end


-- @brief ���»�ȡmac
local get_my_mac = function ()
	local mac = ''
	
	-- ��ȡϵͳ���ɵ�MAC
	local ifc = unix.get_ifconfig()
	local ifc_eht0 = ifc['eth0']
	if ifc_eht0 and ifc_eht0['mac'] then
		mac = ifc_eht0['mac']
	end
	
	-- ����, �������һ��
	if 'string' ~= type(mac) or string.len(mac) ~= 17 then
		mac = rand_mac()
		print('ipc.env.check_env', 'rand mac='..mac)
	end

	-- ��mac��ַ�޸�Ϊ '00:1*:*' ��ʽ
	mac = string.gsub(mac, '-', ':')
	mac = string.format('%s%s', '00:1', string.sub(mac, 5))
	mac = string.upper(mac)

	return mac
end


-- @brief ���eth0��mac��ַ�Ƿ�Ϸ�, ���Ϸ���, ��дmac��ַ
local check_eth0_mac = function ()
	local reboot = false
	local reset = true
	local path_eth0_mac = '/etc/MAC_ETH0'
	--local path_eth0_mac = './MAC_ETH0'
	
	local fr = io.open(path_eth0_mac, 'r')
	if fr then
		local mac = fr:read()
		fr:close()
		
		if 'string' == type(mac) and string.match(mac, '[%x]+[:-][%x]+[:-][%x]+[:-][%x]+[:-][%x]+[:-][%x]+') then
			reset = false
		end
		
		print('check_eth0_mac', mac)
	end

	local out_mac = ''
	if reset then
		local mac = get_my_mac()
		assert(mac and '' ~= mac)
		
		local fw = io.open(path_eth0_mac, 'w')
		if fw then
			fw:write(mac)
			fw:close()
			
			print('ipc.env.check_env', 'rewrite eth0 mac=' .. mac)
			out_mac = mac
			reboot = true
		end
	end	
	
	return reboot, out_mac
end

local check_env = function ()
	local reboot = false

	-- ��ʼ�����ֵ
	--l_sys.srand()

	-- �����������mac��ַ
	local ret_eth0, mac = check_eth0_mac()
	if ret_eth0 then
		reset_eth0_hw(mac)
		reboot = true
	end
	
	-- �Ƿ���Ҫ����
	if reboot then
		print('ipc.env.check_env', 'need reboot...')
		-- shell('reboot', '') -- ����������, USB��������
	end
end


return check_env
