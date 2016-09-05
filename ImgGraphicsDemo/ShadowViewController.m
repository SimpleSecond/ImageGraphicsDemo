//
//  ShadowViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "ShadowViewController.h"
#import "ShadowView.h"

@interface ShadowViewController ()

@end

@implementation ShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    ShadowView *shadowView = [[ShadowView alloc] init];
    [shadowView setFrame:CGRectMake(0, 64, width, height-64)];
    [shadowView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:shadowView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
