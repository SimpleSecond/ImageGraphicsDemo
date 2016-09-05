//
//  PatternViewTwo.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/28.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "PatternViewTwo.h"


#define CELL_SIZE 12

@implementation PatternViewTwo
{
    // 定义代表模式填充的特色颜色
    CGPatternRef pattern;
}


// 定义绘制填充“瓷砖块”的回调模块
void ColoredPatternTwoCallback(void *info, CGContextRef ctx)
{
    // 分别使用绿、红、蓝、紫绘制4个12X12的矩形，作为模式填充的瓷砖块
    CGContextFillRect(ctx, CGRectMake(0, 0, CELL_SIZE, CELL_SIZE));
    CGContextFillRect(ctx, CGRectMake(CELL_SIZE, CELL_SIZE, CELL_SIZE, CELL_SIZE));
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建CGPatternCallbacks结构体数据
        CGPatternCallbacks coloredPatternCallbacks = {0, ColoredPatternTwoCallback, NULL};
        // 调用CGPatternCreate()函数创建CGPatternRef
        pattern = CGPatternCreate(NULL, CGRectMake(0, 0, CELL_SIZE * 2, CELL_SIZE * 2), CGAffineTransformIdentity, CELL_SIZE * 2, CELL_SIZE * 2, kCGPatternTilingNoDistortion, NO, &coloredPatternCallbacks);
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 创建CGPatternCallbacks结构体数据
        CGPatternCallbacks coloredPatternCallbacks = {0, ColoredPatternTwoCallback, NULL};
        // 调用CGPatternCreate()函数创建CGPatternRef
        pattern = CGPatternCreate(NULL, CGRectMake(0, 0, CELL_SIZE * 2, CELL_SIZE * 2), CGAffineTransformIdentity, CELL_SIZE * 2, CELL_SIZE * 2, kCGPatternTilingNoDistortion, NO, &coloredPatternCallbacks);
        
    }
    
    return self;
}

// 重写该方法执行绘制
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 创建设备无关的代表RGB模式的颜色空间
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    // 创建代表模式填充的颜色空间
    CGColorSpaceRef patternColorSpace = CGColorSpaceCreatePattern(rgbColorSpace);
    // 定义RGB模式的颜色
    CGFloat redColor[] = {1,0,0,1};
    // 将填充颜色的颜色空间设为模式填充的颜色空间
    CGContextSetFillColorSpace(ctx, patternColorSpace);
    // 设置使用指定模式执行填充，并未“瓷砖块”中的绘制指定颜色
    CGContextSetFillPattern(ctx, pattern, redColor);
    CGContextFillRect(ctx, CGRectMake(20, 20, 150, 150));
    // 将绘制颜色的颜色空间设置为模式填充的颜色空间
    CGContextSetStrokeColorSpace(ctx, patternColorSpace);
    // 设置使用模式填充，并未“瓷砖块”中的绘制指定颜色
    CGContextSetStrokePattern(ctx, pattern, redColor);
    CGContextStrokeRectWithWidth(ctx, CGRectMake(200, 20, 150, 150), 10);
    // 定义RGB模式的绿色
    CGFloat greenColor[] = {0,1,0,1};
    // 设置使用模式填充，并未"瓷砖块"中的绘制指定颜色
    CGContextSetFillPattern(ctx, pattern, greenColor);
    CGContextFillRect(ctx, CGRectMake(10, 190, 150, 150));
    // 设置使用模式填充，并未“瓷砖块”中的绘制指定颜色
    CGContextSetStrokePattern(ctx, pattern, greenColor);
    CGContextStrokeRectWithWidth(ctx, CGRectMake(200, 190, 150, 150), 10);
    
}

@end
