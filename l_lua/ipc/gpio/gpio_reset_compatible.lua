--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/10/14
--
-- @file    gpio_reset_compatible.lua
-- @brief   gpio_reset������λ,�����Լ��
-- @author	������
-- @version 0.1
-- @warning û�о���
-- @note
--  3519�ɰ�(2019/9ǰ)��GPIO3_4����ΪJTAG, ��GPIO3_4��ȡ��ֵһֱΪ�͵�ƽ0;
--  3519�°彫GPIO3_4����Ϊgpio��, �Ӹߵ�ƽ��Ϊ�͵�ƽ, ���ʾ��Ҫ��λ;
--  Ϊ�������������: 3519���ȱ���õ�һϵ�иߵ�ƽ, ����Ч��λģ��
--]]
local table = require("table")
local l_sys = require("l_sys")
local chip = l_sys.chip	-- оƬ�ͺ�


local enable = true			-- Ĭ��ʹ��

if 'hi_3519' == chip or 'hi_3516av200' == chip then
	enable = false			-- 3519, 3516av200Ĭ�ϲ�ʹ��, ��Ҫ���ݴ���
end


local check_num = 6		-- ������

local gpio_values = {}


-- ����Ƿ����ʹ��
local check_enable_reset = function ()
	if check_num ~= #gpio_values then
		return false
	end

	-- ���ߵ�ƽ����
	local hi_num = 0
	for k, v in pairs(gpio_values) do
		if 0 ~= v then
			hi_num = hi_num + 1 
		end
	end

	-- ���� check_num - 1 ���ߵ�ƽ, ����Ϊ����ʹ��
	if check_num <= hi_num + 1 then
		return true
	end	
	
	return false
end


-- ��λģ���Ƿ�ʹ��
-- ������֮��, Ҫ���û���Ҫ��Ъ�԰���λ��
local gpio_reset_compatible = function (v)	
	if enable then
		return true -- �����ʹ��״̬, ����治�ټ��
	end

	-- ����ֵ����table 
	table.insert(gpio_values, 1, v)
	
	-- ��֤������ֻ�����µļ���ֵ
	while check_num < #gpio_values do
		table.remove(gpio_values)
	end

	-- ����Ƿ����ʹ��
	-- ������⵽����ߵ�ƽ, ����Ϊ����ʹ��
	enable = check_enable_reset()
	
	if enable then
		print('ipc.gpio.gpio_reset_compatible, check enable true!')
		
		gpio_values = {}
	end
	
	return enable
end


return gpio_reset_compatible
