--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
--
-- @file    lightweight.lua
-- @brief   �����������߳����
-- @version 0.1
-- @author	������
--]]

local lt_name = ''

init = function (param)
	--print('init .....', param)
	lt_name = param
	return 0
end

quit = function ()
	--print('quit .....')
	return 0
end

on_cmd = function (msg, lparam, wparam, cobj)
	print('on_cmd.name:'..lt_name, msg, lparam, wparam)
	return 0
end
