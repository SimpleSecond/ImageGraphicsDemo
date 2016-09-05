//
//  CurveView.m
//  connectServerDemo
//
//  Created by WangDongya on 16/8/19.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "CurveView.h"


@implementation CurveView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextAddFlower(ctx, 5, 60, 100, 30, 90);
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
    
    CGContextAddFlower(ctx, 6, 180, 100, 30, 90);
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    CGContextFillPath(ctx);
    
    CGContextAddFlower(ctx, 7, 300, 100, 30, 90);
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextFillPath(ctx);
    
    CGContextClosePath(ctx);
}


@end
