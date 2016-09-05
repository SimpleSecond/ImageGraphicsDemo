//
//  GeometryView.m
//  connectServerDemo
//
//  Created by WangDongya on 16/8/18.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "GeometryView.h"

@implementation GeometryView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 16);
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    
    // 定义4个点，绘制线段
    const CGPoint points1[] = {CGPointMake(10, 40), CGPointMake(100, 40), CGPointMake(100, 40), CGPointMake(20, 70)};
    CGContextStrokeLineSegments(ctx, points1, 4);  // 绘制线段
    CGContextSetLineCap(ctx, kCGLineCapSquare);    // 设置线段的端点形状：方形端点
    
    const CGPoint points2[] = {CGPointMake(130, 40), CGPointMake(230, 40), CGPointMake(230, 40), CGPointMake(140, 70)};
    CGContextStrokeLineSegments(ctx, points2, 4);
    CGContextSetLineCap(ctx, kCGLineCapRound);     // 设置线段的端点形状：圆形端点
    
    const CGPoint points3[] = {CGPointMake(250, 40), CGPointMake(350, 40), CGPointMake(350, 40), CGPointMake(260, 70)};
    CGContextStrokeLineSegments(ctx, points3, 4);  // 绘制线段
    
    // 线段测试点线模式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetLineWidth(ctx, 10);  // 设置线宽
    CGFloat patterns1[] = {6, 10};
    // 设置点线模式：实线宽6，间距宽10
    CGContextSetLineDash(ctx, 0, patterns1, 1);
    // 定义两个点，绘制线段
    const CGPoint points4[] = {CGPointMake(40, 95), CGPointMake(280, 85)};
    CGContextStrokeLineSegments(ctx, points4, 2);   // 绘制线段
    // 设置点线模式:实线6，间距10，但第1条实线宽3
    CGContextSetLineDash(ctx, 3, patterns1, 1);
    // 定义两个点，绘制线段
    const CGPoint points5[] = {CGPointMake(40, 105), CGPointMake(280, 105)};
    CGContextStrokeLineSegments(ctx, points5, 2);    // 绘制线段
    CGFloat patterns2[] = {5,1,4,1,3,1,2,1,1,1,1,2,1,3,1,4,1,5};
    CGContextSetLineDash(ctx, 0, patterns2, 18);    // 设置点线模式
    const CGPoint points6[] = {CGPointMake(40, 125), CGPointMake(280, 125)};
    CGContextStrokeLineSegments(ctx, points6, 2);   // 绘制线段
    
    // 下面是矩形
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(ctx, 14);    // 设置线条宽度
    // 设置填充颜色
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(30, 140, 120, 60));   // 填充一个矩形
    // 设置填充颜色
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(80, 180, 120, 60));   // 填充一个矩形
    
    // 下面是绘制矩形边框
    CGContextSetLineDash(ctx, 0, 0, 0);      // 取消设置点线模式
    // 绘制一个矩形边框
    CGContextStrokeRect(ctx, CGRectMake(30, 250, 120, 60));
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor purpleColor].CGColor);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);     // 设置线条连接点的形状
    // 绘制一个矩形边框
    CGContextStrokeRect(ctx, CGRectMake(80, 280, 120, 60));
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 1.0, 1.0);  // 设置线条颜色
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);   // 设置线条连接点的形状
    // 绘制一个矩形边框
    CGContextStrokeRect(ctx, CGRectMake(130, 310, 120, 60));
    CGContextSetRGBStrokeColor(ctx, 0, 1, 1, 1);
    
    // 下面设置一个椭圆
    CGContextStrokeEllipseInRect(ctx, CGRectMake(30, 400, 120, 60));
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);   // 设置填充色
    // 填充一个椭圆
    CGContextFillEllipseInRect(ctx, CGRectMake(180, 400, 120, 60));
}


@end
