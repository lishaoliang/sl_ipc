--[[
-- �����ĵ���Ҫ˵��
-- ����:
--   1.�����������Э��ӿ�,
--   2.���Ե���*.soģ��
--

һ. Ŀ¼�ṹ
	.
	
	./base				-- ���û����ű�
	./ipc				-- ����������ű�
	./upgrade			-- �����������ű�

	./demo				-- ���Խű�Ŀ¼
		readme.txt		-- ˵���ļ�
		target.lua		-- ����Ŀ���豸��Ϣ: IP��ַ,��¼��Ϣ,wifi��Ϣ
		
		author.lua		-- lua�ű��淶
		login.lua		-- ��װͨ�õ�¼
		to_json.lua		-- ��װ��lua��tableת��Ϊjson�ı�
	
	
	./demo/lif			-- ���Ա���Э��
		t_base.lua		-- ���Ի�ȡ�豸������Ϣ: �����豸����
		t_login.lua		-- ���Ե�¼���豸
		

��. ȷ�ϲ���Ŀ����Ϣ, ���ļ� ./demo/target.lua
	1. (ģ����)Ŀ��IP��ַ: target.ip
	2. (ģ����)Ŀ��˿�: target.port
	3. ��Ҫ����WIFI��·��������: target.wifi_ssid
	4. ��Ҫ����WIFI��·��������: target.wifi_passwd


��. ���������л�����ǰĿ¼, ��ȷ������������Լ���*.so�ļ�
	cd /opt
	export LD_LIBRARY_PATH='/usr/local/lib:/usr/lib:/qt_lib:/nfsmem:/opt:'
	

��. ���Ե�¼���豸, ִ������: llua.exe ./demo/nspp/t_login.lua
	���ῴ�����´�ӡ:
	login ok!id=1000        admin@192.168.3.218:80

--]]
