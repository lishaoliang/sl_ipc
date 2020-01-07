--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/16
--
-- @file    check_arping.lua
-- @brief   �������� arping 
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


local arping = function (name, ip)
	-- arping ��ʽ: arping -I eth0 -c 3 192.168.1.247
	local cmd = string.format('arping -I %s -c 3 %s', name, ip)
	local ret, str = sh(cmd)
	
	print('arping cmd:'..cmd, ret, str)
end


local check_arping = function ()
	local ifs = unix.get_ifconfig()	
	for k, v in pairs(ifs) do
		local name = v['name']
		local ipv4 = v['ipv4']
		
		arping(name, ipv4)
	end
end

return check_arping
