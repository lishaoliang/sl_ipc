--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- Created: 2018/12/21
--
-- @file    iworker.lua
-- @brief   IPC�Ĺ����߳�
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]
local l_tpool = require("l_tpool")
local util = require("base.util")

local iworker = {}


-- @name   iworker.lw_dev_ipc
-- @export ��˼�豸�����߳�
iworker.lw_dev_ipc = 'lw_dev_ipc'


-- @name   iworker.lw_discover
-- @export �豸����
iworker.lw_discover = 'lw_discover'


-- @name   iworker.lw_upgrade
-- @export �豸����
iworker.lw_upgrade = 'lw_upgrade'


-- @name   iworker.lw_nmps_listen
-- @export �˿ڼ���ģ��
iworker.lw_nmps_listen = 'lw_nmps_listen'



local lightweight = {'lightweight_1', 'lightweight_2'}



-- @brief iworker ģ���ʼ��
--  \n �Ƕ��߳���ȫ
--  \n ����ȫ��ʹ��, ע������Lua�̵߳���
iworker.init = function ()

end


-- @brief iworker ģ���˳�
--  \n �Ƕ��߳���ȫ
--  \n ����ȫ��ʹ��, ע������Lua�̵߳���
iworker.quit = function ()	

end


-- @brief iworker ģ�� �ڶ��׶γ�ʼ��: ���������߳��ڴ���ɳ�ʼ��
--  \n �Ƕ��߳���ȫ
--  \n ����ȫ��ʹ��, ע������Lua�̵߳���
iworker.start = function ()
	
	-- ����ר�Ŵ���˼�ײ�ӿڹ����߳�
	local ret = l_tpool.create(iworker.lw_dev_ipc, 10, 'ipc.worker.lw_dev_ipc', 'lw_dev_ipc', nil)
	assert(ret)

	-- �����������߳�
	for k, v in pairs(lightweight) do
		if 'string' == type(v) then
			print('lua iworker create thread name:', v)
			local ret = l_tpool.create(v, 10, 'ipc.worker.lightweight', v, nil)
			assert(ret)
		end
	end
	
	-- �����豸����
	local ret = l_tpool.create(iworker.lw_discover, 10, 'ipc.worker.lw_discover', 'lw_discover', nil)
	assert(ret)
	
	-- ��������
	ret = l_tpool.create(iworker.lw_upgrade, 10, 'ipc.worker.lw_upgrade', 'lw_upgrade', nil)
	assert(ret)
	
	-- ��������ģ��
	ret = l_tpool.create(iworker.lw_nmps_listen, 10, 'ipc.worker.lw_nmps_listen', 'lw_nmps_listen', nil)
	assert(ret)
end

-- @brief iworker ģ�� stop
--  \n �Ƕ��߳���ȫ
--  \n ����ȫ��ʹ��, ע������Lua�̵߳���
iworker.stop = function ()
	-- ���ټ���ģ��
	l_tpool.destroy(iworker.lw_nmps_listen)	

	-- �����豸����
	l_tpool.destroy(iworker.lw_upgrade)	
	
	-- �����豸����
	l_tpool.destroy(iworker.lw_discover)

	-- �����������߳�
	for k, v in pairs(lightweight) do
		if 'string' == type(v) then
			l_tpool.destroy(v)
		end
	end

	-- ���ٴ���˼�ײ�ӿڹ����߳�
	l_tpool.destroy(iworker.lw_dev_ipc)
end


-- @brief ������Ϊname���߳�post��Ϣ
-- @param [in] name[string] ��Ϣ��������
-- @param [in] msg[string]	��Ϣ
-- @param [in] lparam[string] lparam����
-- @param [in] wparam[string] wparam����
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name���߳�
-- @note ���̰߳�ȫ
iworker.post = function (name, msg, lparam, wparam)
	return l_tpool.post(name, msg, lparam, wparam, nil)
end


-- @brief ��lightweight�߳�post��Ϣ
-- @param [in] msg[string]	��Ϣ
-- @param [in] lparam[string] lparam����
-- @param [in] wparam[string] wparam����
-- @return [boolean] �Ƿ�ɹ�; ʧ��ԭ��Ϊû���ҵ�name���߳�
-- @note ���̰߳�ȫ
iworker.post_lightweight = function (msg, lparam, wparam)
	local idle = l_tpool.find_idle(lightweight)
	
	local ret = iworker.post(idle, msg, lparam, wparam)
	assert(ret)
	
	return ret
end

return iworker
