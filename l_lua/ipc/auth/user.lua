--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- Created: 2018/12/21
--
-- @file    user.lua
-- @brief   �û�Ȩ��
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]
local l_sys = require("l_sys")

local np_err = require("base.np_err")

local user = {}


-- @variable Ĭ�����ӳ�ʱ,12Сʱ
local timeout = 1000 * 3600 * 12


-- @variable ���лỰ
local session = {}


-- @brief �û���¼
-- @param [in] lg[table] ��¼��Ϣ
-- @return [boolean][string][string]�Ƿ�ɹ�
-- @note �����ӶϿ�, �Զ�ע��;ͨ���������ֵ�¼״̬ 
--  \n ��¼��Ϣ����
--  \n username = 'xxxx'
--  \n passwd = 'xxxx'
user.login = function (lg)
	--if 'table' ~= lg then
	--	return false, '', ''
	--end	
	
	--local username = lg['username']
	--local passwd = lg['passwd']
	
	local llssid = l_sys.rand_char(12)
	local llauth = l_sys.rand_char(16)

	while true do
		if nil == session[llssid] then
			break
		end	
		
		llssid = l_sys.rand_char(12)
	end
	
	--session[llssid] = {
	--	llauth = llauth,
	--	tc = timeout
	--}
	
	return np_err.OK, llssid, llauth
end

user.logout = function (llssid, llauth)
	--local v = session[llssid]
	
	--if nil ~= v and llauth == v.llauth then
	--	session[llssid] = nil
	--end
end


-- @brief ��ʱ��
-- @param [in] id[number] ��ʱ��id
-- @param [in] count[number] �ڼ��λص�(��1��ʼ����,����int��֮��ص�1)
-- @param [in] interval[number] ��ʱ���õ�ʱ����
-- @param [in] tc[number] ��ǰʱ��
-- @param [in] last_tc[number] ��һ�λص���ʱ��
-- @return 0.��ʾ����������; ��0.ɾ����ʱ��
local on_timer = function (id, count, interval, tc, last_tc)

	return 0
end

-- @brief �û�ģ���ʼ����
-- @return ��
user.setup = function ()
	
	
	
	-- ��Ӷ�ʱ��
	local ret = l_sys.add_timer(999, 1000, on_timer)
	--local ret = l_sys.add_timer(999, 60000, on_timer)
	assert(ret)
end

return user
