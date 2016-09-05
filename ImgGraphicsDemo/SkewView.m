//
//  SkewView.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/25.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "SkewView.h"

void CGContextSkewCTM(CGContextRef ctx, CGFloat angle)
{
    CGAffineTransform transform = CGAffineTransformMake(1, 0, -tanf(angle), 1, 0, 0);
    CGContextConcatCTM(ctx, transform);
}

@implementation SkewView


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 0.3);
    CGContextTranslateCTM(ctx, 160, 5);      // 坐标系统平移到(160, 5)点
    for (int i=0; i<24; i++) {
        CGContextTranslateCTM(ctx, 50, 30);   // 平移坐标系统
        CGContextScaleCTM(ctx, 0.9, 0.9);     // 缩放坐标系统
        CGContextSkewCTM(ctx, M_PI / 10);     // 倾斜变换
        CGContextFillRect(ctx, CGRectMake(0, 0, 120, 60));   // 填充矩形
    }
}


@end
