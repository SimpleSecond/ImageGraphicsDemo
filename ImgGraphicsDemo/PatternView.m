//
//  PatternView.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/28.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "PatternView.h"


#define CELL_SIZE 12

@implementation PatternView
{
    // 定义代表模式填充的特色颜色
    CGColorRef _coloredPatternColor;
    CGColorRef _imagePatternColor;
    CGColorRef _imagePatternColor2;
}


// 定义绘制填充“瓷砖块”的回调模块
void ColoredPatternCallback(void *info, CGContextRef ctx)
{
    // 分别使用绿、红、蓝、紫绘制4个12X12的矩形，作为模式填充的瓷砖块
    CGContextSetFillColorWithColor(ctx, [[UIColor greenColor] CGColor]);
    CGContextFillRect(ctx, CGRectMake(0, 0, CELL_SIZE, CELL_SIZE));
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextFillRect(ctx, CGRectMake(0, CELL_SIZE, CELL_SIZE, CELL_SIZE));
    CGContextSetFillColorWithColor(ctx, [[UIColor blueColor] CGColor]);
    CGContextFillRect(ctx, CGRectMake(CELL_SIZE, 0, CELL_SIZE, CELL_SIZE));
    CGContextSetFillColorWithColor(ctx, [[UIColor purpleColor] CGColor]);
    CGContextFillRect(ctx, CGRectMake(CELL_SIZE, CELL_SIZE, CELL_SIZE, CELL_SIZE));
    
}

// 再定义绘制填充“瓷砖块”的回调函数
void ImagedPatternCallback(void *info, CGContextRef ctx)
{
    CGContextDrawImage(ctx, CGRectMake(0, 0, 24, 24), [[UIImage imageNamed:@"heart.jpg"] CGImage]);
    // 设置绘制边框的颜色
    CGContextSetRGBStrokeColor(ctx, 1, 0, 1, 1);
    // 绘制矩形边框
    CGContextStrokeRectWithWidth(ctx, CGRectMake(0, 0, 24, 24), 2);
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建CGPatternCallbacks结构体数据
        CGPatternCallbacks coloredPatternCallbacks = {0, ColoredPatternCallback, NULL};
        // 调用CGPatternCreate()函数创建CGPatternRef
        CGPatternRef coloredPattern = CGPatternCreate(NULL, CGRectMake(0, 0, 24, 24), CGAffineTransformIdentity, 24, 24, kCGPatternTilingNoDistortion, YES, &coloredPatternCallbacks);
        // 创建用于模式填充的颜色空间
        CGColorSpaceRef patternColorSpace = CGColorSpaceCreatePattern(NULL);
        CGFloat alpha = 1;
        // 5 创建一个代表模式填充的特殊颜色
        _coloredPatternColor = CGColorCreateWithPattern(patternColorSpace, coloredPattern, &alpha);
        
        // 重复上面的过程再次创建代表模式填充的特殊颜色
        CGPatternCallbacks imagePatternCallbacks = {0, ImagedPatternCallback, NULL};
        CGPatternRef imagePattern = CGPatternCreate(NULL, CGRectMake(0, 0, 26, 26), CGAffineTransformIdentity, 30, 30, kCGPatternTilingNoDistortion, YES, &imagePatternCallbacks);
        _imagePatternColor = CGColorCreateWithPattern(patternColorSpace, imagePattern, &alpha);
        // pattern2
        CGPatternRef imagePattern2 = CGPatternCreate(NULL, CGRectMake(0, 0, 26, 26), CGAffineTransformMakeRotation(M_PI_4), 30, 30, kCGPatternTilingNoDistortion, YES, &imagePatternCallbacks);
        _imagePatternColor2 = CGColorCreateWithPattern(patternColorSpace, imagePattern2, &alpha);
        
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 创建CGPatternCallbacks结构体数据
        CGPatternCallbacks coloredPatternCallbacks = {0, ColoredPatternCallback, NULL};
        // 调用CGPatternCreate()函数创建CGPatternRef
        CGPatternRef coloredPattern = CGPatternCreate(NULL, CGRectMake(0, 0, 24, 24), CGAffineTransformIdentity, 24, 24, kCGPatternTilingNoDistortion, YES, &coloredPatternCallbacks);
        // 创建用于模式填充的颜色空间
        CGColorSpaceRef patternColorSpace = CGColorSpaceCreatePattern(NULL);
        CGFloat alpha = 1;
        // 5 创建一个代表模式填充的特殊颜色
        _coloredPatternColor = CGColorCreateWithPattern(patternColorSpace, coloredPattern, &alpha);
        
        // 重复上面的过程再次创建代表模式填充的特殊颜色
        CGPatternCallbacks imagePatternCallbacks = {0, ImagedPatternCallback, NULL};
        CGPatternRef imagePattern = CGPatternCreate(NULL, CGRectMake(0, 0, 26, 26), CGAffineTransformIdentity, 30, 30, kCGPatternTilingNoDistortion, YES, &imagePatternCallbacks);
        _imagePatternColor = CGColorCreateWithPattern(patternColorSpace, imagePattern, &alpha);
        // pattern2
        CGPatternRef imagePattern2 = CGPatternCreate(NULL, CGRectMake(0, 0, 26, 26), CGAffineTransformMakeRotation(M_PI_4), 30, 30, kCGPatternTilingNoDistortion, YES, &imagePatternCallbacks);
        _imagePatternColor2 = CGColorCreateWithPattern(patternColorSpace, imagePattern2, &alpha);
        
    }
    
    return self;
}

// 重写该方法执行绘制
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 使用coloredPatternColor颜色（代表模式填充的颜色）填充
    CGContextSetFillColorWithColor(ctx, _coloredPatternColor);
    CGContextFillRect(ctx, CGRectMake(20, 20, 150, 150));
    // 使用coloredPatternColor颜色（代表模式填充的颜色）绘制路径
    CGContextSetStrokeColorWithColor(ctx, _coloredPatternColor);
    CGContextStrokeRectWithWidth(ctx, CGRectMake(200, 20, 150, 150), 12);
    
    // -----
    CGContextSetFillColorWithColor(ctx, _imagePatternColor);
    CGContextFillRect(ctx, CGRectMake(20, 190, 150, 150));
    CGContextSetStrokeColorWithColor(ctx, _imagePatternColor);
    CGContextStrokeRectWithWidth(ctx, CGRectMake(200, 190, 150, 150), 12);
    
    
    // -----
    CGContextSetFillColorWithColor(ctx, _imagePatternColor2);
    CGContextFillRect(ctx, CGRectMake(20, 370, 150, 150));
    CGContextSetStrokeColorWithColor(ctx, _imagePatternColor2);
    CGContextStrokeRectWithWidth(ctx, CGRectMake(200, 370, 150, 150), 12);
    
}


@end
