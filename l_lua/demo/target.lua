--[[
-- Copyright (c) 2019 �人˴�����, All Rights Reserved
-- Created: 2019/11/15
--
-- @brief	Ŀ������豸��Ϣ
-- @author	������
-- @see https://github.com/lishaoliang/l_sdk_doc
--]]

local target = {}
local l_sys = require("l_sys")



-- @name   target.ip
-- @export Ŀ��IP��ַ
--target.ip = '192.168.1.247'
target.ip = '192.168.3.150'


-- @name   target.port
-- @export Ŀ��˿�
target.port = 80


-- @name   target.protocol
-- @export ʹ�õ�Э��
target.protocol = 'nspp'
if 'hisi_linux' == l_sys.platform then
	target.protocol = 'nspp_local'	-- �����������ϲ���, ��ʹ�ñ���Э��
end


-- @name   target.path_local
-- @export ����unixЭ������·��
target.path_local = '/nfsmem/socket.ui'


-- @name   target.username
-- @export �û���
target.username = 'admin'


-- @name   target.passwd
-- @export ����
target.passwd = '123456'


-- @name   target.wifi_ssid
-- @export �������STAģʽ��,�����ӵ�Ŀ��wifi��ssid����
target.wifi_ssid = 'HUAWEI-7NLNPF_5G'


-- @name   target.wifi_passwd
-- @export �������STAģʽ��,�����ӵ�Ŀ��wifi������
target.wifi_passwd = 'qwertyuiop1234567890'



return target
