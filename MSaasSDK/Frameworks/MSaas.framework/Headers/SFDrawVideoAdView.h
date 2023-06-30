//
//  SFDrawVideoAdView.h
//  MSaasAdapter
//
//  Created by lurich on 2022/3/7.
//

#import <UIKit/UIKit.h>

@class SFFeedAdData;

NS_ASSUME_NONNULL_BEGIN

@interface SFDrawVideoAdView : UIView

@property (nonatomic, strong) UIImageView *adImageView;

@property (nonatomic, strong) UIImageView *adLogoView;

@property (nonatomic, strong) UILabel *adNameLabel;

@property (nonatomic, strong) UILabel *adContentLabel;

@property (nonatomic, strong) UIImageView *adIconView;

@property (nonatomic, strong) UILabel *adClickLabel;

@property (nonatomic, assign) BOOL isPlay;

@property (nonatomic, weak, nullable) SFFeedAdData *model;

- (void)addVolumeBtn;

@end

NS_ASSUME_NONNULL_END
