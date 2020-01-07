--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/08
--
-- @file    phynet.lua
-- @brief   phynet���ڹ���
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
local cjson  = require("cjson")
local l_sys =  require("l_sys")
local util = require("base.util")
local util_ex = require("base.util_ex")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")

local eth0 = require("ipc.phynet.eth0")
local wlan = require("ipc.phynet.wlan")
local write_wpa_cfg = require("ipc.phynet.write_wpa_cfg")
local wpa_cli = require("ipc.phynet.wpa_cli")

local cfg = require("ipc.cfg.cfg")


local phynet = {}


-- �Ƿ��������
local ctrl_eth0 = true
local ctrl_wlan0 = true

-- wlan ����
local cfg_wlan = {
	mode_ap = true,
	
	update = false,	-- dhcp, ip, netmask, gateway�Ƿ񱻸���
	dhcp = true,
	ip = '',
	netmask = '',
	gateway = ''
}

local set_ipv4 = function (lobj)
	if not ctrl_eth0 then
		return
	end

	if lobj['dhcp'] then
		eth0.set_dhcp()
	else
		eth0.set_ipv4(lobj['ip'], lobj['netmask'], lobj['gateway'])
	end
end


local set_wireless = function (lobj)
	if not ctrl_wlan0 then
		return
	end

	if 'sta' == lobj['type'] then
		cfg_wlan.mode_ap = false
		write_wpa_cfg(lobj['ssid'], lobj['passwd'])
		wlan.env_sta()
		
		-- sta ֮������һ��ip
		if cfg_wlan.update then
			if cfg_wlan.dhcp then
				wlan.set_sta_dhcp()
			elseif '' ~= cfg_wlan.ip and '' ~= cfg_wlan.netmask then
				wlan.set_sta_ipv4(cfg_wlan.ip, cfg_wlan.netmask, cfg_wlan.gateway)
			end
		end
	else	
		cfg_wlan.mode_ap = true
		wlan.env_ap()
	end
end

local set_wireless_ipv4 = function (lobj)
	if not ctrl_wlan0 then
		return
	end

	local dhcp = lobj['dhcp']
	local ip = lobj['ip']
	local netmask = lobj['netmask']
	local gateway = lobj['gateway']

	cfg_wlan.dhcp = dhcp
	cfg_wlan.ip = ip
	cfg_wlan.netmask = netmask
	cfg_wlan.gateway = gateway
	cfg_wlan.update = true
	
	if cfg_wlan.mode_ap then
		return
	end
	
	if cfg_wlan.dhcp then
		wlan.set_sta_dhcp()
	else
		wlan.set_sta_ipv4(cfg_wlan.ip, cfg_wlan.netmask, cfg_wlan.gateway)
	end
end

phynet.check_proc = function (tc)
	-- lparam �ṹ �μ� ipc.cfg.default_v.lua

	local b_update_broadcast = false
	
	while true do
		local ret, msg, lparam = imsg.get(imsg.update_phynet)
	
		if ret then
			print('phynet.check_proc msg:', msg, lparam)
			-- ���º�������ģʽ����, ����Ҷ����߳�
			local ret, lobj = pcall(cjson.decode, lparam)
			if ret and not util.t_is_empty(lobj) then
				if 'ipv4' == msg then
					pcall(set_ipv4, lobj)
					b_update_broadcast = true
				elseif 'wireless' == msg then
					pcall(set_wireless, lobj)
					b_update_broadcast = true
				elseif 'wireless_ipv4' == msg then
					pcall(set_wireless_ipv4, lobj)
					b_update_broadcast = true
				else
					print('unsupport!', msg, lparam)
				end
			else
				print('msg error!', msg, lparam)
			end
		else
			break
		end
	end
	
	-- �޸�IP��ַ֮��, ֪ͨ�����¹㲥
	if b_update_broadcast then
		iworker.post(iworker.lw_discover, 'broadcast_ser.update', '', '')
	end
end


phynet.setup = function ()
	-- ��������
	local ipv4 = cjson.encode(cfg.get('ipv4'))
	imsg.post(imsg.update_phynet, 'ipv4', ipv4, '')

	-- wireless
	local wireless = cjson.encode(cfg.get('wireless'))
	imsg.post(imsg.update_phynet, 'wireless', wireless, '')

	-- wireless_ipv4
	local wireless_ipv4 = cjson.encode(cfg.get('wireless_ipv4'))
	imsg.post(imsg.update_phynet, 'wireless_ipv4', wireless_ipv4, '')
end

return phynet
