--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/20
--
-- @file    l_net_a.lua
-- @brief   ��չ�� require("l_net_a"), ģ�黯����֧��
--  \n require("l_net_a")
--  \n ������������첽ioģ��, ����ģ�� init,start,stop,quit�г���Ҫ��
--  \n l_net_a������: �ڴ����,��Ч����
-- @version 0.1
-- @history �޸���ʷ
--  \n 2019/14/20 0.1 �����ļ�
-- @warning û�о���
--]]

local l_net_a = {}


-- @brief ����ģ���ʼ��
-- @return [number]	0.�ɹ�; ��0.������
l_net_a.init = function ()
	return 0
end


-- @brief ����ģ�鷴��ʼ��
-- @return ��
l_net_a.quit = function ()
	return
end


-- @brief ����ģ�������߳�
-- @return [number]	0.�ɹ�; ��0.������
--  \n ���������� l_skdr_a �д�����skdr�߳�
l_net_a.start = function ()
	return 0
end


-- @brief ����ģ�鷴��ʼ��
-- @return ��
l_net_a.stop = function ()
	return
end


return l_net_a
