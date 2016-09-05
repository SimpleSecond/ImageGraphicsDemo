//
//  TextViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "TextViewController.h"
#import "TextView.h"

@interface TextViewController ()
@property (nonatomic, strong) UILabel *scaleLabel;
@property (nonatomic, strong) UILabel *scaleValue;
@property (nonatomic, strong) UILabel *rotateLabel;
@property (nonatomic, strong) UILabel *rotateValue;

@property (nonatomic, strong) UISlider *scaleSlider;
@property (nonatomic, strong) UISlider *rotateSlider;

@end

@implementation TextViewController
{
    TextView *_textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem];
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    [self.view addSubview:[self scaleLabel]];
    [self.view addSubview:[self scaleSlider]];
    [self.view addSubview:[self scaleValue]];
    [[self scaleLabel] setFrame:CGRectMake(0, height-110, 50, 55)];
    [[self scaleSlider] setFrame:CGRectMake(50, height-110, width-100, 55)];
    [[self scaleValue] setFrame:CGRectMake(width-50, height-110, 50, 55)];
    
    [self.view addSubview:[self rotateLabel]];
    [self.view addSubview:[self rotateSlider]];
    [self.view addSubview:[self rotateValue]];
    [[self rotateLabel] setFrame:CGRectMake(0, height-55, 50, 55)];
    [[self rotateSlider] setFrame:CGRectMake(50, height-55, width-100, 55)];
    [[self rotateValue] setFrame:CGRectMake(width-50, height-55, 50, 55)];
    
    _textView = [[TextView alloc] initWithFrame:CGRectMake(0, 64, width, height - 174)];
    [self.view addSubview:_textView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scaleChanged
{
    [_textView setScaleRate:_scaleSlider.value];
    [[self scaleValue] setText:[NSString stringWithFormat:@"%.0f",_scaleSlider.value]];
}

- (void)rotateChanged
{
    [_textView setRotateAngle:_rotateSlider.value];
    [[self rotateValue] setText:[NSString stringWithFormat:@"%.0f",_rotateSlider.value]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma marn - Other getters
- (UILabel *)scaleLabel
{
    if (_scaleLabel != nil) {
        return _scaleLabel;
    }
    
    _scaleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _scaleLabel.text = @"缩放";
    
    return _scaleLabel;
}

- (UILabel *)scaleValue
{
    if (_scaleValue != nil) {
        return _scaleValue;
    }
    
    _scaleValue = [[UILabel alloc] initWithFrame:CGRectZero];
    _scaleValue.text = @"0";
    
    return _scaleValue;
}

- (UILabel *)rotateLabel
{
    if (_rotateLabel != nil) {
        return _rotateLabel;
    }
    
    _rotateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _rotateLabel.text = @"旋转";
    
    return _rotateLabel;
}

- (UILabel *)rotateValue
{
    if (_rotateValue != nil) {
        return _rotateValue;
    }
    
    _rotateValue = [[UILabel alloc] initWithFrame:CGRectZero];
    _rotateValue.text = @"0";
    
    return _rotateValue;
}

- (UISlider *)scaleSlider
{
    if (_scaleSlider != nil) {
        return _scaleSlider;
    }
    
    _scaleSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    _scaleSlider.maximumValue = 5.0;
    _scaleSlider.minimumValue = 1.0;
    [_scaleSlider addTarget:self action:@selector(scaleChanged) forControlEvents:UIControlEventValueChanged];
    
    return _scaleSlider;
}

- (UISlider *)rotateSlider
{
    if (_rotateSlider != nil) {
        return _rotateSlider;
    }
    
    _rotateSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    _rotateSlider.maximumValue = 90.0;
    _rotateSlider.minimumValue = -90.0;
    [_rotateSlider addTarget:self action:@selector(rotateChanged) forControlEvents:UIControlEventValueChanged];
    
    return _rotateSlider;
}


@end
