--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- Created: 2018/12/21
--
-- @file    imsg.lua
-- @brief   IPCȫ����Ϣͨ������; ֧�ֿ�Lua�̷߳���
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]
local l_tpool = require("l_tpool")
local l_tmsg = require("l_tmsg")

local imsg = {}

-- @name   imsg.update_phynet
-- @export ��������������Ϣ����Ϣ����
imsg.update_phynet = 'update_phynet'


-- @name   imsg.update_nsm
-- @export ����nsm��Ϣ����Ϣ����
imsg.update_nsm = 'update_nsm'


-- @brief imsg ģ���ʼ��
--  \n �Ƕ��߳���ȫ
--  \n ����ȫ��ʹ��, ע������Lua�̵߳���
imsg.init = function ()

	for k, v in pairs(imsg) do
		if 'string' == type(v) then
			print('lua imsg register name:', v)
			local ret = l_tmsg.register(v)
			assert(ret)
		end
	end
end


-- @brief imsg ģ���˳�
--  \n �Ƕ��߳���ȫ
--  \n ����ȫ��ʹ��, ע������Lua�̵߳���
imsg.quit = function ()

end


-- @brief ������Ϊname����Ϣ����post��Ϣ
-- @param [in] name[string] ��Ϣ��������
-- @param [in] msg[string]	��Ϣ
-- @param [in] lparam[string] lparam����
-- @param [in] wparam[string] wparam����
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name�Ķ���
-- @note ���̰߳�ȫ
imsg.post = function (name, msg, lparam, wparam)
	return l_tmsg.post(name, msg, lparam, wparam, nil)
end


-- @brief ������Ϊname����Ϣ�����л�ȡ��Ϣ
-- @param [in] name[string] ��Ϣ��������
-- @return	ret[boolean] 	true��ʾ������
--  \n		msg[string]		��Ϣ
--  \n		lparam[string]	lparam����
--  \n		wparam[string]	wparam����
--  \n 		cobj[userdata]	c����ָ��
-- @note ���̰߳�ȫ
imsg.get = function (name)
	local ret, msg, lparam, wparam, cobj= l_tmsg.get(name)	
	return ret, msg, lparam, wparam
end


-- test
--[[
imsg.init()
for i = 1, 10 do
	imsg.post(imsg.update_wifi, 'msg wifi', 'wifi lparam', 'wifi wparam')
end
for i = 1, 5 do
	print(imsg.get(imsg.update_wifi))
end
imsg.quit()
--]]

return imsg
