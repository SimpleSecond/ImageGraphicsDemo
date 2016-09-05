//
//  DrawViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/21.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "DrawViewController.h"

@implementation DrawViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem];
    
    
    
    UIImageView *imgView = [[UIImageView alloc] init];
    [imgView setFrame:CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height - 80)];
    [imgView setImage:[self drawImage:imgView.bounds.size]];
    [self.view addSubview:imgView];
}

- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImage *)drawImage:(CGSize)size
{
    // 创建内存中的绘图环境
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 8);
    // ----------------开始想内存中绘制图形----------
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    // 绘制一个矩形框
    CGContextStrokeRect(ctx, CGRectMake(30, 30, 150, 60));
    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    // 绘制一个矩形边框
    CGContextFillRect(ctx, CGRectMake(200, 30, 150, 60));
    CGContextSetRGBStrokeColor(ctx, 0, 1, 1, 1);
    // 绘制一个椭圆
    CGContextStrokeEllipseInRect(ctx, CGRectMake(30, 120, 150, 60));
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextFillEllipseInRect(ctx, CGRectMake(200, 120, 150, 60));
    
    // 获取该绘图Context中的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // ----------------结束绘图--------------------
    UIGraphicsEndImageContext();
    // 获取当前应用路径中Documents目录下的指定文件名队员的文件路径
//    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documetns"] stringByAppendingPathComponent:[NSString stringWithFormat:@"newPng.png"]];
    // 将图片写入到文件
    [UIImagePNGRepresentation(newImage) writeToFile:path atomically:YES];
    
    return newImage;
}


@end
