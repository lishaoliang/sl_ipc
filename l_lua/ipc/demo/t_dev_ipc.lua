--[[
-- @file	t_dev_ipc.lua
-- @brief	�������� libl_dev_ipc.so �ӿ�
--]]
local l_sys = require("l_sys")
local l_dev_ipc = require("l_dev_ipc")



-- ��ӡ����ƽ̨��Ϣ
print('platform=' .. l_sys.platform)
print('chip=' .. l_sys.chip)
print('version=' .. l_sys.version)


-- ��������
local path_driver = 'ipc.driver.' .. l_sys.chip .. '_driver'
local hi_driver = require(path_driver)
hi_driver.load()



l_dev_ipc.init()	-- ��˼Ӳ��ģ���ʼ����mppϵͳ��ʼ��
l_dev_ipc.start()	-- ��˼Ӳ��ģ������


-- �κ�����µ��˳�����
local on_exit = function()
	-- �ر�ҵ��
	l_dev_ipc.stop()
	l_dev_ipc.quit()
	
	hi_driver.unload()
	
	return 0
end

l_on_exit(on_exit)



-- �ȴ�һ��ʱ��, ����Ч����ģ��
l_sys.sleep(1000)



-- ִ��һ��lua�ڴ����
collectgarbage('collect')

local tc_collect = 0
local count = 1000
while 0 < count do
	--count = count - 1

	-- ����ִ��lua�ڴ����
	tc_collect = tc_collect + 100
	if 10000 < tc_collect then
		tc_collect = 0
		collectgarbage('collect')
	end

	l_sys.sleep(100)
end
