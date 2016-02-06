﻿#!/usr/bin/env ruby -w
# encoding: UTF-8
class C可视化
  可读属性 :长, :宽
  def 初始化(标题, 长, 宽)
    @长, @宽, @对象哈希 = 长, 宽, {}
    @主界面 = Tk主界面.创建(标题, 长, 宽, 100, 80)
    @画布 = Tk画布.创建(@主界面, 长, 宽).打包
    @画布.背景色 = 'gray'
  end
  def 刷新对象(代理对象, 显示参数);@对象哈希[代理对象] = C可视化对象.新建(显示参数) end
  def 刷新页面(当前时间, 显示长度)
    显示起点 = 当前时间 - 显示长度
    @对象哈希.条件删除{|_, 可视化对象| 可视化对象.反馈时间 < 显示起点}
    
    #Tk.延迟显示 do
      @画布.全部删除
      @对象哈希.每对 do |_, 可视化对象|
        可视化对象.tk对象(@画布)
      end
    #end
  end
  def 可视化;Tk.后台运行 end
end
