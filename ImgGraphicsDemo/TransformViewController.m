//
//  TransformViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/24.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "TransformViewController.h"
#import "TransformView.h"

@implementation TransformViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    TransformView *transView = [[TransformView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    [transView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:transView];
}


@end
