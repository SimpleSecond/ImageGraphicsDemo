//
//  LayerController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/29.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "LayerController.h"

@implementation LayerController


- (void)viewDidLoad
{
//    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    //
    self.view.layer.cornerRadius = 8;
    self.view.layer.borderWidth = 4;
    self.view.layer.borderColor = [UIColor redColor].CGColor;
    
    // -----layer-01
    CALayer *subLayer = [CALayer layer];
    subLayer.backgroundColor = [UIColor magentaColor].CGColor;
    subLayer.cornerRadius = 8;
    subLayer.borderWidth = 2;
    subLayer.borderColor = [UIColor blackColor].CGColor;
    subLayer.shadowColor = [UIColor blackColor].CGColor;
    subLayer.shadowOffset = CGSizeMake(4, 5);
    subLayer.shadowRadius = 1;
    subLayer.shadowOpacity = 0.8;
    subLayer.frame = CGRectMake(30, 30, 140, 160);
    [self.view.layer addSublayer:subLayer];
    // -----layer-02
    CALayer *subLayer2 = [CALayer layer];
    subLayer2.backgroundColor = [UIColor magentaColor].CGColor;
    subLayer2.cornerRadius = 8;
    subLayer2.borderWidth = 2;
    subLayer2.borderColor = [UIColor blackColor].CGColor;
    subLayer2.shadowColor = [UIColor blackColor].CGColor;
    subLayer2.shadowOffset = CGSizeMake(4, 5);
    subLayer2.shadowRadius = 1;
    subLayer2.shadowOpacity = 0.8;
    subLayer2.masksToBounds = YES;
    subLayer2.frame = CGRectMake(200, 30, 140, 160);
    [self.view.layer addSublayer:subLayer2];
    // -----使用Layer显示图片
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (id)[[UIImage imageNamed:@"fish.jpeg"] CGImage];
    imageLayer.frame = subLayer2.bounds;
    [subLayer2 addSublayer:imageLayer];
    
    // -------------自定义CALayer的绘制内容
    CALayer *customDrawn = [CALayer layer];
    customDrawn.delegate = self;
    customDrawn.backgroundColor = [UIColor greenColor].CGColor;
    customDrawn.cornerRadius = 10;
    customDrawn.borderWidth = 2;
    customDrawn.borderColor = [UIColor blackColor].CGColor;
    customDrawn.shadowColor = [UIColor blackColor].CGColor;
    customDrawn.shadowOffset = CGSizeMake(0, 3);
    customDrawn.shadowRadius = 5.0;
    customDrawn.shadowOpacity = 0.8;
    customDrawn.masksToBounds = YES;
    customDrawn.frame = CGRectMake(30, 220, 310, 210);
    [self.view.layer addSublayer:customDrawn];
    [customDrawn setNeedsDisplay];
    
    [super viewDidLoad];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"heart.jpg"]];
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);
    // 填充一个椭圆
    CGContextFillEllipseInRect(ctx, CGRectMake(20, 20, 110, 110));
//    cgcontextaddrou
    CGContextFillPath(ctx);
    
}

@end
