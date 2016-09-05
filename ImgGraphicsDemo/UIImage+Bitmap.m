//
//  UIImage+Bitmap.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/23.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "UIImage+Bitmap.h"

@implementation UIImage (Bitmap)

+ (UIImage *)captureScreen
{
    // 获取程序窗口
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContext(screenWindow.frame.size);  // 开始绘图
    // 将窗口的layer图片渲染到当前绘图上下文中
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 获取图片
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   // 结束绘图
    
    return viewImage;
}

+ (UIImage *)captureView:(UIView *)targetView
{
    // 获取程序窗口
    CGRect rect = targetView.frame;
    UIGraphicsBeginImageContext(rect.size);  // 开始绘图
    // 将窗口的layer图片渲染到当前绘图上下文中
    [targetView.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 获取图片
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   // 结束绘图
    
    return viewImage;
}

- (UIImage *)imageAtRect:(CGRect)rect
{
    // 获取该UIImage图片对应的CGImageRef对象
    CGImageRef srcImg = [self CGImage];
    // 从srcImage中挖取rect区域
    CGImageRef imageRef = CGImageCreateWithImageInRect(srcImg, rect);
    // 将挖取的CGImageRef转换为UIImage对象
    UIImage *subImg = [UIImage imageWithCGImage:imageRef];
    return subImg;
}

- (UIImage *)imageByScalingAspectToMinSize:(CGSize)targetSize
{
    // 获取源图片的宽度和高度
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    // 获取图片缩放目标大小的宽度和高度
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    // 定义图片缩放后的高度
    CGFloat scaledWidth = targetWidth;
    // 定义图片缩放后的高度
    CGFloat scaleHeight = targetHeight;
    CGPoint anchorPoint = CGPointZero;
    // 如果远图片的大小与缩放的目标图片大小不等
    if (!CGSizeEqualToSize(imageSize, targetSize)) {
        // 计算水平方向上的缩放因子
        CGFloat xFactor = targetWidth / width;
        // 计算垂直方向上的缩放因子
        CGFloat yFactor = targetHeight / height;
        // 定义缩放因子scaleFactor为两个缩放因子中较大的一个
        CGFloat scaleFactor = xFactor > yFactor ? xFactor : yFactor;
        // 根据缩放因子计算图片缩放后的宽度和高度
        scaledWidth = width * scaleFactor;
        scaleHeight = height * scaleFactor;
        // 如果横向上的缩放因子大于纵向上的缩放因子，那么图片在纵向上需要裁切
        if (xFactor > yFactor) {
            anchorPoint.y = (targetHeight - scaleHeight) * 0.5;
        }
        // 如果横向上的缩放因子小于纵向上的缩放因子，那么图片在横向上需要裁切
        else if (xFactor < yFactor) {
            anchorPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    // 开始绘图
    UIGraphicsBeginImageContext(targetSize);
    // 定义图片缩放后的区域
    CGRect anchorRect = CGRectZero;
    anchorRect.origin = anchorPoint;
    anchorRect.size.width = scaledWidth;
    anchorRect.size.height = scaleHeight;
    // 将图片本身绘制到anchorRect区域中
    [self drawInRect:anchorRect];
    // 获取绘制后生成的新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByScalingAspectToMaxSize:(CGSize)targetSize
{
    // 获取源图片的宽度和高度
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    // 获取图片缩放目标大小的宽度和高度
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    // 定义图片缩放后的高度
    CGFloat scaledWidth = targetWidth;
    // 定义图片缩放后的高度
    CGFloat scaleHeight = targetHeight;
    CGPoint anchorPoint = CGPointZero;
    // 如果远图片的大小与缩放的目标图片大小不等
    if (!CGSizeEqualToSize(imageSize, targetSize)) {
        // 计算水平方向上的缩放因子
        CGFloat xFactor = targetWidth / width;
        // 计算垂直方向上的缩放因子
        CGFloat yFactor = targetHeight / height;
        // 定义缩放因子scaleFactor为两个缩放因子中较大的一个
        CGFloat scaleFactor = xFactor < yFactor ? xFactor : yFactor;
        // 根据缩放因子计算图片缩放后的宽度和高度
        scaledWidth = width * scaleFactor;
        scaleHeight = height * scaleFactor;
        // 如果横向上的缩放因子大于纵向上的缩放因子，那么图片在纵向上需要裁切
        if (xFactor < yFactor) {
            anchorPoint.y = (targetHeight - scaleHeight) * 0.5;
        }
        // 如果横向上的缩放因子小于纵向上的缩放因子，那么图片在横向上需要裁切
        else if (xFactor > yFactor) {
            anchorPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    // 开始绘图
    UIGraphicsBeginImageContext(targetSize);
    // 定义图片缩放后的区域
    CGRect anchorRect = CGRectZero;
    anchorRect.origin = anchorPoint;
    anchorRect.size.width = scaledWidth;
    anchorRect.size.height = scaleHeight;
    // 将图片本身绘制到anchorRect区域中
    [self drawInRect:anchorRect];
    // 获取绘制后生成的新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByScalingToSize:(CGSize)targetSize
{
    // 开始绘图
    UIGraphicsBeginImageContext(targetSize);
    // 定义图片缩放后的区域，无须保持纵横比，所以直接缩放
    CGRect anchorRect = CGRectZero;
    anchorRect.origin = CGPointZero;
    anchorRect.size = targetSize;
    [self drawInRect:anchorRect];
    // 获取图片
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   // 结束绘图
    
    return viewImage;
}


// 图片旋转指定弧度
- (UIImage *)imageRotateByRadians:(CGFloat)radians
{
    // 定义一个执行旋转的cgaffinetransform的结构体
    CGAffineTransform t = CGAffineTransformMakeRotation(radians);
    // 对图片的原始区域执行旋转，获取旋转后的区域
    CGRect rotatedRect = CGRectApplyAffineTransform(CGRectMake(0, 0, self.size.width, self.size.height), t);
    CGSize rotatedSize = rotatedRect.size;
    // 创建绘制位图的上下文
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 指定坐标变换，将坐标中心平移到图片的中心
    CGContextTranslateCTM(ctx, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(ctx, radians);   // 执行坐标变换，旋转过radians弧度
    CGContextScaleCTM(ctx, 1.0, -1.0);  // 执行坐标变换，执行缩放
    
    CGContextDrawImage(ctx, CGRectMake(-self.size.width/2, -self.size.height/2, self.size.width, self.size.height), self.CGImage);   // 绘制图片
    
    // 获取会之后生成的心图片
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   // 结束绘图
    
    return viewImage;
}


- (UIImage *)imageRotateByDegrees:(CGFloat)degrees
{
    return [self imageRotateByRadians:degrees * M_PI / 180];
}

- (void)saveToDocuments:(NSString *)fileName
{
    // 获取当前应用路径中Documents目录下的指定文件名对应的文件路径
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:fileName];
    
    [UIImagePNGRepresentation(self) writeToFile:path atomically:YES];    // 保存PNG图片
    
//    [UIImageJPEGRepresentation(self, 1.0) writeToFile:path atomically:YES];  // 保存JPG图片
}



@end
