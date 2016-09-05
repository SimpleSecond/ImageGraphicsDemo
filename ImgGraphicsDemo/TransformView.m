//
//  TransformView.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/24.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "TransformView.h"

@implementation TransformView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 0.3);
    CGContextTranslateCTM(ctx, -40, 200);    // 坐标系统平移到(-40,200)点
    for (int i=0; i<200; i++) {
        CGContextTranslateCTM(ctx, 50, 50);
        CGContextScaleCTM(ctx, 0.93, 0.93);
        CGContextRotateCTM(ctx, -M_PI / 10);
        CGContextFillRect(ctx, CGRectMake(0, 0, 150, 75));
    }
}

@end
