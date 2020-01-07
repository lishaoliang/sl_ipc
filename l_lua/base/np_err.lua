--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief  net proto error ����Э������뷶Χ[0x1000(4096) ~ 0x7FFF(32767)]
-- @author ������
--]]

local np_err = {}

np_err.OK = 0
np_err.CONNECT = 3584	-- �����Ӽ���


np_err.B = 4096		-- �����뿪ʼ
np_err.E = 32767	-- ���������

np_err.UNSUPPORT = np_err.B + 1	-- ��֧�ֵ�Э������
np_err.NOTFOUND  = np_err.B + 2 -- δ�ҵ�
np_err.PARAM	 = np_err.B + 3	-- ��������
np_err.SAVE		 = np_err.B + 4	-- �������ݴ���


return np_err
