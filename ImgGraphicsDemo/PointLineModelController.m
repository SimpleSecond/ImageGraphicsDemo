//
//  PointLineModelController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/20.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "PointLineModelController.h"
#import "DashLineView.h"


//#define IOS7_OR_LATER YES
//    if (IOS7_OR_LATER) {
//        UIBarButtonItem *returnButtonItem = [[UIBarButtonItem alloc] init];
//        returnButtonItem.title = @"返回";
//        self.navigationItem.backBarButtonItem = returnButtonItem;
//    } else {
//        // 设置返回按钮的文本
//        UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
//                                       initWithTitle:@"返回"
//                                       style:UIBarButtonItemStylePlain target:nil action:nil];
//        [self.navigationItem setBackBarButtonItem:backButton];
//
//        // 设置返回按钮的背景图片
//        UIImage *img = [UIImage imageNamed:@"ic_back_nor"];
//        img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
//        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:img
//                                                          forState:UIControlStateNormal
//                                                        barMetrics:UIBarMetricsDefault];
//        // 设置文本与图片的偏移量
//        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(5, 0)
//                                                             forBarMetrics:UIBarMetricsDefault];
//        // 设置文本的属性
//        NSDictionary *attributes = @{UITextAttributeFont:[UIFont systemFontOfSize:16],
//                                     UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero]};
//        [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
//    }



typedef struct {
    CGFloat pattern[5];
    size_t count;
} Pattern;
// 初始化多个点线模式
static Pattern patterns[] = {
    {{10, 10}, 2},
    {{10, 20, 10}, 3},
    {{10, 20, 30}, 3},
    {{10, 20, 10, 30}, 4},
    {{10, 10, 20, 20}, 4},
    {{10, 10, 20, 30, 50}, 5}

};

static NSInteger patternCount = sizeof(patterns) / sizeof(patterns[0]);


@interface PointLineModelController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UISlider *phase;
@property (nonatomic, strong) UIPickerView *pickerView;

@end

@implementation PointLineModelController
{
    DashLineView *_dashView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem];
    
    
    [self.view addSubview:[self scrollView]];
    [[self scrollView] setFrame:CGRectMake(0, 44, width, height/2)];
    
    [self.view addSubview:[self phase]];
    [[self phase] setFrame:CGRectMake(0, height/2 + 44, width, 50)];
    
    [self.view addSubview:[self pickerView]];
    [[self pickerView] setFrame:CGRectMake(0, height/2 + 94, width, height/2 - 94)];
    
    
    
    // 创建DashLineView自定义控件
    _dashView = [[DashLineView alloc] initWithFrame:self.scrollView.bounds];
    [self.scrollView addSubview:_dashView];
    [_dashView setDashPattern:patterns[0].pattern count:patterns[0].count];
    
    
    // 选中UIPickerView的第一行
    [[self pickerView] selectRow:0 inComponent:0 animated:NO];
    


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UIPickerViewDelegate



#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return patternCount;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Pattern p = patterns[row];
    // 将第row个pattern数组元素的pattern成员所包含的count个值拼接起来
    // 作为第row个列表项所显示的文本
    NSMutableString *title = [NSMutableString stringWithFormat:@"%.0f", p.pattern[0]];
    for (size_t i=1; i<p.count; ++i) {
        [title appendFormat:@"-%.0f", p.pattern[i]];
    }
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_dashView setDashPattern:patterns[row].pattern count:patterns[row].count];
}



#pragma mark - Event
- (void)dashPhase
{
    _dashView.dashPhase = self.phase.value;
}

- (void)reset
{
    _dashView.dashPhase = 0.0;
    self.phase.value = 0.0;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Other getters
- (UIScrollView *)scrollView
{
    if (_scrollView != nil) {
        return _scrollView;
    }
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    
    return _scrollView;
}

- (UISlider *)phase
{
    if (_phase != nil) {
        return _phase;
    }
    
    _phase = [[UISlider alloc] initWithFrame:CGRectZero];
    _phase.maximumValue = 20;
    _phase.minimumValue = -20;
    [_phase addTarget:self action:@selector(dashPhase) forControlEvents:UIControlEventValueChanged];
    
    return _phase;
}

- (UIPickerView *)pickerView
{
    if (_pickerView != nil) {
        return _pickerView;
    }
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    return _pickerView;
}

@end
