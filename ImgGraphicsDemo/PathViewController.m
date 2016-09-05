//
//  PathViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "PathViewController.h"
#import "PathView.h"

@implementation PathViewController
{
    PathView *_pathView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // 
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem];
    
    _pathView = [[PathView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height - 80)];
    [self.view addSubview:_pathView];
}


- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
