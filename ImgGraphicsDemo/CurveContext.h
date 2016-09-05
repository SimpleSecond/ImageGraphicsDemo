//
//  CurveContext.h
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#ifndef CurveTest_CurveContext_h
#define CurveTest_CurveContext_h


// 该函数负责绘制花朵
// n:表示花朵的花瓣数量
// dx/dy:控制花朵的位置
// size:控制花朵的大小
// length:控制花瓣的长度
void CGContextAddFlower(CGContextRef c, NSInteger n, CGFloat dx, CGFloat dy, CGFloat size, CGFloat length);

#endif /* CurveContext_h */
