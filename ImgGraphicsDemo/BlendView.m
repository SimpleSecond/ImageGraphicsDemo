//
//  BlendView.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/25.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "BlendView.h"

@implementation BlendView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _sourceColor = [UIColor whiteColor];
        _destinationColor = [UIColor blackColor];
        _blendMode = kCGBlendModeNormal;
    }
    
    return self;
}

- (void)setSourceColor:(UIColor *)sourceColor
{
    if (_sourceColor != sourceColor) {
        _sourceColor = sourceColor;
        [self setNeedsDisplay];
    }
}

- (void)setDestinationColor:(UIColor *)destinationColor
{
    if (_destinationColor != destinationColor) {
        _destinationColor = destinationColor;
        [self setNeedsDisplay];
    }
}

- (void)setBlendMode:(CGBlendMode)blendMode
{
    if (_blendMode != blendMode) {
        _blendMode = blendMode;
        [self setNeedsDisplay];
    }
}

// 重写该方法，重绘该控件
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetGrayFillColor(ctx, 0.2, 0.1);     // 设置填充颜色
    CGContextFillRect(ctx, self.bounds);          // 填充该控件的背景
    // 使用kCGBlendModeCopy混合模式，表示直接将该颜色绘制的背景上，不使用任何混合模式
    CGContextSetBlendMode(ctx, kCGBlendModeCopy);
    // 用叠加的目标颜色绘制矩形区域
    CGContextSetFillColorWithColor(ctx, _destinationColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(120, 20, 140, 140));
    CGContextSetBlendMode(ctx, _blendMode);   // 设置用户选择的叠加模式
    // 用叠加的源颜色绘制矩形区域
    CGContextSetFillColorWithColor(ctx, self.sourceColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(60, 55, 260, 70));
}



@end
