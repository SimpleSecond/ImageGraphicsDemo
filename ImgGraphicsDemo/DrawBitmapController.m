//
//  DrawBitmapController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/24.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "DrawBitmapController.h"
#import "UIImage+Bitmap.h"

@implementation DrawBitmapController
{
    UIImage *_rawImage;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 获取原始UIImage的对象
    _rawImage = [UIImage imageNamed:@"fish.jpeg"];
    
    // 获取图片旋转30后得到新图片
    UIImageView *iv1 = [[UIImageView alloc] initWithImage:[_rawImage imageRotateByDegrees:30]];
    [self.view addSubview:iv1];
    
    // 获取图片不保持纵横比缩放到130x130后的效果
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:[_rawImage imageByScalingToSize:CGSizeMake(130, 130)]];
    iv2.center = CGPointMake(220, 80);
    [self.view addSubview:iv2];
    
    //
    UIImageView *iv3 = [[UIImageView alloc] initWithImage:[_rawImage imageByScalingAspectToMaxSize:CGSizeMake(180, 180)]];
    iv3.center = CGPointMake(100, 210);
    [self.view addSubview:iv3];
    
    //
    UIImageView *iv4 = [[UIImageView alloc] initWithImage:[_rawImage imageAtRect:CGRectMake(40, 20, 60, 40)]];
    iv4.center = CGPointMake(240, 210);
    [self.view addSubview:iv4];
    
    // 获取图片旋转30后得到新图片
    UIImageView *iv5 = [[UIImageView alloc] initWithImage:[_rawImage imageByScalingAspectToMinSize:CGSizeMake(180, 180)]];
    iv5.center = CGPointMake(150, 360);
    [self.view addSubview:iv5];
}




@end
