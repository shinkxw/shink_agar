﻿#!/usr/bin/env ruby -w
# encoding: UTF-8
require_relative '../SCRF/加载'
require_relative '代码/加载'

忽略错误 do
  $可视化接口 = C可视化.新建('琼脂', 800, 500)
  琼脂 = C琼脂.新建(800, 500)
  琼脂.添加(C细胞.新建('Shink', 2000, 'red', C细胞键盘控制器.新建))
  琼脂.添加(C细胞.新建('S2', 10000, nil, C细胞随机控制器.新建))
  琼脂.添加(C时间同步器.新建(0.001, 30), nil)
  琼脂.添加(C可视化刷新器.新建(100), nil)
  琼脂.运行
  #~ R单元测试.执行#(['-v'])
end
