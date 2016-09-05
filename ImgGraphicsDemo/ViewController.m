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


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"图形图像操作分类"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:[self tableView]];
    [[self tableView] setFrame:self.view.bounds];
    
    
    
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
