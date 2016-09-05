//
//  ArcView.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "ArcView.h"

@implementation ArcView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (int i=0; i<10; i++) {
        CGContextBeginPath(ctx);    // 开始定义路径
        // 添加一段圆弧，最后一个参数1代表逆时针，0代表顺时针
        CGContextAddArc(ctx, i*25, i*25, (i+1)*8, M_PI * 1.5, M_PI, 0);
        CGContextClosePath(ctx);    // 关闭路径
        CGContextSetRGBFillColor(ctx, 1, 0, 1, (10-i)*0.1);
        CGContextFillPath(ctx);
    }
}


@end
