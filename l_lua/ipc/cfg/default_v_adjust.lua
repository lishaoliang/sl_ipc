--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  Ĭ����������; �ɱ����Ŀ, ����ú��Զ���Ŀ��ͻ
--		��׼�汾Ϊ hi_3519, �����汾��Ҫ�ڴ˵����������
-- @author ������
--]]

local l_sys = require("l_sys")


local default_v_hi_3516a = function (default_v)

	-- stream pic, 0ͨ��, ͼƬ��1 ��Ϊ: stream_pic_chnn0_idx64
	default_v['stream_pic_chnn0_idx64'] = {
		fmt = 'jpeg',
		wh = '2592*1944',
		quality = 'higher',
		interval_ms = 333,
		--range = {
		--	fmt = {'jpeg'},
		--	wh = {'2592*1944', '2304*1728', '1600*1200'},
		--	quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
		--	interval_ms = {
		--		min = 333,
		--		max = 3600000
		--	}
		--}
	}
	
end


local default_v_hi_3519_imx385 = function (default_v)

	-- stream pic, 0ͨ��, ͼƬ��1 ��Ϊ: stream_pic_chnn0_idx64
	default_v['stream_pic_chnn0_idx64'] = {
		fmt = 'jpeg',
		wh = '1920*1080',
		quality = 'higher',
		interval_ms = 333,
		--range = {
		--	fmt = {'jpeg'},
		--	wh = {'1920*1080', '1280*720', '960*540'},
		--	quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
		--	interval_ms = {
		--		min = 333,
		--		max = 3600000
		--	}
		--}
	}

		-- stream, 0ͨ��, ������ ��Ϊ: stream_chnn0_idx0
	default_v['stream_chnn0_idx0'] = {
		fmt = 'h264',
		rc_mode = 'cbr',
		wh = '1920*1080',
		quality = 'high',
		frame_rate = 60,
		bitrate = 12288,
		i_interval = 120,
		--range = {
		--	fmt = {'h264'},
		--	rc_mode = {'vbr', 'cbr'},
		--	wh = {'1920*1080', '1280*720', '960*540'},
		--	quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
		--	frame_rate = {
		--		min = 1,
		--		max = 25
		--	},
		--	bitrate = {
		--		min = 256,
		--		max = 12288
		--	},
		--	i_interval = {
		--		min = 25,
		--		max = 90
		--	}
		--}
	}
	
	-- stream, 0ͨ��, ������ ��Ϊ: stream_chnn0_idx1
	default_v['stream_chnn0_idx1'] = {
		fmt = 'h264',
		rc_mode = 'cbr',
		wh = '960*540',
		quality = 'high',
		frame_rate = 60,
		bitrate = 3072,
		i_interval = 60,
		--range = {
		--	fmt = {'h264'},
		--	rc_mode = {'vbr', 'cbr'},
		--	wh = {'960*540', '640*360'},
		--	quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
		--	frame_rate = {
		--		min = 1,
		--		max = 25
		--	},
		--	bitrate = {
		--		min = 128,
		--		max = 3072
		--	},
		--	i_interval = {
		--		min = 25,
		--		max = 90
		--	}
		--}
	}
end


local default_v_adjust = function (default_v)
	local chip = l_sys.chip

	-- ���ݲ�Ʒchip, �������ֲ���
	if 'hi_3516a' == chip then
		default_v_hi_3516a(default_v)
	elseif 'hi_3519_imx385' == chip then
		default_v_hi_3519_imx385(default_v)
	end
	
end


return default_v_adjust
