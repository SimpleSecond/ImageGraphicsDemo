//
//  DrawView.h
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/21.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"


@interface DrawView : UIView
@property (nonatomic, strong) UIColor *currentColor;
@property (nonatomic, assign) ShapeType shape;


@end
