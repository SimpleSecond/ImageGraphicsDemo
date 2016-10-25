//
//  EaseBlankPageView.m
//  ImgGraphicsDemo
//
//  Created by WangDongya on 16/10/12.
//  Copyright © 2016年 WangDongya. All rights reserved.
//

#import "EaseBlankPageView.h"

@implementation EaseBlankPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)configWithType:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData) {
        [self removeFromSuperview];
        return;
    }
    self.alpha = 1.0;
    //    图片
    if (!_monkeyView) {
        _monkeyView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_monkeyView];
    }
    //    文字
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = [UIFont systemFontOfSize:17];
        _tipLabel.textColor = [UIColor lightGrayColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLabel];
    }
    //    布局
    /**
    [_monkeyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_centerY);
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerX.equalTo(self);
        make.top.equalTo(_monkeyView.mas_bottom);
        make.height.mas_equalTo(50);
    }];
     */
    
    // 布局
    // NSLayoutConstraint *constraint = [[NSLayoutConstraint alloc] init];
    if (_monkeyView != nil) {
        /**
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_monkeyView
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:1.0
                                                               constant:0]];
        NSDictionary *views = @{@"monkeyView":_monkeyView};
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[monkeyView]-0-|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[monkeyView]-0-|" options:0 metrics:nil views:views]];
         */
        
        [_monkeyView setFrame:CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.width/2)];
        [_monkeyView setCenter:self.center];
        
        [_monkeyView setImage:[UIImage imageNamed:@"fish.jpg"]];
        [_monkeyView setBackgroundColor:[UIColor redColor]];
    }
    
    
    _reloadButtonBlock = nil;
    if (hasError) {
        //        加载失败
        if (!_reloadButton) {
            _reloadButton = [[UIButton alloc] initWithFrame:CGRectZero];
            [_reloadButton setImage:[UIImage imageNamed:@"blankpage_button_reload"] forState:UIControlStateNormal];
            _reloadButton.adjustsImageWhenHighlighted = YES;
            [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_reloadButton];
            /**
            [_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(_tipLabel.mas_bottom);
                make.size.mas_equalTo(CGSizeMake(160, 60));
            }];
             */
        }
        _reloadButton.hidden = NO;
        _reloadButtonBlock = block;
        [_monkeyView setImage:[UIImage imageNamed:@"blankpage_image_loadFail"]];
        _tipLabel.text = @"貌似出了点差错/n真忧伤呢";
    } else {
        //        空白数据
        if (_reloadButton) {
            _reloadButton.hidden = YES;
        }
        NSString *imageName, *tipStr;
        switch (blankPageType) {
            case EaseBlankPageTypeActivity: //项目动态
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"这里还什么都没有/n赶快起来弄出一点动静吧";
            }
                break;
            case EaseBlankPageTypeTask://任务列表
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"这里还没有任务/n赶快起来为团队做点贡献吧";
            }
                break;
            case EaseBlankPageTypeTopic://讨论列表
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"这里怎么空空的/n发个讨论让它热闹点吧";
            }
                break;
            case EaseBlankPageTypeTweet://冒泡列表（自己的）
            {
                imageName = @"blankpage_image_Hi";
                tipStr = @"无冒泡/n来，冒个泡吧～";
            }
                break;
            case EaseBlankPageTypeTweetOther://冒泡列表（别人的）
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"这个人很懒/n一个冒泡都木有～";
            }
                break;
            case EaseBlankPageTypeProject://项目列表（自己的）
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"您还木有项目呢，赶快起来创建吧～";
            }
                break;
            case EaseBlankPageTypeProjectOther://项目列表（别人的）
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"这个人很懒，一个项目都木有～";
            }
                break;
            case EaseBlankPageTypeFileDleted://去了文件页面，发现文件已经被删除了
            {
                imageName = @"blankpage_image_loadFail";
                tipStr = @"晚了一步/n文件刚刚被人删除了～";
            }
                break;
            case EaseBlankPageTypeFolderDleted://文件夹
            {
                imageName = @"blankpage_image_loadFail";
                tipStr = @"晚了一步/n文件夹貌似被人删除了～";
            }
                break;
            case EaseBlankPageTypePrivateMsg://私信列表
            {
                imageName = @"blankpage_image_Hi";
                tipStr = @"无私信/n打个招呼吧～";
            }
                break;
            default://其它页面（这里没有提到的页面，都属于其它）
            {
                imageName = @"blankpage_image_Sleep";
                tipStr = @"这里还什么都没有/n赶快起来弄出一点动静吧";
                
            }
            break;
        }
        imageName = @"fish.jpg";
        tipStr = @"这里还什么都没有/n赶快起来弄出一点动静吧";
        [_monkeyView setImage:[UIImage imageNamed:imageName]];
        _tipLabel.text = tipStr;
    }}
- (void)reloadButtonClicked:(id)sender
{
    self.hidden = YES;
    [self removeFromSuperview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_reloadButtonBlock) {
            _reloadButtonBlock(sender);
        }
    });
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
