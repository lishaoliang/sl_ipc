--[[
-- Copyright(c) 2019, All Rights Reserved
-- Created: 2019/4/28
--
-- @file    lfs.lua
-- @brief   ���ÿ� require("lfs"), �ļ�ϵͳĿ¼����
-- @version 2.0
-- @author  Kepler
--  \n Դ���ַ: http://keplerproject.github.io/luafilesystem
--  \n �ٷ��ֲ�: http://math2.org/luasearch/lfs.html#reference
-- @history �޸���ʷ
--  \n 2019/4/28 0.1 �����ļ�
-- @warning û�о���
--]]

local lfs = {}


-- \n number
-- \n string
-- \n boolean
-- \n function
-- \n table
-- \n userdata(lightuserdata)

-- @brief ��������
-- @param [in]  	xxx[string]	�������
-- @param [out]		xxx[table]	�������
-- @param [in,out]	xxx[table]	�����������
-- @param [in]		x_xx[function] ����лص�����, ���������see�б���ԭ��
-- @return [nil, table] [boolean] ��������ֵ����
-- @note ע������,�μ�xxx
-- @see [string][table] = x_xx(string, string, table)


lfs.attributes = function (filepath)

end


-- @brief �����ǰĿ¼
-- @param [in]	path[string]	Ŀ¼
-- @return [nil, boolean]	�Ƿ�ɹ�
--  \n err_str[string]		����nilʱ�Ĵ�����ʾ
-- @note ��������ֵ����Ϊ1�� �� 2��, ע��ʹ��
lfs.chdir = function (path)
	return true
	-- return false
	-- return nil 'Unable to change working directory'
end


-- @brief ��ȡ��ǰĿ¼
-- @return [string]		��ǰĿ¼
--  \n err_str[string]	��������ʾ��
--  \n errno[number]	������
-- @note ��������ֵ����Ϊ1�� �� 2��, ע��ʹ��
lfs.currentdir = function ()
	return ''
	-- return nil, 'strerror(errno)', errno
end


-- @brief ����Ŀ¼
lfs.dir = function (path)
	
end



lfs.link = function ()

end


lfs.lock = function ()

end


lfs.lock_dir = function ()

end


-- @brief ����Ŀ¼
-- @param [in]	path[string]	Ŀ¼
-- @return [nil true]
-- @note ֻ����һ��Ŀ¼; ��δ�ݹ鴴��Ŀ¼
lfs.mkdir = function (path)
	return 0
end


-- @brief ɾ��Ŀ¼
-- @param [in]	path[string]	Ŀ¼
-- @return [nil true]
lfs.rmdir = function (path)
	return true
end


lfs.setmode = function ()

end

lfs.symlinkattributes = function ()

end


lfs.touch = function (filepath)

end

lfs.unlock = function ()

end

return lfs
