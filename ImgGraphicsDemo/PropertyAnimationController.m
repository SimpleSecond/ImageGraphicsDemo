//
//  PropertyAnimationController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/30.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "PropertyAnimationController.h"



@interface PropertyAnimationController ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;


@end

@implementation PropertyAnimationController
{
    CALayer *_imageLayer;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // -----
    _imageLayer = [CALayer layer];
    // 设置该CALayer的边框、大小、位置等属性
    _imageLayer.cornerRadius = 6;
    _imageLayer.borderWidth = 1;
    _imageLayer.borderColor = [UIColor blackColor].CGColor;
    _imageLayer.masksToBounds = YES;
    _imageLayer.frame = CGRectMake(30, 80, 100, 135);
    // 设置_imageLayer显示的图片
    _imageLayer.contents = (id)[[UIImage imageNamed:@"fish.jpeg"] CGImage];
    [self.view.layer addSublayer:_imageLayer];
    
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    [self.button1 setFrame:CGRectMake(0, height-100, width/4, 35)];
    [self.button2 setFrame:CGRectMake(width/4, height-100, width/4, 35)];
    [self.button3 setFrame:CGRectMake(width/2, height-100, width/4, 35)];
    [self.button4 setFrame:CGRectMake(width*3/4, height-100, width/4, 35)];
    [self.view addSubview:[self button1]];
    [self.view addSubview:[self button2]];
    [self.view addSubview:[self button3]];
    [self.view addSubview:[self button4]];
}






#pragma mark - Events
- (void)move:(id)sender
{
    CGPoint fromPoint = _imageLayer.position;
    CGPoint toPoint = CGPointMake(fromPoint.x + 80, fromPoint.y);
    // 创建不断改变CALayer的position属性的属性动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.fromValue = [NSValue valueWithCGPoint:fromPoint];
    anim.toValue = [NSValue valueWithCGPoint:toPoint];
    anim.duration = 0.5;
    _imageLayer.position = toPoint;
    anim.removedOnCompletion = YES;
    [_imageLayer addAnimation:anim forKey:nil];
}

- (void)rotate:(id)sender
{
    // 创建不断改变CALayer的position属性的属性动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = _imageLayer.transform;
    anim.fromValue = [NSValue valueWithCATransform3D:fromValue];
    // 绕x轴旋转180
    CATransform3D toValue = CATransform3DRotate(fromValue, M_PI, 1, 0, 0);
//    CATransform3D toValue = CATransform3DRotate(fromValue, M_PI, 0, 1, 0);
//    CATransform3D toValue = CATransform3DRotate(fromValue, M_PI, 0, 0, 1);
    anim.toValue = [NSValue valueWithCATransform3D:toValue];
    anim.duration = 0.5;
    _imageLayer.transform = toValue;
    anim.removedOnCompletion = YES;
    [_imageLayer addAnimation:anim forKey:nil];
}

- (void)scale:(id)sender
{
    // 创建不断改变CALayer的position属性的属性动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    anim.values = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:_imageLayer.transform],
//                   [NSValue valueWithCATransform3D:CATransform3DScale(_imageLayer.transform, 0.2, 0.2, 1)],
//                   [NSValue valueWithCATransform3D:CATransform3DScale(_imageLayer.transform, 2, 2, 1)],
//                   _imageLayer.transform,nil];
    
    anim.values = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:_imageLayer.transform], [NSValue valueWithCATransform3D:CATransform3DScale(_imageLayer.transform, 0.2, 0.2, 1)], [NSValue valueWithCATransform3D:CATransform3DScale(_imageLayer.transform, 2, 2, 1)], nil];
    
    anim.duration = 5;
    anim.removedOnCompletion = YES;
    [_imageLayer addAnimation:anim forKey:nil];
}

- (void)group:(id)sender
{
    CGPoint fromPoint = _imageLayer.position;
    CGPoint toPoint = CGPointMake(280, fromPoint.y + 300);
    // 创建不断改变CALayer的position属性的属性动画
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.fromValue = [NSValue valueWithCGPoint:fromPoint];
    moveAnim.toValue = [NSValue valueWithCGPoint:toPoint];
    moveAnim.removedOnCompletion = YES;
    
    // 创建不断改变CALayer的transform属性的属性动画
    CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = _imageLayer.transform;
    transformAnim.fromValue = [NSValue valueWithCATransform3D:fromValue];
    CATransform3D scaleValue = CATransform3DScale(fromValue, 0.5, 0.5, 1);
    CATransform3D rotateValue = CATransform3DRotate(fromValue, M_PI, 0, 0, 1);
    // 绕x轴旋转180
    CATransform3D toValue = CATransform3DConcat(scaleValue, rotateValue);
    transformAnim.toValue = [NSValue valueWithCATransform3D:toValue];
    transformAnim.cumulative = YES;    // 动画效果累加
    transformAnim.repeatCount = 2;
    transformAnim.duration = 3;
    
    // 位移、缩放、旋转组合起来执行
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, transformAnim, nil];
    animGroup.duration = 6;
    [_imageLayer addAnimation:animGroup forKey:nil];
}




#pragma mark - Other getters

- (UIButton *)button1
{
    if (_button1 != nil) {
        return _button1;
    }
    
    _button1 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button1 setTitle:@"位移" forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button1;
}

- (UIButton *)button2
{
    if (_button2 != nil) {
        return _button2;
    }
    
    _button2 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button2 setTitle:@"旋转" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button2 addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button2;
}

- (UIButton *)button3
{
    if (_button3 != nil) {
        return _button3;
    }
    
    _button3 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button3 setTitle:@"缩放" forState:UIControlStateNormal];
    [_button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button3 addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button3;
}

- (UIButton *)button4
{
    if (_button4 != nil) {
        return _button4;
    }
    
    _button4 = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button4 setTitle:@"动画组" forState:UIControlStateNormal];
    [_button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button4 addTarget:self action:@selector(group:) forControlEvents:UIControlEventTouchUpInside];
    
    return _button4;
}
@end
