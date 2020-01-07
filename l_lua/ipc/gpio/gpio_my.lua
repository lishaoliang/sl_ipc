--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/09/12
--
-- @file    gpio_my.lua
-- @brief   ��gpioͨ�ò���
-- @author	������
-- @version 0.1
-- @warning û�о���
--]]

local string = require("string")
local unix = require("base.unix")
--local l_dev_vi = require("l_dev_vi")

local gpio = {}


-- @brief ��ȡgpio���
-- @param [in]  	grp[number]	���
-- @param [in]		idx[number]	�������
-- @return [number] ���
local get_grp_id = function (grp, idx)
	return 8 * grp + idx
end


-- @brief ��gpio
-- @param [in]  	grp[number]	���
-- @param [in]		idx[number]	�������
-- @return ��
gpio.open = function (grp, idx)
	--local id = get_grp_id(grp, idx)
	--local cmd = string.format('echo %d > /sys/class/gpio/export', id)	
	--local ret, str = unix.shell(cmd)
	
	print('gpio_my.open:', grp, idx)
end


-- @brief �ر�gpio
-- @param [in]  	grp[number]	���
-- @param [in]		idx[number]	�������
-- @return ��
gpio.close = function (grp, idx)
	--local id = get_grp_id(grp, idx)
	--local cmd = string.format('echo %d > /sys/class/gpio/unexport', id)	
	--local ret, str = unix.shell(cmd)
	
	print('gpio_my.close:', grp, idx)
end


-- @brief ����gpioΪ����
-- @param [in]  	grp[number]	���
-- @param [in]		idx[number]	�������
-- @return ��
-- @note ���ⲿ��ȡ�ź�, Ĭ��1(�ߵ�ƽ)
gpio.set_in = function (grp, idx)
	--local id = get_grp_id(grp, idx)
	--local cmd = string.format('echo in > /sys/class/gpio/gpio%d/direction', id)	
	--local ret, str = unix.shell(cmd)
	
	print('gpio_my.set_in:', grp, idx)
end


-- @brief ����gpioΪ���
-- @param [in]  	grp[number]	���
-- @param [in]		idx[number]	�������
-- @return ��
-- @note ���ⲿ����ź�, Ĭ��0(�͵�ƽ)
gpio.set_out = function (grp, idx)
	--local id = get_grp_id(grp, idx)
	--local cmd = string.format('echo out > /sys/class/gpio/gpio%d/direction', id)	
	--local ret, str = unix.shell(cmd)
	
	print('gpio_my.set_out:', grp, idx)
end


-- @brief ����gpio�ź�ֵ
-- @param [in]  	grp[number]		���
-- @param [in]		idx[number]		�������
-- @param [in]		value[number]	�ź�ֵ[0, 1]; 0.�͵�ƽ; 1.�ߵ�ƽ
-- @return ��
-- @note ����gpioΪ���ʱ, ��Ч
gpio.set_value = function (grp, idx, value)
	--if 0 ~= value then
	--	value = 1 -- 0, 1
	--end
	
	--local id = get_grp_id(grp, idx)
	--local cmd = string.format('echo %d > /sys/class/gpio/gpio%d/value', value, id)	
	--local ret, str = unix.shell(cmd)
	
	--print('gpio.set_value:', grp, idx, ret, str)
end


-- @brief ��ȡgpio�ź�ֵ
-- @param [in]  	grp[number]		���
-- @param [in]		idx[number]		�������
-- @return [number] �ź�ֵ[0, 1]
gpio.get_value = function (grp, idx)
	local id = get_grp_id(grp, idx)
	local cmd = string.format('cat /dev/key_dev')	
	local ret, str = unix.shell(cmd)
	
	local value = tonumber(str)
	return value
end

return gpio
