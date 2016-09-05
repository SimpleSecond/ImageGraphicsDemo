//
//  GradientViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/27.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "GradientViewController.h"
#import "GradientView.h"

@implementation GradientViewController
{
    GradientView *_gradientView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    CGRect viewBounds = self.view.bounds;
    // 创建一个UIScrollView作为容器
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(viewBounds), 240)];
    [self.view addSubview:scrollView];
    
    // 创建一个GradientView控件，并将它添加到scrollView中
    _gradientView = [[GradientView alloc] initWithFrame:scrollView.bounds];
    [scrollView addSubview:_gradientView];
    
    // 添加3个UILabel
    NSArray *labels = @[@"渐变类型", @"填充起始点之前的区域", @"填充结束点之后的区域"];
    for (int i=0; i<labels.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 320 + i*38, 180, 24)];
        [label setText:labels[i]];
        [label setTextColor:[UIColor whiteColor]];
        [self.view addSubview:label];
    }
    
    // 创建、添加选择渐变类型的UISegmentedControl
    UISegmentedControl *typeControl = [[UISegmentedControl alloc] initWithItems:@[@"线性渐变", @"圆形渐变"]];
    typeControl.frame = CGRectMake(CGRectGetWidth(viewBounds) - 180, 320, 160, 29);
    typeControl.tintColor = [UIColor whiteColor];
    typeControl.selectedSegmentIndex = 0; // 设置默认选中的第一项
    [typeControl addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:typeControl];
    
    // 创建、添加控制是否填充起始点之前的开关控件
    UISwitch *switch1 = [[UISwitch alloc] initWithFrame:CGRectMake(CGRectGetWidth(viewBounds) - 73, 354, 52, 31)];
    [switch1 addTarget:self action:@selector(beforeStart:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switch1];
    
    
    
    UISwitch *switch2 = [[UISwitch alloc] initWithFrame:CGRectMake(CGRectGetWidth(viewBounds) - 73, 384, 52, 31)];
    [switch2 addTarget:self action:@selector(afterEnd:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switch2];
}

- (void)changeType:(UISegmentedControl *)sender
{
    _gradientView.type = (GradientType)sender.selectedSegmentIndex;
}

- (void)beforeStart:(UISwitch *)sender
{
    _gradientView.beforeStart = sender.isOn;
}

- (void)afterEnd:(UISwitch *)sender
{
    _gradientView.afterEnd = sender.isOn;
}

@end
