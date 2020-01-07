--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    l_sys.lua
-- @brief   ���ÿ�require("l_sys"), ���ú���
-- @version 0.1
-- @author  ������
-- @history �޸���ʷ
--  \n 2018/12/21 0.1 �����ļ�
-- @warning û�о���
--]]

local l_sys = {}


-- @name   l_sys.chip
-- @export оƬ����
-- \n hisi: 'hi_3516a','hi_3519'
-- \n win,linux:  'x86', 'x86_64'
l_sys.chip = 'hi_3516a'


-- @name   l_sys.platform
-- @export ϵͳƽ̨: 'hisi_linux','win', 'linux'
l_sys.platform = 'hisi_linux'


-- @name   l_sys.version
-- @export �汾����: 'debug','release'
l_sys.version = 'debug'


-- @brief ��ȡ�����������ʹ�С
-- @return [number] ��С
-- @note 
--  \n 'void*', 'bool8', 'int8', 'bool16', 'uint16'
--  \n 'int32', 'uint32', 'bool32', 'int64', 'uint64'
--  \n 'bool_t', 'int_t', 'uint_t', 'long_t', 'ulong_t'
l_sys.type_size = function (t_name)
	return 0
end


-- @brief �ͷ�l_obj����
-- @param [in] l_obj[LUA_TLIGHTUSERDATA] l_obj����
l_sys.free = function (l_obj)
	return
end


-- @brief ��ȡϵͳ�δ���
-- @return [number] �δ���
-- @note ���Ϊ32λ, ����int32���ֵ֮��, �ٴ�0��ʼ����
--  \n ϵͳ�δ�����̸߳��·�ʽ, �̱߳�����������, ϵͳ�δ𽫲��ᱻ����!
l_sys.tc = function ()
	return 123456
end


-- @brief ����[����]
-- @param [in] ms[number] ���ߺ���, ��С1ms
-- @return ��
-- @note ����ʹ�����߳���
l_sys.sleep = function (ms)

end


-- @brief α���������
-- @param [in] S[number] ����α���������[��ʡ��]
l_sys.srand = function (s)
	return
end


-- @brief α�����[1,N]
-- @param [in] N[number] ������ֵN=[1,0x7FFFFFFF]
-- @return [number] ���ֵ
l_sys.rand = function (N)
	return 1
end


-- @brief α����ַ���:[a-zA-Z0-9]
-- @param [in] N[number] ������ֵN=[1,256]
-- @return [string] ����ַ���
-- @note Ĭ��8��
--  \n N��Χ������ΪĬ��8
l_sys.rand_char = function (N)
	return 'abc'
end


-- @brief α��������ַ���:[0-9]
-- @param [in] N[number] ������ֵN=[1,256]
-- @return [string] ����ַ���
-- @note Ĭ��8��,�Է�0��ͷ
--  \n N��Χ������ΪĬ��8
l_sys.rand_num = function (N)
	return '123'
end


-- @brief ��Ӷ�ʱ��
-- @param [in] id[number] ��ʱ��id
-- @param [in] interval[number] ��ʱ�ص�ʱ����
-- @param [in] cb[function] �ص�����
-- @return [boolean] �Ƿ�ɹ�; ���ɹ���ԭ��: id�ظ�
-- @note cb����ԭ�� 
--  \n cb = function (id, count, interval, tc, last_tc) return 0 end
--  \n [in] id[number] ��ʱ��id
--  \n [in] count[number] �ڼ��λص�(��1��ʼ����,����int��֮��ص�1)
--  \n [in] interval[number] ��ʱ���õ�ʱ����
--  \n [in] tc[number] ��ǰʱ��
--  \n [in] last_tc[number] ��һ�λص���ʱ��
--  \n return 0.��ʾ������ʱ��; ��0.ɾ����ʱ��
l_sys.add_timer = function (id, interval, cb)
	return true
end


-- @brief �޸Ķ�ʱ��ʱ����
-- @param [in] id[number] ��ʱ��id
-- @param [in] interval[number] ��ʱ�ص�ʱ����
-- @return [boolean] �Ƿ�ɹ�
l_sys.modify_timer = function (id, interval)
	return true
end


-- @brief �Ƴ���ʱ��
-- @param [in] id[number] ��ʱ��id
-- @return [boolean] �Ƿ�ɹ�
-- @note �� add_timer �Ļص����� cb �в���ʹ�ô˺���
--  \n ͨ���ص�����cb���ط�0, ����C�����Զ�ɾ����ʱ��
l_sys.remove_timer = function (id)
	return true
end


-- @brief ִ��shell����
-- @param [in] cmd[string] ��Ҫִ�е�����
-- @return [number] 0.�ɹ�; ��0.ʧ��
--			[string]����ִ�еõ��Ľ���ַ��� 
-- @note ������ȴ������˳�
l_sys.sh = function (cmd)
	return 0, '123456'
end


return l_sys
