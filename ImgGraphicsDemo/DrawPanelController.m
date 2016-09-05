//
//  DrawPanelController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/21.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "DrawPanelController.h"
#import "DrawView.h"

@implementation DrawPanelController
{
    NSArray *_colors;
    DrawView *_drawView;
    
    UISegmentedControl *_colorControl;
    UISegmentedControl *_shapeControl;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _drawView = [[DrawView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    [_drawView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_drawView];
    
    // 创建、添加选择颜色的UISegmentedControl
    _colorControl = [[UISegmentedControl alloc] initWithItems:@[@"红",@"绿",@"蓝",@"黄",@"紫",@"青",@"黑" ]];
    CGRect viewBounds = self.view.bounds;
    _colorControl.frame = CGRectMake(20, 70, CGRectGetWidth(viewBounds)-40, 29);
    _colorControl.selectedSegmentIndex = 0;  // 设置默认选中第一个项
    [_colorControl addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_colorControl];
    
    // 创建绘制图形的UISegmentedControl
    _shapeControl = [[UISegmentedControl alloc] initWithItems:@[@"直线", @"矩形", @"椭圆", @"圆角矩形", @"铅笔"]];
    _shapeControl.selectedSegmentIndex = 0;
    [_shapeControl addTarget:self action:@selector(changeShape) forControlEvents:UIControlEventValueChanged];
    // 创建工具条
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(viewBounds) - 44, CGRectGetWidth(viewBounds), 44)];
    // 使用工具条包装UISegmentedControl
    toolBar.items = @[ [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], [[UIBarButtonItem alloc] initWithCustomView:_shapeControl], [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    // 添加工具条
    [self.view addSubview:toolBar];
    _colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor yellowColor], [UIColor purpleColor], [UIColor cyanColor], [UIColor blackColor]];
    
}

- (void)changeColor
{
    _drawView.currentColor = _colors[_colorControl.selectedSegmentIndex];
}

- (void)changeShape
{
    _drawView.shape = (int)_shapeControl.selectedSegmentIndex;
}

@end
