//
//  CoreImageViewController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/28.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "CoreImageViewController.h"



@interface CoreImageViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;

@property (nonatomic, strong) UISlider *slider1;
@property (nonatomic, strong) UISlider *slider2;
@property (nonatomic, strong) UISlider *slider3;
@property (nonatomic, strong) UISlider *slider4;

@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UIButton *photoButton;
@property (nonatomic, strong) UIButton *saveButton;


@end

@implementation CoreImageViewController
{
    UIImagePickerController *_imagePicker;
    CIContext *_ctx;
    CIImage *_beginImage;
    UIImage *_resultImage;
    CIFilter *_filter1;
    CIFilter *_filter2;
    CIFilter *_filter3;
    CIFilter *_filter4;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // ------
    // UIImagePickerController对象，用于选取照片库的照片
    _imagePicker = [[UIImagePickerController alloc] init];
    // 将UIImagePickerController的委托设为self
    _imagePicker.delegate = self;
    CGRect viewBounds = self.view.bounds;
    [self.imageView setFrame:viewBounds];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    
    [self.resetButton setFrame:CGRectMake(40, CGRectGetHeight(viewBounds) - 40, 60, 30)];
    [self.photoButton setFrame:CGRectMake(CGRectGetMidX(viewBounds) - 30, CGRectGetHeight(viewBounds) - 40, 60, 30)];
    [self.saveButton setFrame:CGRectMake(CGRectGetWidth(viewBounds) - 100, CGRectGetHeight(viewBounds) - 40, 60, 30)];
    
    [self.view addSubview:self.resetButton];
    [self.view addSubview:self.photoButton];
    [self.view addSubview:self.saveButton];
    
    CGFloat baseY = CGRectGetHeight(viewBounds) - 60;
    
    [self.label1 setFrame:CGRectMake(10, baseY, 34, 25)];
    [self.slider1 setFrame:CGRectMake(55, baseY, CGRectGetWidth(viewBounds) - 65, 29)];
    
    [self.label2 setFrame:CGRectMake(10, baseY - 25, 34, 25)];
    [self.slider2 setFrame:CGRectMake(55, baseY - 25, CGRectGetWidth(viewBounds) - 65, 29)];
    
    [self.label3 setFrame:CGRectMake(10, baseY - 50, 34, 25)];
    [self.slider3 setFrame:CGRectMake(55, baseY - 50, CGRectGetWidth(viewBounds) - 65, 29)];
    
    [self.label4 setFrame:CGRectMake(10, baseY - 75, 34, 25)];
    [self.slider4 setFrame:CGRectMake(55, baseY - 75, CGRectGetWidth(viewBounds) - 65, 29)];
    
    [self.view addSubview:self.label1];
    [self.view addSubview:self.label2];
    [self.view addSubview:self.label3];
    [self.view addSubview:self.label4];
    
    [self.view addSubview:self.slider1];
    [self.view addSubview:self.slider2];
    [self.view addSubview:self.slider3];
    [self.view addSubview:self.slider4];
    
    
    [self reset:nil];
    [self logAllFilters];
    
    
    
    _ctx = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer:[NSNumber numberWithBool:YES]}];
    _ctx = [CIContext contextWithOptions:nil];
    EAGLContext *eaglctx = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    
    _ctx = [CIContext contextWithEAGLContext:eaglctx];
    // 根据过滤器来创建过滤器
    _filter1 = [CIFilter filterWithName:@"CIPixellate"];
    _filter2 = [CIFilter filterWithName:@"CIHueAdjust"];
    _filter3 = [CIFilter filterWithName:@"CIBumpDistortion"];
    _filter4 = [CIFilter filterWithName:@"CIGaussianBlur"];
}


- (void)logAllFilters
{
    NSArray *properties = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    for (NSString *filterName in properties) {
        CIFilter *fltr = [CIFilter filterWithName:filterName];
        NSLog(@"=====%@=====\n%@", filterName, [fltr attributes]);
    }
}


