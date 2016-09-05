//
//  TransitionController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/29.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "TransitionController.h"

@interface TransitionController ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;
@property (nonatomic, strong) UIButton *button5;
@property (nonatomic, strong) UIButton *button6;
@property (nonatomic, strong) UIButton *button7;
@property (nonatomic, strong) UIButton *button8;

@end

@implementation TransitionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *magentaView = [[UIView alloc] initWithFrame:self.view.bounds];
    magentaView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:magentaView];
    
    UIView *grayView = [[UIView alloc] initWithFrame:self.view.bounds];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    [self.button1 setFrame:CGRectMake(0, height-100, width/4, 35)];
    [self.button2 setFrame:CGRectMake(width/4, height-100, width/4, 35)];
    [self.button3 setFrame:CGRectMake(width/2, height-100, width/4, 35)];
    [self.button4 setFrame:CGRectMake(width*3/4, height-100, width/4, 35)];
    
    [self.button5 setFrame:CGRectMake(0, height-150, width/4, 35)];
    [self.button6 setFrame:CGRectMake(width/4, height-150, width/4, 35)];
    [self.button7 setFrame:CGRectMake(width/2, height-150, width/4, 35)];
    [self.button8 setFrame:CGRectMake(width*3/4, height-150, width/4, 35)];
    
    [self.view addSubview:[self button1]];
    [self.view addSubview:[self button2]];
    [self.view addSubview:[self button3]];
    [self.view addSubview:[self button4]];
    [self.view addSubview:[self button5]];
    [self.view addSubview:[self button6]];
    [self.view addSubview:[self button7]];
    [self.view addSubview:[self button8]];
    
    
}


#pragma mark - events

- (void)add:(id)sender
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    // 设置动画变化曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView commitAnimations];
}

- (void)curl:(id)sender
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    // 设置动画变化曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // 交换视图控制器所显示的UIView中两个子控件的位置
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    [UIView commitAnimations];
}

- (void)move:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    // 交换视图控制器所显示的UIView中两个子控件的位置
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}

- (void)reveal:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    // 交换视图控制器所显示的UIView中两个子控件的位置
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}

- (void)cube:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    // 交换视图控制器所显示的UIView中两个子控件的位置
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}

- (void)suck:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = @"suckEffect";
    [self.view.layer addAnimation:transition forKey:@"animation"];
    // 交换视图控制器所显示的UIView中两个子控件的位置
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}

- (void)oglFlip:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = @"oglFlip";
    transition.subtype = kCATransitionFromBottom;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    // 交换视图控制器所显示的UIView中两个子控件的位置
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}

- (void)ripple:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = @"rippleEffect";
    [self.view.layer addAnimation:transition forKey:@"animation"];
    // 交换视图控制器所显示的UIView中两个子控件的位置
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}




#pragma mark - Other getters

- (UIButton *)button1
{
    if (_button1 != nil) {
        return _button1;
    }
    
    _button1 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button1 setTitle:@"添加" forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button1;
}

- (UIButton *)button2
{
    if (_button2 != nil) {
        return _button2;
    }
    
    _button2 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button2 setTitle:@"翻页" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button2 addTarget:self action:@selector(curl:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button2;
}

- (UIButton *)button3
{
    if (_button3 != nil) {
        return _button3;
    }
    
    _button3 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button3 setTitle:@"移入" forState:UIControlStateNormal];
    [_button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button3 addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button3;
}

- (UIButton *)button4
{
    if (_button4 != nil) {
        return _button4;
    }
    
    _button4 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button4 setTitle:@"揭开" forState:UIControlStateNormal];
    [_button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button4 addTarget:self action:@selector(reveal:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button4;
}

- (UIButton *)button5
{
    if (_button5 != nil) {
        return _button5;
    }
    
    _button5 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button5 setTitle:@"立方体" forState:UIControlStateNormal];
    [_button5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button5 addTarget:self action:@selector(cube:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button5;
}

- (UIButton *)button6
{
    if (_button6 != nil) {
        return _button6;
    }
    
    _button6 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button6 setTitle:@"吸入" forState:UIControlStateNormal];
    [_button6 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button6 addTarget:self action:@selector(suck:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button6;
}

- (UIButton *)button7
{
    if (_button7 != nil) {
        return _button7;
    }
    
    _button7 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button7 setTitle:@"翻转" forState:UIControlStateNormal];
    [_button7 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button7 addTarget:self action:@selector(oglFlip:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button7;
}

- (UIButton *)button8
{
    if (_button8 != nil) {
        return _button8;
    }
    
    _button8 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button8 setTitle:@"水波" forState:UIControlStateNormal];
    [_button8 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button8 addTarget:self action:@selector(ripple:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button8;
}



@end
