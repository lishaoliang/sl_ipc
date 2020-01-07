--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  ����ֻ����
--		��׼�汾Ϊ hi_3519, �����汾��Ҫ�ڴ˵����������
-- @author  ������
--]]

local l_sys = require("l_sys")


local default_r_hi_3516a = function (default_r)

	-- stream pic, 0ͨ��, ͼƬ��1 ��Ϊ: stream_pic_chnn0_idx64
	default_r['stream_pic_chnn0_idx64'] = {
		--fmt = 'jpeg',
		--wh = '2592*1944',
		--quality = 'higher',
		--interval_ms = 333,
		range = {
			fmt = {'jpeg'},
			wh = {'2592*1944', '2304*1728', '1600*1200'},
			quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
			interval_ms = {
				min = 333,
				max = 3600000
			}
		}
	}
	
end


local default_r_hi_3519_imx385 = function (default_r)

	-- stream pic, 0ͨ��, ͼƬ��1 ��Ϊ: stream_pic_chnn0_idx64
	default_r['stream_pic_chnn0_idx64'] = {
		--fmt = 'jpeg',
		--wh = '2592*1944',
		--quality = 'higher',
		--interval_ms = 333,
		range = {
			fmt = {'jpeg'},
			wh = {'1920*1080', '1280*720', '960*540'},
			quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
			interval_ms = {
				min = 333,
				max = 3600000
			}
		}
	}
	
	-- stream, 0ͨ��, ������ ��Ϊ: stream_chnn0_idx0
	default_r['stream_chnn0_idx0'] = {
		--fmt = 'h264',
		--rc_mode = 'cbr',
		--wh = '1920*1080',
		--quality = 'high',
		--frame_rate = 25,
		--bitrate = 3072,
		--i_interval = 75,
		range = {
			fmt = {'h264'},
			rc_mode = {'vbr', 'cbr'},
			wh = {'1920*1080', '1280*720', '960*540'},
			quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
			frame_rate = {
				min = 1,
				max = 60
			},
			bitrate = {
				min = 256,
				max = 12288
			},
			i_interval = {
				min = 60,
				max = 120
			}
		}
	}
	
	-- stream, 0ͨ��, ������ ��Ϊ: stream_chnn0_idx1
	default_r['stream_chnn0_idx1'] = {
		--fmt = 'h264',
		--rc_mode = 'cbr',
		--wh = '960*540',
		--quality = 'high',
		--frame_rate = 25,
		--bitrate = 512,
		--i_interval = 75,
		range = {
			fmt = {'h264'},
			rc_mode = {'vbr', 'cbr'},
			wh = {'960*540', '640*360'},
			quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
			frame_rate = {
				min = 1,
				max = 60
			},
			bitrate = {
				min = 128,
				max = 3072
			},
			i_interval = {
				min = 60,
				max = 120
			}
		}
	}
		
end

local default_r_adjust = function (default_r)
	local chip = l_sys.chip

	-- ���ݲ�Ʒchip, �������ֲ���
	if 'hi_3516a' == chip then
		default_r_hi_3516a(default_r)
	elseif 'hi_3519_imx385' == chip then
		default_r_hi_3519_imx385(default_r)
	end

end

return default_r_adjust
