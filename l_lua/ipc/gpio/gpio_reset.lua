--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/09/17
--
-- @file    gpio_reset.lua
-- @brief   gpio_reset������λ
-- @author	������
-- @version 0.1
-- @warning û�о���
--]]
local table = require("table")
local l_sys = require("l_sys")
local gpio = require("base.gpio")
local gpio_reset_compatible = require("ipc.gpio.gpio_reset_compatible")
local chip = l_sys.chip	-- оƬ�ͺ�


local gpio_reset = {}


local enable = false	-- �Ƿ�ʹ�� reset
local grp = 3			-- gpio��
local idx = 4			-- gpio�������


if 'hi_3519' == chip or 'hi_3516av200' == chip then	-- 3519ʹ��GPIO3_4
	enable = true
	grp = 3
	idx = 4
elseif 'hi_3516a' == chip then -- 3516aʹ��GPIO10_3
	enable = true
	grp = 10
	idx = 3
	gpio = require("ipc.gpio.gpio_my") -- 3516aʹ���Զ���gpioʵ��
end


local check_tc = 500	-- ���ʱ����
local check_num = 6		-- ������, ��Ҫ��ʱ��Ϊ: check_tc * check_num

local gpio_values = {}


-- �Ƿ���Ҫ��λ
local need_reset = function ()
	if check_num ~= #gpio_values then
		return false
	end

	-- ��ס������, �� ���ߵ�ƽת��Ϊ�͵�ƽ
	-- ������͵�ƽ����
	local low_num = 0
	for k, v in pairs(gpio_values) do
		if 0 == v then
			low_num = low_num + 1 
		end
	end

	-- ���� check_num - 1 ���͵�ƽ, ����Ϊ������λ
	if check_num <= low_num + 1 then
		return true
	end	
	
	return false
end


-- ��ʼ��
gpio_reset.init = function ()
	if not enable then
		print('gpio not enable.', grp, idx)
		return
	end	
	
	gpio.open(grp, idx)
	gpio.set_in(grp, idx)
end


-- �˳�
gpio_reset.quit = function ()
	if not enable then
		return
	end
	
	gpio.close(grp, idx)
end

local time_tc = 0 

-- �������
gpio_reset.check_proc = function (tc)
	if not enable then
		return
	end

	-- ��ʱ
	time_tc = time_tc + tc
	if time_tc < check_tc then
		return
	end
	time_tc = 0
	
	
	-- ��ȡֵ
	local value = gpio.get_value(grp, idx)

	-- �����Ծɰ��߼�, �����Ƿ���Ч������λ�ж�
	if not gpio_reset_compatible(value) then
		return false
	end
	
	-- ����ֵ����table 
	table.insert(gpio_values, 1, value)
	
	-- ��֤������ֻ�����µļ���ֵ
	while check_num < #gpio_values do
		table.remove(gpio_values)
	end
	
	-- ����Ƿ���Ҫ��λ
	return need_reset()
end


return gpio_reset
