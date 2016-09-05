//
//  PathView.m
//  connectServerDemo
//
//  Created by WangDongya on 16/8/19.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "PathView.h"
#import "Context.h"

@implementation PathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextAddStar(ctx, 5, 80, 160, 60);
    CGContextAddRoundRect(ctx, 10, 30, 160, 70, 14);
    CGContextClosePath(ctx);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
    CGContextSetLineWidth(ctx, 4);
    CGContextStrokePath(ctx);     // 绘制路径
    
    
    CGContextBeginPath(ctx);
    CGContextAddStar(ctx, 5, 240, 160, 60);
    CGContextAddRoundRect(ctx, 200, 30, 160, 70, 14);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextDrawPath(ctx, kCGPathFillStroke);     // 填充并绘制路径
    
    
    CGContextBeginPath(ctx);
    CGContextAddStar(ctx, 3, 60, 260, 50);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);     // 填充并绘制路径
    
    
    CGContextBeginPath(ctx);
    CGContextAddStar(ctx, 7, 180, 260, 50);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    CGContextFillPath(ctx);     // 填充并绘制路径
    
    
    CGContextBeginPath(ctx);
    CGContextAddStar(ctx, 9, 300, 260, 50);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    CGContextFillPath(ctx);     // 填充并绘制路径
    
}


@end
