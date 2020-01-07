--[[
-- Copyright (c) 2019 �人˴�����, All Rights Reserved
-- Created: 2019/11/15
--
-- @brief	��¼���豸
-- @author	������
-- @see https://github.com/lishaoliang/l_sdk_doc
--]]
local l_lif = require("l_lif")
local to_json =  require("demo.to_json")


-- @brief ��¼���豸
-- @param [in]  	ip[string]			�豸ip
-- @param [in]		port[number]		�˿�
-- @param [in]		username[string]	�û���
-- @param [in]		passwd[string]		����
-- @return err_id[number]	 0.�ɹ�; ��0.������
--	\n		login_id[number] ��¼�ɹ�֮��ĵ�¼id	
-- @see https://github.com/lishaoliang/l_sdk_doc/blob/master/protocol/auth.md
--  \n 'err_id'������: https://github.com/lishaoliang/l_sdk_doc/blob/master/protocol/net_err.md
local login = function (protocol, ip, port, path, username, passwd)
	local req = {
		cmd  = 'login',
		
		protocol = 20,--protocol, -- 'nspp', 'nspp_local'	
		ip = ip,
		port = port,
		path = path,
		
		login = {
			username = username,
			passwd = passwd
		}
	}
	
	local json = to_json(req)
	--print('login json:', json)
	
	local err_id = l_lif.login(json)
	
	return err_id
end

return login
