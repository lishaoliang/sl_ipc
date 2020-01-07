--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- brief  LUAģ��������, ע�Ȿ�ļ��ľ���, ������ģ���ʼ���������ڸ���ģ��
-- @author  ������
-- note 1.���ļ�ͷ���ñ���Ϊ����ģ��!
--		2.��һ.���ر��ļ�, C���ֲ�δ��ȫ׼����,���ú�������ͷ�ļ�
--      3.�ڶ�.����setup����, �����Ե������ú��� �� ���ø���ģ�����
--      4.����.����init����, C������ȫ׼����, ���Ե������нӿ�
--      5.����.�����������
--      6.����.����˳�ʱ,����quit����,����lua������Դ
--]]
require("ipc.G")


-- @brief ��ʼ��������
-- @return [number] 0.�ɹ�; ��0.ʧ��
-- @note ��ϵͳ��δ��ȫ����, ֻ������������ض���
setup = function ()
	
	G.cfg = require("ipc.cfg.cfg") -- ����ģ��
	--G.cfg.setup()
	
	return 0
end


-- @global ��ʼ��������
-- @return [number] 0.�ɹ�; ��0.ʧ��
-- @note ��ϵͳ��δ��ȫ����, ֻ������������ض���
init = function ()

	G.user = require("ipc.auth.user")
	G.user.setup()	
	
	-- ���� http server
	G.http_ser = require("ipc.nsm.http_ser")
	G.http_ser.setup()

	G.nsm_ser = require("ipc.nsm.nsm_ser")
	G.nsm_ser.setup()

	-- debug
	--local util_ex = require("base.util_ex")
	--util_ex.printf("http_ser", http_ser)
	--util_ex.printf("l_http", l_http)
	--util_ex.printf("s_http", s_http)
	
	return 0
end

-- @global ��ʼ��������
-- @return [number] 0.�ɹ�; ��0.ʧ��
-- @note ��ϵͳ��δ��ȫ����, ֻ������������ض���
quit = function ()
	
	-- �˳�, �ͷ����ü���
	G.nsm_ser = nil
	G.http_ser = nil
	G.user = nil
	G.cfg = nil

	return 0
end
