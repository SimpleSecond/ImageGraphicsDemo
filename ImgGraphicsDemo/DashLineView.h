//
//  DashLineView.h
//  connectServerDemo
//
//  Created by WangDongya on 16/8/19.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashLineView : UIView
{
    CGFloat _dashPattern[10];
    size_t _dashCount;
}

@property (nonatomic, assign) CGFloat dashPhase;

- (void)setDashPattern:(CGFloat *)pattern count:(size_t)count;

@end
