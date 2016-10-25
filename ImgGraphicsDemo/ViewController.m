//
//  ViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "ViewController.h"
#import "PointLineModelController.h"
#import "GeometryViewController.h"
#import "TextViewController.h"
#import "ShadowViewController.h"
#import "ArcViewController.h"
#import "PathViewController.h"
#import "CurveViewController.h"
#import "DrawViewController.h"
#import "DrawPanelController.h"
#import "DrawBitmapController.h"
#import "TransformViewController.h"
#import "SnowViewController.h"
#import "SkewViewController.h"

#import "BlendViewController.h"
#import "GradientViewController.h"
#import "PatternOneController.h"
#import "PatternTwoController.h"
#import "CoreImageViewController.h"

#import "LayerController.h"
#import "TransitionController.h"
#import "PropertyAnimationController.h"

#import "EaseBlankPageView.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CAAnimationDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    /** CAGradientLayer实现渐变
    // 水平渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 100, 300, 100);
    [self.view.layer addSublayer:gradientLayer];
     */
    
    /**
    //中心轴线
    UIBezierPath *Nopath = [UIBezierPath bezierPath];
    [Nopath moveToPoint:CGPointMake(0, 100)];
    //封闭图形
    UIBezierPath *fillpath = [UIBezierPath bezierPath];
    [fillpath moveToPoint:CGPointMake(0, 0)];
    
    for (int i = 0; i < 20; i ++) {
        if (i<5) {
            
            [fillpath addLineToPoint:CGPointMake(20*i, 20*i)];
            [Nopath addLineToPoint:CGPointMake(15*i, 100)];
            
        }else if(i <10)
        {
            [fillpath addLineToPoint:CGPointMake(15*i, 10*i)];
            [Nopath addLineToPoint:CGPointMake(15*i, 100)];
            
        }else{
            [fillpath addLineToPoint:CGPointMake(18*i, 6*i)];
            [Nopath addLineToPoint:CGPointMake(18*i, 100)];
        }
        
        if (i ==19) {
            //这几个点很关键...
            [fillpath addLineToPoint:CGPointMake(18*i, 6*i)];
            [fillpath addLineToPoint:CGPointMake(18*i, 100)];
            [Nopath addLineToPoint:CGPointMake(18*i, 100)];
            [Nopath addLineToPoint:CGPointMake(18*i, 100)];
            
        }
    }
    // 这几个点也很关键...
    [Nopath addLineToPoint:CGPointMake(0, 100)];
    [Nopath addLineToPoint:CGPointMake(0, 100)];
    
    [fillpath addLineToPoint:CGPointMake(0, 100)];
    [fillpath addLineToPoint:CGPointMake(0, 0)];
    
    // layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(20, 80, 200, 200);
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.path = fillpath.CGPath;
    layer.fillColor = [UIColor greenColor].CGColor;
    layer.lineJoin = kCALineCapRound;
    [self.view.layer addSublayer:layer];
    
    // 动画
    CABasicAnimation *fillAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    fillAnimation.duration = 4.0f;
    fillAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    fillAnimation.fillMode = kCAFillModeForwards;
    fillAnimation.fromValue = (id)Nopath.CGPath; // 从中间轴
    fillAnimation.toValue = (id)fillpath.CGPath; // 向两边拉伸
    [layer addAnimation:fillAnimation forKey:@"stretchingKey"];
     */
    
    
    /**
    //遮罩路径
    UIBezierPath *maskpath = [UIBezierPath bezierPath];
    [maskpath moveToPoint:CGPointMake(0, 0)];
    for (int i = 0; i < 20; i ++) {
        if (i<5) {
            [maskpath addLineToPoint:CGPointMake(20*i, 20*i)];
        } else if (i <10) {
            [maskpath addLineToPoint:CGPointMake(15*i, 10*i)];
        } else {
            [maskpath addLineToPoint:CGPointMake(18*i, 6*i)];
        }
        
        if (i == 19) {
            [maskpath addLineToPoint:CGPointMake(18*i, 200)];
        }
    }
    //回到原点,封闭图形
    [maskpath addLineToPoint:CGPointMake(0, 200)];
    [maskpath addLineToPoint:CGPointMake(0, 0)];
    //遮罩图层
    CAShapeLayer *shadeLayer = [CAShapeLayer layer];
    shadeLayer.path = maskpath.CGPath;
    shadeLayer.fillColor = [UIColor blackColor].CGColor;
    //渐变图层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, 0, 200);
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:166/255.0 green:206/255.0 blue:247/255.0 alpha:0.7].CGColor,(__bridge id)[UIColor colorWithRed:237/255.0 green:246/255.0 blue:253/255.0 alpha:0.5].CGColor];
    gradientLayer.locations = @[@(0.5f)];
    
    CALayer *baseLayer = [CALayer layer];
    baseLayer.frame = CGRectMake(20, 300, 18*19, 200);
    [baseLayer addSublayer:gradientLayer];
    [baseLayer setMask:shadeLayer];
    
    [self.view.layer addSublayer:baseLayer];
    
    CABasicAnimation *anmi1 = [CABasicAnimation animation];
    anmi1.keyPath = @"bounds";
    anmi1.duration = 5.0f;
    anmi1.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 2*18*19, 200)];
    anmi1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anmi1.fillMode = kCAFillModeForwards;
    anmi1.autoreverses = NO;
    anmi1.removedOnCompletion = NO;
    [gradientLayer addAnimation:anmi1 forKey:@"bounds"];
     */
    
    /**
    //绘制路径
    UIBezierPath *strokepath = [UIBezierPath bezierPath];
    [strokepath moveToPoint:CGPointMake(0, 0)];
    for (int i = 0; i < 20; i ++) {
        if (i<5) {
            
            [strokepath addLineToPoint:CGPointMake(20*i, 20*i)];
            
        }else if(i <10)
        {
            [strokepath addLineToPoint:CGPointMake(15*i, 10*i)];
            
        }else{
            [strokepath addLineToPoint:CGPointMake(18*i, 6*i)];
        }
    }
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.frame = CGRectMake(20, 500,18*19, 200);
    layer2.path = strokepath.CGPath;
    layer2.strokeColor = [UIColor greenColor].CGColor;
    layer2.lineWidth = 2.0f;
    layer2.fillColor = nil;
    layer2.lineJoin = kCALineCapRound;
    [self.view.layer addSublayer:layer2];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 5.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    [layer2 addAnimation:animation forKey:@"path"];
     */
    
    
    
    [self setTitle:@"图形图像操作分类"];  
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:[self tableView]];
    [[self tableView] setFrame:self.view.bounds];
    
    [self.tableView setAlpha:1.0];
    
    
    EaseBlankPageView *pageView = [[EaseBlankPageView alloc] initWithFrame:self.view.bounds];
    [pageView configWithType:EaseBlankPageTypeTask hasData:NO hasError:NO reloadButtonBlock:nil];
    //[self.view addSubview:pageView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    self.navigationController.navigationBarHidden = NO;
    
    if (indexPath.row == 0) {
        PointLineModelController *pointLineCtroller = [[PointLineModelController alloc] init];
        [self.navigationController pushViewController:pointLineCtroller animated:YES];
    }
    else if (indexPath.row == 1) {
        GeometryViewController *gemotryController = [[GeometryViewController alloc] init];
        [self.navigationController pushViewController:gemotryController animated:YES];
    }
    else if (indexPath.row == 2) {
        TextViewController *textController = [[TextViewController alloc] init];
        [self.navigationController pushViewController:textController animated:YES];
    }
    else if (indexPath.row == 3) {
        ShadowViewController *shadowController = [[ShadowViewController alloc] init];
        [self.navigationController pushViewController:shadowController animated:YES];
    }
    else if (indexPath.row == 4) {
        ArcViewController *arcController = [[ArcViewController alloc] init];
        [self.navigationController pushViewController:arcController animated:YES];
    }
    else if (indexPath.row == 5) {
        PathViewController *pathController = [[PathViewController alloc] init];
        [self.navigationController pushViewController:pathController animated:YES];
    }
    else if (indexPath.row == 6) {
        CurveViewController *curveController = [[CurveViewController alloc] init];
        [self.navigationController pushViewController:curveController animated:YES];
    }
    else if (indexPath.row == 7) {
        DrawViewController *drawController = [[DrawViewController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 8) {
        DrawPanelController *drawController = [[DrawPanelController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 9) {
        DrawBitmapController *drawController = [[DrawBitmapController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 10) {
        TransformViewController *drawController = [[TransformViewController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 11) {
        SnowViewController *drawController = [[SnowViewController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 12) {
        SkewViewController *drawController = [[SkewViewController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 13) {
        BlendViewController *drawController = [[BlendViewController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 14) {
        GradientViewController *drawController = [[GradientViewController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 15) {
        PatternOneController *drawController = [[PatternOneController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 16) {
        PatternTwoController *drawController = [[PatternTwoController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 17) {
        CoreImageViewController *drawController = [[CoreImageViewController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 18) {
        LayerController *drawController = [[LayerController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 19) {
        TransitionController *drawController = [[TransitionController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
    else if (indexPath.row == 20) {
        PropertyAnimationController *drawController = [[PropertyAnimationController alloc] init];
        [self.navigationController pushViewController:drawController animated:YES];
    }
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 21;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"点线模式";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"几何图像";
    }
    else if (indexPath.row == 2) {
        cell.textLabel.text = @"绘制文本";
    }
    else if (indexPath.row == 3) {
        cell.textLabel.text = @"阴影视图";
    }
    else if (indexPath.row == 4) {
        cell.textLabel.text = @"扇形";
    }
    else if (indexPath.row == 5) {
        cell.textLabel.text = @"路径视图";
    }
    else if (indexPath.row == 6) {
        cell.textLabel.text = @"贝济埃曲线绘制花朵";
    }
    else if (indexPath.row == 7) {
        cell.textLabel.text = @"内存中绘图";
    }
    else if (indexPath.row == 8) {
        cell.textLabel.text = @"自定义画板";
    }
    else if (indexPath.row == 9) {
        cell.textLabel.text = @"绘制位图";
    }
    else if (indexPath.row == 10) {
        cell.textLabel.text = @"坐标变换";
    }
    else if (indexPath.row == 11) {
        cell.textLabel.text = @"雪花视图";
    }
    else if (indexPath.row == 12) {
        cell.textLabel.text = @"矩阵变换---倾斜变换";
    }
    else if (indexPath.row == 13) {
        cell.textLabel.text = @"叠加变换(Blend)";
    }
    else if (indexPath.row == 14) {
        cell.textLabel.text = @"渐变填充(Gradient)";
    }
    else if (indexPath.row == 15) {
        cell.textLabel.text = @"填充模式-01";
    }
    else if (indexPath.row == 16) {
        cell.textLabel.text = @"填充模式-02";
    }
    else if (indexPath.row == 17) {
        cell.textLabel.text = @"使用CoreImage滤镜";
    }
    else if (indexPath.row == 18) {
        cell.textLabel.text = @"layer的使用";
    }
    else if (indexPath.row == 19) {
        cell.textLabel.text = @"动画";
    }
    else if (indexPath.row == 20) {
        cell.textLabel.text = @"属性动画";
    }
    
    return cell;
}


#pragma mark - Other getters
- (UITableView *)tableView
{
    if (_tableView != nil) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    return _tableView;
}



@end
