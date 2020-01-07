--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  net proto id ����Э��idֵ
-- @author ������
--]]


local np_id = {}


-- ��Э��
np_id.NULL = 0				-- ��Ч
np_id.UNKNOWN = 1			-- δ֪Э��

np_id.HTTP = 2				-- HTTPЭ��
np_id.RTSP = 3				-- RTSPЭ��
np_id.WS = 4				-- websocketЭ��
np_id.HTTP_FLV = 5			-- HTTP-FLVЭ��


np_id.NSPP = 20				-- nspp˽��Э��
np_id.NSPP_MULTICAST = 21	-- nspp˽��Э���鲥
np_id.NSPP_BROADCAST = 22	-- nspp˽��Э��㲥
np_id.NSPP_HTTP = 23		-- nspp˽��Э��,ͨ��HTTP�����Ӵ���ý�����


np_id.NSPP_LOCAL = 820		-- ����;nspp[unix,TCP]: v1˽��Э��


-- ��Э��
np_id.MEDIA = 0				-- ý����,�ı�ͨ����Э��
np_id.UPGRADE = 1			-- (�ͻ������豸���������)������Э��
np_id.FTP = 2				-- �ļ�������Э��



return np_id
