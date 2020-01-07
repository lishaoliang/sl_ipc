--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- brief  IPC�������
-- @author  ������
-- note
--]]
local l_sys = require("l_sys")
local l_tpool = require("l_tpool")
local imsg = require("ipc.imsg")
local iworker = require("ipc.iworker")
local inet = require("ipc.inet")
local mcache = require("ipc.mcache")

local l_dev_ipc = require("l_dev_ipc")
local cfg = require("ipc.cfg.cfg")

local check_env = require("ipc.env.check_env")
local check_arping = require("ipc.env.check_arping")
local phynet = require("ipc.phynet.phynet")
local cfg_setup = require("ipc.cfg_setup")

local unix = require("base.unix")
local gpio_reset = require("ipc.gpio.gpio_reset")

-- ��ӡ����ƽ̨��Ϣ
print('platform=' .. l_sys.platform)
print('chip=' .. l_sys.chip)
print('version=' .. l_sys.version)


--������л���
check_env()


-- ��ʼ����������
l_tpool.init()	-- �̵߳�ģ���ʼ��
mcache.init()	-- �߳�֮�乲�����ݳ�ʼ��

cfg.init()		-- ��ʼ�������ļ�
imsg.init()		-- ��ʼ����Ϣ����
iworker.init()	-- ��ʼ�������߳�


-- ��һ�μ�����������
phynet.setup()
phynet.check_proc(1000)


-- ��ʼ��ҵ��ģ��
inet.init()			-- ����ģ���ʼ��
l_dev_ipc.init()	-- ��˼Ӳ��ģ���ʼ����mppϵͳ��ʼ��


-- ����ý����������������ģ���ܻ�ȡ������Ƶ��ͼƬ��
l_dev_ipc.add_listener('my ipc', inet.get_listener())


-- ����ҵ��
inet.start()		-- ����ģ������
l_dev_ipc.start()	-- ��˼Ӳ��ģ������
iworker.start()		-- ���������߳�����


-- ��λ���
local reset = false
gpio_reset.init()


-- �κ�����µ��˳�����
local on_exit = function()
	print('system on_exit,reset=', reset)
	
	gpio_reset.quit() -- �˳�gpio��λ
	
	-- �ر�ҵ��
	iworker.stop()
	l_dev_ipc.stop()
	inet.stop()

	-- �˳�ҵ��
	l_dev_ipc.quit()
	inet.quit()
	
	-- ��������
	iworker.quit()
	imsg.quit()

	if reset then
		print('system reset cfg...')
		cfg.reset()
	end
	
	-- �����˳�	
	cfg.quit()

	-- �̵߳�ģ���˳�
	l_tpool.quit()

	if reset then
		print('system reset reboot...')
		unix.shell('reboot')	-- ����
	end
	
	print('system on_exit,over...')
	return 0
end

l_on_exit(on_exit)


-- �ȴ�һ��ʱ��, ����Ч����ģ��
l_sys.sleep(1000)
cfg_setup()		-- ��Ч����
check_arping() 	-- arpingһ������, ȷ�������е�mac��ַ��Ӧ��ϵok


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
	
	-- �������ü��
	phynet.check_proc(100)

	-- ��鸴λ

	reset = gpio_reset.check_proc(100)
	if reset then
		break -- �Ǹ�λ, ���˳�����
	end
	l_sys.sleep(100)
end
