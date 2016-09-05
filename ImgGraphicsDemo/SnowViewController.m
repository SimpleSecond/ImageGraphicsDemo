//
//  SnowViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/25.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "SnowViewController.h"
#import "SnowView.h"

@implementation SnowViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    
    SnowView *snowView = [[SnowView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    [self.view addSubview:snowView];
}

@end
