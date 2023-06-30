//
//  ADTableViewCell.h
//  TestAdA
//
//  Created by lurich on 2020/4/4.
//  Copyright © 2020 YX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MSaas/MSaas.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeAdTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *adIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *adTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UILabel *adContentLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *adLogoW;

@property (weak, nonatomic) IBOutlet UIButton *infoBtn;

@property (nonatomic) CGFloat cellHeight;


@property (nonatomic, weak) UIViewController *showAdController;
// type: 1: 加载成功   2：渲染成功   3：模板广告关闭
@property (nonatomic, copy) void(^successBlock)(NSInteger type);

- (void)loadAD;

- (void)registerAdView;

@end

NS_ASSUME_NONNULL_END