#pragma mark - Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 隐藏照片库并退回原来的界面
    [self dismissViewControllerAnimated:YES completion:nil];
    // 获取用户选择的照片
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    // 根据已有的UIImage创建CIImage
    _beginImage = [CIImage imageWithCGImage:selectedImage.CGImage];
    // 显示用户选中的照片
    self.imageView.image = selectedImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    // 隐藏照片库并退回到原来的界面
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Events

- (void)sliderChange1:(id)sender
{
    // 重设界面上UISlider的初始值
    self.slider2.value = 0;
    self.slider3.value = 0;
    self.slider4.value = 0;
    
    // 设置过滤器参数
    float sliderValue = self.slider1.value;
    [_filter1 setValue:_beginImage forKey:@"inputImage"];
    [_filter1 setValue:[CIVector vectorWithX:150 Y:240] forKey:@"inputCenter"];
    [_filter1 setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputScale"];
    
    // 得到过滤器处理后的图片
    CIImage *outImage = [_filter1 outputImage];
    CGImageRef tmp = [_ctx createCGImage:outImage fromRect:[outImage extent]];
    // 将处理后的图片转换为UIImage
    _resultImage = [UIImage imageWithCGImage:tmp];
    CGImageRelease(tmp);
    // 显示图片
    [self.imageView setImage:_resultImage];
}

- (void)sliderChange2:(id)sender
{
    // 重设界面上UISlider的初始值
    self.slider1.value = 0;
    self.slider3.value = 0;
    self.slider4.value = 0;
    
    // 设置过滤器参数
    float sliderValue = self.slider2.value;
    [_filter2 setValue:_beginImage forKey:@"inputImage"];
    [_filter2 setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputAngle"];
    
    // 得到过滤器处理后的图片
    CIImage *outImage = [_filter2 outputImage];
    CGImageRef tmp = [_ctx createCGImage:outImage fromRect:[outImage extent]];
    // 将处理后的图片转换为UIImage
    _resultImage = [UIImage imageWithCGImage:tmp];
    CGImageRelease(tmp);
    // 显示图片
    [self.imageView setImage:_resultImage];
}

- (void)sliderChange3:(id)sender
{
    // 重设界面上UISlider的初始值
    self.slider1.value = 0;
    self.slider2.value = 0;
    self.slider4.value = 0;
    
    // 设置过滤器参数
    float sliderValue = self.slider3.value;
    [_filter3 setValue:_beginImage forKey:@"inputImage"];
    [_filter3 setValue:[CIVector vectorWithX:150 Y:240] forKey:@"inputCenter"];
    [_filter3 setValue:[NSNumber numberWithFloat:150] forKey:@"inputRadius"];
    [_filter3 setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputScale"];
    
    // 得到过滤器处理后的图片
    CIImage *outImage = [_filter3 outputImage];
    CGImageRef tmp = [_ctx createCGImage:outImage fromRect:[outImage extent]];
    // 将处理后的图片转换为UIImage
    _resultImage = [UIImage imageWithCGImage:tmp];
    CGImageRelease(tmp);
    // 显示图片
    [self.imageView setImage:_resultImage];
}

- (void)sliderChange4:(id)sender
{
    // 重设界面上UISlider的初始值
    self.slider1.value = 0;
    self.slider2.value = 0;
    self.slider3.value = 0;
    
    // 设置过滤器参数
    float sliderValue = self.slider4.value;
    [_filter4 setValue:_beginImage forKey:@"inputImage"];
    [_filter4 setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputRadius"];
    
    // 得到过滤器处理后的图片
    CIImage *outImage = [_filter4 outputImage];
    CGImageRef tmp = [_ctx createCGImage:outImage fromRect:[outImage extent]];
    // 将处理后的图片转换为UIImage
    _resultImage = [UIImage imageWithCGImage:tmp];
    CGImageRelease(tmp);
    // 显示图片
    [self.imageView setImage:_resultImage];
}


- (void)reset:(id)sender
{
    // 重设界面上UISlider的初始值
    self.slider1.value = 0;
    self.slider2.value = 0;
    self.slider3.value = 0;
    self.slider4.value = 0;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"fish" ofType:@"jpeg"];
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    self.imageView.image = [UIImage imageWithContentsOfFile:filePath];
    _beginImage = [CIImage imageWithContentsOfURL:fileUrl];
}

- (void)load:(id)sender
{
    // 显示照片库
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

- (void)save:(id)sender
{
    // 调用UIImageWriteToSavedPhotosAlbum函数将结果图片保存到照片库中
    UIImageWriteToSavedPhotosAlbum(_resultImage, nil, nil, nil);
}



#pragma mark - Other Getters
- (UIImageView *)imageView
{
    if (_imageView != nil) {
        return _imageView;
    }
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    return _imageView;
}

- (UILabel *)label1
{
    if (_label1 != nil) {
        return _label1;
    }
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    _label1.text = @"像素";
    
    return _label1;
}

- (UILabel *)label2
{
    if (_label2 != nil) {
        return _label2;
    }
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    _label2.text = @"色彩";
    
    return _label2;
}

- (UILabel *)label3
{
    if (_label3 != nil) {
        return _label3;
    }
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectZero];
    _label3.text = @"鱼眼";
    
    return _label3;
}

- (UILabel *)label4
{
    if (_label4 != nil) {
        return _label4;
    }
    
    _label4 = [[UILabel alloc] initWithFrame:CGRectZero];
    _label4.text = @"模糊";
    
    return _label4;
}

- (UISlider *)slider1
{
    if (_slider1 != nil) {
        return _slider1;
    }
    
    _slider1 = [[UISlider alloc] initWithFrame:CGRectZero];
    _slider1.minimumValue = 0;
    _slider1.maximumValue = 10;
    
    [_slider1 addTarget:self action:@selector(sliderChange1:) forControlEvents:UIControlEventValueChanged];
    
    return _slider1;
}

- (UISlider *)slider2
{
    if (_slider2 != nil) {
        return _slider2;
    }
    
    _slider2 = [[UISlider alloc] initWithFrame:CGRectZero];
    _slider2.minimumValue = -4;
    _slider2.maximumValue = 4;
    
    [_slider2 addTarget:self action:@selector(sliderChange2:) forControlEvents:UIControlEventValueChanged];
    
    return _slider2;
}

- (UISlider *)slider3
{
    if (_slider3 != nil) {
        return _slider3;
    }
    
    _slider3 = [[UISlider alloc] initWithFrame:CGRectZero];
    _slider3.minimumValue = -2 * M_PI;
    _slider3.maximumValue = 2 * M_PI;
    
    [_slider3 addTarget:self action:@selector(sliderChange3:) forControlEvents:UIControlEventValueChanged];
    
    return _slider3;
}

- (UISlider *)slider4
{
    if (_slider4 != nil) {
        return _slider4;
    }
    
    _slider4 = [[UISlider alloc] initWithFrame:CGRectZero];
    _slider4.minimumValue = 0;
    _slider4.maximumValue = 30;
    
    [_slider4 addTarget:self action:@selector(sliderChange4:) forControlEvents:UIControlEventValueChanged];
    
    return _slider4;
}

- (UIButton *)resetButton
{
    if (_resetButton != nil) {
        return _resetButton;
    }
    
    _resetButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [_resetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [_resetButton addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    
    return _resetButton;
}

- (UIButton *)photoButton
{
    if (_photoButton != nil) {
        return _photoButton;
    }
    
    _photoButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_photoButton setTitle:@"照片" forState:UIControlStateNormal];
    [_photoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [_photoButton addTarget:self action:@selector(load:) forControlEvents:UIControlEventTouchUpInside];
    
    return _photoButton;
}

- (UIButton *)saveButton
{
    if (_saveButton != nil) {
        return _saveButton;
    }
    
    _saveButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [_saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [_saveButton addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    
    return _saveButton;
}

@end
