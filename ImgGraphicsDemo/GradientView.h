//
//  GradientView.h
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/27.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum {
    kLinearGradient = 0,
    kRadialGradient
} GradientType;


@interface GradientView : UIView
@property (nonatomic, assign) GradientType type;
@property (nonatomic, assign) BOOL beforeStart;
@property (nonatomic, assign) BOOL afterEnd;



@end
