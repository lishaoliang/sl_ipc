--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/04/03
--
-- @file    wpa_cli.lua
-- @brief   wpa_cli�ӿڷ�װ
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/04/03 0.1 �����ļ�
-- @warning û�о���
--]]

local string = require("string")
local l_sys = require("l_sys")
local sh = l_sys.sh

local util = require("base.util")
local util_ex = require("base.util_ex")


local wpa_cli = {}


local path_wpa_cli = '/opt/wireless_tools/wpa_cli'
local iwlan = '-iwlan0'


-- @brief ִ��wpa_cli������
-- @param [in]		msg[string]	�����ַ���
-- @return [number]  shell������
--			[string] shell�Ľ���ַ���
local wpa_cli_cmd = function (msg)
	local cmd = string.format('%s %s %s', path_wpa_cli, iwlan, msg)

	local ret, str = sh(cmd)
	--print('cmd:'..msg, ret, str)
	
	return ret, str
end


-- @brief ����ַ������Ƿ�����ȷ�Ĵ�����Ϣ
-- @param [in]  	str[string]	�ַ���
-- @return [boolean] true.���д�����Ϣ; false.δ���д�����Ϣ
local check_is_error = function (str)
	local low = string.lower(str)
	
	if nil ~= string.find(low, 'failed') then	-- 'Failed'
		return true
	end
	
	if nil ~= string.find(low, 'error') then	-- 'error'
		return true
	end

	-- 'No such file or directory'
	if nil ~= string.find(low, 'no such file or directory') then
		return true
	end
	
	return false
end

-- @brief ̽��wpa_supplicant�Ƿ�����
-- @return [boolean] 	wpa_supplicant�Ƿ�����
--			[boolean]	ping�Ƿ�ɹ�
wpa_cli.ping = function ()
	local ret, str = wpa_cli_cmd('ping')	
	str = string.lower(str)

	local err = check_is_error(str)
	
	if not err and nil ~= string.find(str, 'pong') then	-- 'PONG'
		return not err, true
	end
	
	return not err, false
end

-- @brief ��wpa_supplicant����ɨ��
-- @return [boolean] 	wpa_supplicant�Ƿ���ɨ��
-- @note ����ɨ��һ��ʱ���[����], �ſ���������ȡap�б�
wpa_cli.scan = function ()
	local ret, str = wpa_cli_cmd('scan')	
	str = string.lower(str)

	if nil ~= string.find(str, 'ok') then	-- 'OK'
		return true
	end
	
	return false
end

-- @brief ��ȡwifi�����µ�ap�б�
-- @return [table] 	ap�б�
wpa_cli.scan_results = function ()
	local ret, str = wpa_cli_cmd('scan_results')
	
--[[
local str =
'bssid / frequency / signal level / flags / ssid\n' ..
'7c:76:68:b6:9d:24       5805    -39     [WPA2-PSK-CCMP][WPS][ESS]       HUAWEI-7NLNPF_5G\n' ..
'94:d9:b3:a6:d0:73       5180    -41     [WPA-PSK-TKIP+CCMP][WPA2-PSK-TKIP+CCMP][ESS]    whsl5.8\n' ..
'7c:76:68:b6:9d:20       2437    -40     [WPA2-PSK-CCMP][WPS][ESS]       HUAWEI-7NLNPF\n' ..
'7c:76:68:b6:9d:21       2437    -38     [WPA2-PSK-CCMP][ESS]    \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\n' ..
'94:d9:b3:a6:d0:6e       2442    -42     [WPA-PSK-TKIP+CCMP][WPA2-PSK-TKIP+CCMP][ESS]    whsl2.4\n' ..
'02:27:1d:06:31:a0       2462    -80     [WPA2-EAP-CCMP][ESS]    CMCC\n' ..
'78:44:fd:1e:b1:27       2412    -82     [WPA-PSK-CCMP][WPA2-PSK-CCMP][ESS]      TP-LINK_B127\n' ..
'68:db:54:b7:3e:81       2462    -82     [WPA-PSK-TKIP+CCMP][WPA2-PSK-TKIP+CCMP][ESS]    gg-007\n' ..
'38:22:d6:ab:99:50       2462    -76     [ESS]   ChinaNet'
--]]

	local aps = {}

	for bssid, frequency, signal, flags, ssid in string.gmatch(str, '([^%s]+)%s+([%d%-]+)%s+([%d%-]+)%s+([^%s]+)%s+([^%s]+)%c*') do	
		if nil ~= bssid and nil ~= frequency and nil ~= signal and nil ~= flags and nil ~= ssid then
			local o = {
				bssid = util.trim_cs(bssid),
				frequency = util.trim_cs(frequency),
				signal = util.trim_cs(signal),
				flags = util.trim_cs(flags),
				ssid = util.trim_cs(ssid)
			}
			
			table.insert(aps, o)
		end
	end
	
	return aps
end


-- @brief ��ȡ��ǰ״̬
-- @return [table] 	״̬
wpa_cli.status = function ()
	local ret, str = wpa_cli_cmd('status')

--[[
local str = 
'bssid=7c:76:68:b6:9d:24\n' ..
'ssid=HUAWEI-7NLNPF_5G\n' ..
'id=0\n' ..
'mode=station\n' ..
'pairwise_cipher=CCMP\n' ..
'group_cipher=CCMP\n' ..
'key_mgmt=WPA2-PSK\n' ..
'wpa_state=COMPLETED\n' ..
'ip_address=192.168.7.1\n' ..
'p2p_device_address=50:2b:73:d5:27:1d\n' ..
'address=50:2b:73:d5:27:1d\n'
--]]

	local s = {}
	
	for k, v in string.gmatch(str, '([%w_]+)=([^%c]+)%c*') do
		if nil ~= k and nil ~= v then
			k = util.trim_cs(k)
			v = util.trim_cs(v)
			
			if '' ~= k then
				s[k] = v
			end	
		end	
	end
	
	return s
end


-- @brief �Ͽ���ǰ����
-- @return [boolean] true,false
wpa_cli.disconnect = function ()
	local ret, str = wpa_cli_cmd('disconnect')	
	str = string.lower(str)

	if nil ~= string.find(str, 'ok') then	-- 'OK'
		return true
	end
	
	return false
end


-- @brief ��������; ��������֮ǰ, ��Ҫ�Ͽ�����
-- @return [boolean] true,false
wpa_cli.reconnect = function ()
	local ret, str = wpa_cli_cmd('reconnect')
	str = string.lower(str)

	if nil ~= string.find(str, 'ok') then	-- 'OK'
		return true
	end
	
	return false
end


--wpa_cli.status()
--wpa_cli.scan_results()

--[[
print('ping', wpa_cli.ping())
util_ex.printf('status', wpa_cli.status())


print('scan', wpa_cli.scan())

l_sys.sleep(1000)

util_ex.printf('scan_results', wpa_cli.scan_results())
--]]

return wpa_cli
