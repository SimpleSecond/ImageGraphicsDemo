//
//  CurveViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "CurveViewController.h"
#import "CurveView.h"

@implementation CurveViewController
{
    CurveView *_curveView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem];
    
    _curveView = [[CurveView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height - 80)];
    [_curveView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_curveView];
}


- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
