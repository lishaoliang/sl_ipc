--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/08
--
-- @file    eth0.lua
-- @brief   eth0���ڹ���
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/08 0.1 �����ļ�
-- @note
--	\n 169.254.0.0/16 ����˽�е�ַ��
--  \n 169.254.100.123	eth0��������Ĭ�ϵ�ַ
--  \n 169.254.110.123	wlan0��������Ĭ�ϵ�ַ
-- @warning û�о���
--]]
local string = require("string")
local l_sys = require("l_sys")
local sh = l_sys.sh

local util = require("base.util")
local util_ex = require("base.util_ex")
local unix = require("base.unix")

local eth0 = {}

local path_udhcpc = 'udhcpc'


eth0.shell = function (tool, msg)
	local cmd = string.format('%s %s', tool, msg)
	
	local ret, str = unix.shell(cmd)
	print('eth0 cmd:'..cmd, ret, str)	
	
	return ret, str
end


eth0.reset = function ()
	-- ������������, ���ر�
	-- ip addr flush dev eth0

	unix.kill('udhcpc', 'eth0')
	eth0.shell('ip', 'addr flush dev eth0')
	eth0.shell('ifconfig', 'eth0 169.254.100.123 up')
end


eth0.set_ipv4 = function (ip, mask, gateway)

	eth0.reset()
	
	-- ifconfig eth0 192.168.5.40 netmask 255.255.255.0
	local msg = string.format('eth0 %s', ip)
	if 'string' == type(mask) and '' ~= mask then
		msg = string.format('%s netmask %s', msg, mask)
	end	
	eth0.shell('ifconfig', msg)
	
	--if 'string' == type(gateway) and '' ~= gateway then
	--	-- ip route add via 192.168.3.1 dev eth0
	--	local gw = string.format('route add via %s dev eth0', gateway)
	--	eth0.shell('ip', gw)
	--end
end


eth0.set_dhcp = function ()

	eth0.reset()
	
	eth0.shell(path_udhcpc, '-i eth0 -b -R -T 3 -A 6')
end


return eth0
