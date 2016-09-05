//
//  CurveContext.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/25.
//  Copyright © 2016年 WangDongya. All rights reserved.
//



#import "CurveContext.h"

// 该函数负责绘制花朵
// n:表示花朵的花瓣数量
// dx/dy:控制花朵的位置
// size:控制花朵的大小
// length:控制花瓣的长度
void CGContextAddFlower(CGContextRef c, NSInteger n, CGFloat dx, CGFloat dy, CGFloat size, CGFloat length)
{
    CGContextMoveToPoint(c, dx, dy + size);
    CGFloat dig = 2 * M_PI / n;
    for (int i=1; i<=n; i++) {
        // 计算控制点坐标
        CGFloat ctrlX = sin((i-0.5) *dig) * length +dx;
        CGFloat ctrlY = cos((i-0.5) *dig) * length +dy;
        // 计算结束点坐标
        CGFloat x = sin(i*dig) * size +dx;
        CGFloat y = cos(i*dig) * size +dy;
        // 添加二次曲线路径
        CGContextAddQuadCurveToPoint(c, ctrlX, ctrlY, x, y);
    }
}
