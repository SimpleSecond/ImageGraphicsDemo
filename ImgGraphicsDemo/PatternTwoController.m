//
//  PatternTwoController.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/8/28.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "PatternTwoController.h"
#import "PatternViewTwo.h"

@implementation PatternTwoController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    PatternViewTwo *patternView = [[PatternViewTwo alloc] initWithFrame:CGRectZero];
    [patternView setBackgroundColor:[UIColor whiteColor]];
    [patternView setFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    [self.view addSubview:patternView];
    
}

@end
