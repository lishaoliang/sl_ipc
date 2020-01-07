--[[
-- Copyright(c) 2018-2025, �人˴����� All Rights Reserved
-- @brief ע��: ����˻ظ����ݱ�����д'Content-Length'ͷ��, ������������Ӧ�ٶ�
-- @author ������
--]]

local h_code = {}

h_code.HTTP_SERVER = 'L-Lua-5.3'

-- 200 ����
h_code.HTTP_200 = 200


-- 302 �ض���; �µ�URL����response�е�Location�з���, ����������Զ�ʹ���µ�URL�����µ�Request
h_code.HTTP_302 = 302


-- �ͻ����������﷨����
h_code.HTTP_400 = 400
h_code.HTTP_400_HEAD = 'HTTP/1.1 400 Bad Request\r\nServer: L-Lua-5.3\r\nContent-Length: 0\r\n\r\n'

-- ����Ȩ
h_code.HTTP_401 = 401
h_code.HTTP_401_HEAD = 'HTTP/1.1 401 Unauthorized\r\nServer: L-Lua-5.3\r\nContent-Length: 0\r\n\r\n'

-- ����˾ܾ��ṩ����
h_code.HTTP_403 = 403
h_code.HTTP_403_HEAD = 'HTTP/1.1 403 Forbidden\r\nServer: L-Lua-5.3\r\nContent-Length: 0\r\n\r\n'

-- δ�ҵ�ҳ��
h_code.HTTP_404 = 404
h_code.HTTP_404_HEAD = 'HTTP/1.1 404 Not Found\r\nServer: L-Lua-5.3\r\nContent-Length: 32\r\n\r\n'
h_code.HTTP_404_BODY = '<h1>Not Found</h1>\r\n<h2>404</h2>'

return h_code
