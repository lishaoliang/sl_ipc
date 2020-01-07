--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/04
--
-- @file    wlan.lua
-- @brief   wlan���ڹ���
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/04 0.1 �����ļ�
-- @note
--	\n 169.254.0.0/16 ����˽�е�ַ��
--  \n 169.254.100.123	eth0��������Ĭ�ϵ�ַ
--  \n 169.254.110.123	wlan0��������Ĭ�ϵ�ַ
-- @warning û�о���
--]]

local string = require("string")
local l_sys = require("l_sys")
local sh = l_sys.sh;

local unix = require("base.unix")

local wlan = {}


local path_udhcpc = 'udhcpc'
local path_wpa = '/opt/wireless_tools/wpa_supplicant'
local path_dnsmasq = '/opt/dnsmasq'
local path_hostapd = '/opt/wireless_tools/hostapd'


wlan.shell = function (tool, msg)
	local cmd = string.format('%s %s', tool, msg)
	
	local ret, str = unix.shell(cmd)
	print('wlan0 cmd:'..cmd, ret, str)	
	
	return ret, str
end


wlan.clean = function ()	
	unix.kill('udhcpc', 'wlan0')
	unix.killall('wpa_supplicant')
	unix.killall('dnsmasq')
	unix.killall('hostapd')
	
	-- wlan ��������
	l_sys.sleep(50)	
	wlan.shell('ifconfig', 'wlan0 down')
	
	-- ���¼�������, apģʽ��ʼ��ʱ, ��Ҫ�����Ǹɾ���
	-- ��wlan0��ԭΪ: ����������״̬
	l_sys.sleep(10)
	wlan.shell('rmmod', 'rtl8812au')
	
	l_sys.sleep(10)
	wlan.shell('insmod', '/komod/extdrv/rtl8812au/rtl8812au.ko')
	
	l_sys.sleep(10)
end

wlan.env_ap = function ()
	wlan.clean()
	
	wlan.shell('ifconfig', 'wlan0 192.168.7.1/24 up')
	--wlan.shell('route', 'add -net 224.0.0.0 netmask 240.0.0.0 dev wlan0')
	
	wlan.shell(path_hostapd, '/opt/configfile/rtl_hostapd_5G.conf -B')
	wlan.shell(path_dnsmasq, '-C /etc/dnsmasq.conf')
end

wlan.env_sta = function ()
	wlan.clean()
	
	wlan.shell('ifconfig', 'wlan0 169.254.110.123 up')
	--wlan.shell('route', 'add -net 224.0.0.0 netmask 240.0.0.0 dev wlan0')
	
	wlan.shell(path_wpa, '-Dnl80211 -iwlan0 -c /opt/configfile/wpa_0_8.conf -B')
end


wlan.sta_reset = function ()
	-- sta ģʽ��, ����wifi����, ���ر�
	-- ip addr flush dev wlan0

	unix.kill('udhcpc', 'wlan0')
	wlan.shell('ip', 'addr flush dev wlan0')
	wlan.shell('ifconfig', 'wlan0 169.254.110.123 up')
end


wlan.set_sta_ipv4 = function (ip, mask, gateway)
	-- ifconfig wlan0 192.168.5.40 netmask 255.255.255.0
	
	wlan.sta_reset()	
	
	local msg = string.format('wlan0 %s', ip)
	if 'string' == type(mask) and '' ~= mask then
		msg = string.format('%s netmask %s', msg, mask)
	end	
	wlan.shell('ifconfig', msg)
	
	--if 'string' == type(gateway) and '' ~= gateway then
	--	-- ip route add via 192.168.3.1 dev wlan0
	--	local gw = string.format('add via %s dev wlan0', gateway)
	--	wlan.shell('route', gw)
	--end
end

wlan.set_sta_dhcp = function ()
	-- ���绷���� udhcpc ��Ӱ��ϴ�
	-- -b ��̨����, -R �˳�ʱ�ͷ�IP, -T 3�볬ʱ, -A 6���ȴ�6��

	wlan.sta_reset()	
	
	wlan.shell(path_udhcpc, '-i wlan0 -b -R -T 3 -A 6');
end

--[[ TEST
local count = 10
while 0 < count do
	count = count - 1
	
	wlan.env_ap()

	l_sys.sleep(3000)

	wlan.env_sta()
	wlan.env_udhcpc()
	
	l_sys.sleep(3000)
end
--]]

return wlan
