//
//  BlendView.h
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/25.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlendView : UIView

@property (nonatomic, strong) UIColor *sourceColor;
@property (nonatomic, strong) UIColor *destinationColor;
@property (nonatomic, assign) CGBlendMode blendMode;

@end
