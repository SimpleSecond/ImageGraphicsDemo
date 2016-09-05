//
//  TextView.m
//  connectServerDemo
//
//  Created by WangDongya on 16/8/19.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "TextView.h"

@implementation TextView
{
    CGFloat _scaleRate;
    CGFloat _rotateAngle;
}


- (void)setScaleRate:(CGFloat)scaleRate
{
    if (_scaleRate != scaleRate) {
        _scaleRate = scaleRate;
        [self setNeedsDisplay];
    }
}

- (void)setRotateAngle:(CGFloat)rotateAngle
{
    if (_rotateAngle != rotateAngle) {
        _rotateAngle = rotateAngle;
        [self setNeedsDisplay];
    }
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetCharacterSpacing(ctx, 4);  // 设置字符间距
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    CGContextSetTextDrawingMode(ctx, kCGTextFill);   // 设置使用填充模式绘制文本
    // 绘制文本
    NSString *str1 = @"疯狂iOS讲义";
    [str1 drawAtPoint:CGPointMake(10, 20) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial Rounded MT Bold" size:45], NSForegroundColorAttributeName:[UIColor magentaColor]}];
    
    
    // 设置使用描边模式绘制文本
    CGContextSetTextDrawingMode(ctx, kCGTextStroke);
    // 绘制文本
    [@"疯狂Android讲义" drawAtPoint:CGPointMake(10, 80) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Heiti SC" size:40], NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    // 设置使用填充、描边模式绘制文本
    CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
    // 绘制文本
    [@"疯狂Ajax讲义" drawAtPoint:CGPointMake(10, 130) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Heiti SC" size:40], NSForegroundColorAttributeName:[UIColor magentaColor]}];
    
    // 定义一个垂直镜像的变换矩阵
    CGAffineTransform yRevert = CGAffineTransformMake(1, 0, 0, -1, 0, 0);
    // 为yRevert变换矩阵根据scaleRate添加缩放变换矩阵
    CGAffineTransform scale = CGAffineTransformScale(yRevert, _scaleRate, _scaleRate);
    // rotateAngle
    CGAffineTransform rotate = CGAffineTransformRotate(scale, M_PI * _rotateAngle / 180);
    CGContextSetTextMatrix(ctx, rotate);
    // 设置绘制文本的字体和字号大小
    CGContextSelectFont(ctx, "Courier New", 40, kCGEncodingMacRoman);
    CGContextShowTextAtPoint(ctx, 50, 300, "crazyit.org", 11);
    
    
}


@end
