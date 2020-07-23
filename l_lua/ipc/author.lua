﻿--[[
-- Copyright (c) 2019 武汉舜立软件, All Rights Reserved
-- Created: 2018/12/21
--
-- @file  author.lua
-- @brief LUA部分贡献者, 编码规则, 注释规范
--  \n 代码文档编码规范
--  \n  字符集: [ascii,gbk(排除标点)]
--  \n  一般*.lua文件采用ANSI编码, 只有国际语言翻译采用UTF-8!!!
--  \n 命名规则:
--  \n 	LUA标准库:
--  \n  开源扩展库: "cjson"
--  \n  从C提供的私有库: 非UI部分, 一律以"l_xxx"格式定义导出; UI部分一律以"ui_xxx"格式
--  \n  *.lua脚本文件注意规避以上命名
--  \n  内置全局变量: G, setup, init, quit
--  \n  禁止*.lua脚本使用全局变量!!!所有变量必须冠以 local 定义
--  \n  导出函数, 导出变量命名规则: "xx_xxx_xxx"格式
--  \n  所有内部,局部变量命名规则: "xx_xx_xxx"格式
--  \n 异常处理:
--  \n  采用返回值,错误码方案
--  \n  禁止使用异常机制,但必须处理标准库抛出的异常
-- @author  李绍良
--  \n  
-- @version 0.1
-- @history
--  \n 2018/12/21 0.1 添加贡献者: 李绍良
--]]


-- @file 不要引用此文件
assert(false)

-- @note Lua内置类型名称:
-- \n number
-- \n string
-- \n boolean
-- \n function
-- \n table
-- \n userdata(lightuserdata)


--[[
-- Copyright(c) 2018-2025, All Rights Reserved
-- Created: 2018/12/21
--
-- @file    xxx.lua
-- @brief   文件头注释模板
-- @version 0.1
-- @history 修改历史
--  \n 2018/12/21 0.1 创建文件
-- @warning 没有警告
--]]

-- @module	 name
-- @brief	 模块定义
-- @export	 标明模块导出变量, 可以被外部访问
-- @variable 标明模块运行时内置变量, 不可被外部访问
-- @note 定义形如同 "M.xxx = xxx",一律为导出变量,函数或其他
--  \n 定义形如 "local xxx = xxx",一律为内部数据
--  \n 定义形如 "local M = {a = 'aa',b = false} ... return M", 一律 M为导出, a,b为内部数据


-- @name   M.name
-- @export 模块导出变量


-- @brief 函数描述
-- @param [in]  	xxx[string]	输入参数
-- @param [out]		xxx[table]	输出参数
-- @param [in,out]	xxx[table]	输入输出参数
-- @param [in]		x_xx[function] 如果有回调函数, 必须标明在see中标明原型
-- @return [nil, table] [boolean] 几个返回值集合
-- @note 注意事项,参见xxx
-- @see [string][table] = x_xx(string, string, table)


-- @global 全局变量,仅支持 G, setup, init, quit
--  \n 第二行描述
-- @note 注意事项,参见GetQueryError()
-- @see GetQueryError()


-- @variable 局部变量描述
--  \n 第二行描述
-- @note 注意事项,参见GetQueryError()
-- @see GetQueryError()


-- @def   name
-- @brief 常量定义, 无特殊情况不可修改

