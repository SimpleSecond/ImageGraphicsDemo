//
//  SnowView.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/24.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "SnowView.h"




@implementation SnowView




// 定义雪花的初始位置
static CGPoint snowPos[] = {
    {20, 4},
    {50, 4},
    {80, 4},
    {110, 4},
    {140, 4},
    {170, 4},
    {200, 4},
    {230, 4},
    {260, 4},
    {290, 4}
};

// 计算雪花的数量
static NSUInteger snowCount = sizeof(snowPos) / sizeof(snowPos[0]);

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setClearsContextBeforeDrawing:YES];
        // 控制每隔0.2秒执行一次setNeedsDisplay方法刷新自己
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setClearsContextBeforeDrawing:YES];
        // 控制每隔0.2秒执行一次setNeedsDisplay方法刷新自己
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);   // 设置采用白色作为填充色
    for (int i=0; i<snowCount; i++) {
        CGContextSaveGState(ctx);   // 保存当前绘图状态
        CGContextTranslateCTM(ctx, snowPos[i].x, snowPos[i].y);   // 平移坐标系统
        // 选择坐标系统
        CGContextRotateCTM(ctx, (arc4random() % 6 - 3) * M_PI / 10);
        // 控制雪花下落
        snowPos[i].y += arc4random() % 8;
        if (snowPos[i].y > self.bounds.size.height) {
            snowPos[i].y = 4;
        }
        // 创建并绘制雪花
        CGContextAddFlower(ctx, 6, 0.0, 0.0, 4.0, 8.0);
        CGContextFillPath(ctx);
        CGContextRestoreGState(ctx);   // 恢复绘图状态
    }
}

@end
