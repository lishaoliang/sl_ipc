--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_on_exit.lua
-- @brief   ���ù�������"l_on_exit", ֻ�������� llua���߳���
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]


-- @brief ��ϵͳ���κ�����µ��˳��ص�����
-- @param [in] cb[function] �ص�����
-- @note cb����ԭ�� 
--  \n cb = function () return 0 end
--  \n return 0 ����
--  \n win�˳�����: �����˳�
--  \n linux�˳�����: �����˳�, �ź�SIGINT, SIGTERM, SIGKILL, SIGTSTP
local l_on_exit = function (cb)

end

return l_on_exit
