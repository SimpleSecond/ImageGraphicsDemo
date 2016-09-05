//
//  SkewViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/25.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "SkewViewController.h"
#import "SkewView.h"

@implementation SkewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //
    
    SkewView *skewView = [[SkewView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.height, self.view.bounds.size.height - 64)];
    [skewView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:skewView];
}

@end
