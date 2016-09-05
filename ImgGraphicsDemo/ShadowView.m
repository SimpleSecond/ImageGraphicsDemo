//
//  ShadowView.m
//  connectServerDemo
//
//  Created by WangDongya on 16/8/19.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "ShadowView.h"

@implementation ShadowView


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 使用默认的阴影颜色，阴影向右上投影，模糊度5
    CGContextSetShadow(ctx, CGSizeMake(8, -6), 5);
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    
    // 绘制文本
    NSString *str1 = @"疯狂iOS讲义";
    [str1 drawAtPoint:CGPointMake(10, 20) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial Rounded MT Bold" size:45], NSForegroundColorAttributeName:[UIColor magentaColor]}];
    // 设置使用描边模式
    CGContextSetTextDrawingMode(ctx, kCGTextStroke);
    // 绘制文本
    NSString *str2 = @"疯狂Android讲义";
    [str2 drawAtPoint:CGPointMake(10, 80) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Heiti SC" size:40], NSForegroundColorAttributeName:[UIColor magentaColor]}];
    
    // 使用默认的阴影面积，阴影向下投影，模糊10
    CGContextSetShadowWithColor(ctx, CGSizeMake(10, 8), 10, [[UIColor redColor] CGColor]);
    CGContextFillRect(ctx, CGRectMake(20, 150, 180, 80));
    CGContextSetRGBStrokeColor(ctx, 1, 0, 1, 1);
    CGContextStrokeRect(ctx, CGRectMake(30, 260, 180, 80));
    
}


@end
