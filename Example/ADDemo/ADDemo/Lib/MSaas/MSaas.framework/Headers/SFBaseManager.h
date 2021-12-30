//
//  SFBaseManager.h
//  AdDemo
//
//  Created by lurich on 2021/9/14.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@class SFFeedAdData,SFConfigModelAd_Sources,SFConfigModelAdplace,SFLaunchView,SFFullscreenVideoAdd;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ADSuccess)(SFConfigModelAd_Sources *model);

@interface SFBaseManager : NSObject

@property (nonatomic, copy, nullable) ADSuccess successBlock;

@property (nonatomic, strong) SFConfigModelAd_Sources * _Nullable baseModel;

@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIImageView *adLogoView;

//开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
@property (nonatomic, weak) UIViewController *showAdController;
//销毁不用的属性，防止内存泄漏
- (void)deallocAllProperty;
//加载广告
- (void)loadADWithModel:(SFConfigModelAd_Sources *)model;

- (void)sf_ViewAnchorWithView:(UIView *)view Top:(NSLayoutYAxisAnchor *)top Left:(NSLayoutXAxisAnchor *)left Bottom:(NSLayoutYAxisAnchor *)bottom Right:(NSLayoutXAxisAnchor *)right Padding:(UIEdgeInsets)padding Size:(CGSize)size;

@end

@interface SFBaseManager (SFSplashAdd)

//开屏参数
@property (nonatomic, strong) SFLaunchView * _Nullable yxADView;
@property (nonatomic) CGRect frame;
@property (nonatomic) NSInteger duration;
@property (nonatomic) NSInteger waitDataDuration;

- (void)showSplashAdInWindow:(UIWindow *)window withBottomView:(UIView *)bottomView;

@end

@interface SFBaseManager (SFRewardVideoAdd)

//激励视频
- (void)showRewardVideoAD;

@end

@interface SFBaseManager (SFBannerAdd)

//横幅广告
@property (nonatomic) CGSize size;
//是否轮播
@property (nonatomic, assign) BOOL loop;
//轮播间隔
@property (nonatomic, assign) int interval;

- (void)showBannerAdWithView:(UIView *)view;

@end

@interface SFBaseManager (SFInterstitialAdd)

//插屏广告
- (void)showInterstitialAd;

@end

@interface SFBaseManager (SFFeedAdd)

//原生广告,模板广告的请求个数
@property (nonatomic) NSInteger adCount;
//请求广告类型
@property (nonatomic) NSInteger adType;

//原生广告绑定视图和注册
- (void)registerAdViewForBindImage:(UIImageView *)view adData:(SFFeedAdData *)adData clickableViews:(NSArray *)views;

@end



@interface SFBaseManager (SFFullscreenVideoAdd)

//展示全屏视频广告
- (void)showFullscreenVideoAD;

@end
NS_ASSUME_NONNULL_END
