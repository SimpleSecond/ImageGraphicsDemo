//
//  DashLineView.m
//  connectServerDemo
//
//  Created by WangDongya on 16/8/19.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "DashLineView.h"

@implementation DashLineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.opaque = YES;
        self.backgroundColor = [UIColor blackColor];
        
        // 设置每次清空上一次绘制的内容
        self.clearsContextBeforeDrawing = YES;
        _dashCount = 0;
        _dashPhase = 0.0;
    }
    return self;
}

- (void)setDashPhase:(CGFloat)dashPhase
{
    if (dashPhase != _dashPhase) {
        _dashPhase = dashPhase;
        [self setNeedsDisplay];
    }
}

- (void)setDashPattern:(CGFloat *)pattern count:(size_t)count
{
    if ((count != _dashCount) || (memcmp(_dashPattern, pattern, sizeof(CGFloat) * count) != 0)) {
        // 将pattern数组的值复制到_dashPattern数组中
        memcpy(_dashPattern, pattern, sizeof(CGFloat) * count);
        _dashCount = count;
        [self setNeedsDisplay];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 1.0, 1.0);
    CGContextSetLineWidth(ctx, 2.0);
    // 设置点线模式
    CGContextSetLineDash(ctx, _dashPhase, _dashPattern, _dashCount);
    CGPoint line1[] = {CGPointMake(10.0, 20.0), CGPointMake(360.0, 20.0)};
    CGContextStrokeLineSegments(ctx, line1, 2);
    CGPoint line2[] = {CGPointMake(185, 30), CGPointMake(185, 250)};
    CGContextStrokeLineSegments(ctx, line2, 2);
    // 一个矩形
    CGContextStrokeRect(ctx, CGRectMake(10, 30, 120, 120));
    // 一个椭圆
    CGContextStrokeEllipseInRect(ctx, CGRectMake(230, 50, 120, 120));
    
}


@end
