﻿#!/usr/bin/env ruby -w
# encoding: UTF-8
需要 'HSV'
需要 'C间隔'
需要 'D二维点'
class C细胞
  可读属性 :名称, :质量, :颜色
  def 初始化(名称 = '', 质量 = 36, 颜色 = nil, 控制器 = C细胞静止控制器.新建)
    @名称, @质量, @颜色, @控制器 = 名称, 质量, 颜色, 控制器
    @颜色 ||= 获取随机颜色
    @是否移动, @是否半径变化 = false, false
  end
  def 坐标;@坐标.复制 end
  def 半径;@质量.开根.向下取整 end
  def 速度;2200 * 半径**(-0.439) end#(每秒)
  def 生成精灵(画布, x, y)
    @画布 = 画布
    @坐标 = D二维点.新建(x, y)
    @精灵半径 = 半径
    @精灵 = Tkc圆.创建(画布, @坐标, @精灵半径)
    @精灵.填充色 = 颜色
  end
  def 获取随机颜色;SCRF::HSV.新建(随机(359),0.97,255).转换为RGB.转换为hex end
  def 运动
    @间隔实例 ||= C间隔.新建
    质量变化(1)
    时间 = @间隔实例.间隔
    return if 时间 == 0
    输出 "agar #{时间}" if 时间 < 0.02
    移动方向 = @控制器.判断移动方向
    if (移动方向)
      移动距离 = 速度 * 时间
      移动向量 = (移动方向 * 移动距离).四舍五入
      @坐标 = @坐标 + 移动向量
      @是否移动 = true
    end
  end
  def 质量变化(数值)
    @质量 += 数值
    @是否半径变化 = (@精灵半径 != 半径)
  end
  def 刷新
    if @是否移动 || @是否半径变化
      @精灵半径 = 半径
      @精灵.改变位置(@画布, @坐标, @精灵半径)
      @是否移动 = false
      @是否半径变化 = false
    end
  end
end

描述 C细胞 do
  添加测试 '细胞半径测试' do
    期望(C细胞.新建('', 150).半径).等于 12
  end
end