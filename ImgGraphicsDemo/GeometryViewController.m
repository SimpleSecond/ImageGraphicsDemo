//
//  GeometryViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "GeometryViewController.h"
#import "GeometryView.h"


@interface GeometryViewController ()

@end

@implementation GeometryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem];
    
    GeometryView *geometryView = [[GeometryView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:geometryView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
