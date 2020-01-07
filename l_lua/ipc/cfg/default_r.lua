--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  ����ֻ����
-- @author ������
--]]

local version = require("ipc.cfg.version")
local default_r_adjust = require("ipc.cfg.default_r_adjust")


local default_r = {

	-- �˻�, ��0�� ��Ϊ: user_name0
	user_name0 = {
		--name = 'admin', passwd = '123456', type = 'administrators',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'administrators', 'operator', 'user'}
		}
	},
	
	-- �˻�, ��1�� ��Ϊ: user_name1
	user_name1 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},
	
	-- �˻�, ��2�� ��Ϊ: user_name2
	user_name2 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},
	
	-- �˻�, ��3�� ��Ϊ: user_name3
	user_name3 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},


	-- �˻�, ��4�� ��Ϊ: user_name4
	user_name4 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},


	-- �˻�, ��5�� ��Ϊ: user_name5
	user_name5 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},


	-- �˻�, ��6�� ��Ϊ: user_name6
	user_name6 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},

	-- �˻�, ��7�� ��Ϊ: user_name7
	user_name7 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},

	-- �˻�, ��8�� ��Ϊ: user_name8
	user_name8 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},

	-- �˻�, ��9�� ��Ϊ: user_name9
	user_name9 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},

	-- �˻�, ��1�� ��Ϊ: user_name10
	user_name10 = {
		--name = '', passwd = '', type = '',
		--auth = { cfg = true, ctrl = true, ctrl_sys = true },
		range = {
			type = {'operator', 'user'}
		}
	},

	-- ������Ϣ
	system = {
		sn = 'YDFE4EFDFESHEDFR',
		hw_ver = version.hw_ver or 'h1.0.6',
		sw_ver = version.sw_ver or 'v1.0.6',
		build_time = version.build_time or '2019-04-30 14:24:56 +08:00',
		model = 'wifi-ipc',
		dev_type = 'ipc',
		chnn_num = 1,
		disk_num = 0,
		mac = '00:13:09:FE:45:78',
		mac_wireless = '00:13:09:FE:45:79'
	},
	
	-- �豸����
	--name = {
	--	name = 'IPC'
	--},
	
	-- NTP
	ntp = {
		--enable = false,
		--server = 'ntp1.aliyun.com',
		--port = 123,
		--interval = 604800,
		range = {
			port = {
				min = 1,
				max = 65535
			},
			interval = {
				min = 3600,
				max = 5184000
			}
		},
		recommend = {
			server = {
				'ntp1.aliyun.com',
				'ntp2.aliyun.com'
			}
		}
	},
	
	-- ����ipv4
	--ipv4 = {
	--	dhcp = true,
	--	ip = '192.168.1.247',
	--	gateway = '192.168.1.1',
	--	netmask = '255.255.255.0',
	--	dns1 = '192.168.1.1',
	--	dns2 = ''
	--},
	
	-- �����������
	wireless = {
		--type = 'ap',
		--net = '5g',
		--ssid = 'f701w_v2',
		--passwd = '123456',
		--enc = 'wpa2-psk',
		range = {
			type = {'ap', 'sta'},
			net = {'2.4g', '5g'},
			enc = {'none', 'psk', 'wpa2 psk', 'wpa-wpa2 psk'}
		}
	},
	
	-- ��������ipv4
	--wireless_ipv4 = {
	--	dhcp = true,
	--	ip = '192.168.7.247',
	--	gateway = '192.168.7.1',
	--	netmask = '255.255.255.0',
	--	dns1 = '192.168.7.1',
	--	dns2 = '',
	--},
	
	-- �������˿�
	--net_port = {
	--	port = 80
	--},
	
	-- UPNP��Ϣ
	--upnp = {
	--	analbe = false,
	--	auto = false,
	--	external_port = 80
	--},	
	
	-- stream, 0ͨ��, ������ ��Ϊ: stream_chnn0_idx0
	stream_chnn0_idx0 = {
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
				max = 25
			},
			bitrate = {
				min = 256,
				max = 6144
			},
			i_interval = {
				min = 25,
				max = 90
			}
		}
	},
	
	-- stream, 0ͨ��, ������ ��Ϊ: stream_chnn0_idx1
	stream_chnn0_idx1 = {
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
				max = 25
			},
			bitrate = {
				min = 128,
				max = 1536
			},
			i_interval = {
				min = 25,
				max = 90
			}
		}
	},
	
	-- stream pic, 0ͨ��, ͼƬ��1 ��Ϊ: stream_pic_chnn0_idx64
	stream_pic_chnn0_idx64 = {
		--fmt = 'jpeg',
		--wh = '5120*3840',
		--quality = 'higher',
		--interval_ms = 333,
		range = {
			fmt = {'jpeg'},
			wh = {'5120*3840', '4000*3000', '3264*2448', '2304*1728'},
			quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
			interval_ms = {
				min = 333,
				max = 3600000
			}
		}
	},
	
	-- stream pic, 0ͨ��, ͼƬ��2 ��Ϊ: stream_pic_chnn0_idx65
	stream_pic_chnn0_idx65 = {
		--fmt = 'jpeg',
		--wh = '960*540',
		--quality = 'higher',
		--interval_ms = 333,
		range = {
			fmt = {'jpeg'},
			wh = {'960*540', '640*360'},
			quality = {'highest', 'higher', 'high','middle','low','lower', 'lowest'},
			interval_ms = {
				min = 142,
				max = 3600000
			}
		}
	},
	
	-- image ͼ��, 0ͨ�� ��Ϊ: image_chnn0
	--image_chnn0 = {
	--	bright = 50,
	--	contrast = 50,
	--	saturation = 50,
	--	hue = 50
	--},
	
	-- img_wd ͼ���̬, 0ͨ�� ��Ϊ: img_wd_chnn0
	--img_wd_chnn0 = {
	--	enable = true,
	--	value = 50
	--},
	
	-- img_dnr ͼ����, 0ͨ�� ��Ϊ: img_dnr_chnn0
	img_dnr_chnn0 = {
		--dnr_type = 'none',
		--value = 50,
		range = {
			dnr_type = {'none', 'normal'}
		}
	},
	
	-- img_rotate ͼ����ת, 0ͨ�� ��Ϊ: img_rotate_chnn0
	img_rotate_chnn0 = {
		--rotate = 0,
		range = {
			rotate = {0, 180}
		}
	},
	
	-- img_awb ͼ���ƽ��, 0ͨ�� ��Ϊ: img_awb_chnn0
	img_awb_chnn0 = {	
		--awb = 'auto',
		--b = 2047,
		--gb = 2047,
		--gr = 2047,
		--r = 2047,
		range = {
			awb = {'auto', 'manual'},
			b = {min = 0, max = 4095},
			gb = {min = 0, max = 4095},
			gr = {min = 0, max = 4095},
			r = {min = 0, max = 4095}
		}
	},
	
	-- img_mirror_flip ͼ�����Ҿ���,���·�ת, 0ͨ�� ��Ϊ: img_mirror_flip_chnn0
	--img_mirror_flip_chnn0 = {
	--	mirror = false,
	--	flip = true			-- Ĭ�����·�ת : f701w Ԥ��
	--},
	
	-- img_exposure ͼ���ع�, 0ͨ�� ��Ϊ: img_exposure_chnn0
	img_exposure_chnn0 = {
		--compensation = 0x38,
		range = {
			compensation = {min = 0, max = 0xff},
		}
	},
	
	-- OSD osd_timestamp ʱ���, 0ͨ�� ��Ϊ: osd_timestamp_chnn0
	osd_timestamp_chnn0 = {
		--enable = false,
		--format = 'YY-MM-DD HH:MM:SS.3',
		--pos = 'right,top',
		--font_size = 'middle',
		range = {
			format = {
				'YY-MM-DD HH:MM:SS.3',
				'YY-MM-DD HH:MM:SS',
				'YY/MM/DD HH:MM:SS.3',
				'YY/MM/DD HH:MM:SS',
				'MM-DD-YY HH:MM:SS.3',
				'MM-DD-YY HH:MM:SS',
				'MM/DD/YY HH:MM:SS.3',
				'MM/DD/YY HH:MM:SS'
			},
			pos = {
				'right,top',
				'right,center',
				'right,bottom',
				'left,top',
				'left,center',
				'left,bottom',
				'center,top',
				'center,center',
				'center,bottom'
			},
			font_size = {'smallest','smaller','small','middle','larg','larger','largest'}
		}
	}
}


-- �������Ʒ��صĲ���
default_r_adjust(default_r)


return default_r
