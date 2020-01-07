--[[
-- Copyright(c) 2019, �人˴����� All Rights Reserved
-- Created: 2019/4/28
--
-- @file    run_env.lua
-- @brief   ����ʱ����
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2019/4/28 0.1 �����ļ�
-- @warning û�о���
--]]
local l_sys = require("l_sys")
local unix = require("base.unix")


-- 
print('run env start...')


-- �����ڴ�ӳ��Ŀ¼
unix.shell('rm -rf /nfsmem')
unix.shell('mkdir /nfsmem')
unix.shell('mount -t tmpfs -o size=60M,mode=0777 tmpfs /nfsmem')


-- ��������Ŀ¼
unix.shell('mkdir /nfsmem/upgrade')

-- ����֧����Ŀ¼
unix.shell('mkdir /nfsmem/surport')

-- �����ű�����, 
unix.shell('cp -rf /opt/l_lua /nfsmem/')


-- �������������Ҫ��*.so ������/nfsmem, ����ᵼ��������һ��, ��������ҵ�
unix.shell('cp -f /opt/liblua-5.3.5.so /nfsmem/')
unix.shell('cp -f /opt/libl_pack.so /nfsmem/')
unix.shell('cp -f /opt/llua /nfsmem/')


print('run env over...')
