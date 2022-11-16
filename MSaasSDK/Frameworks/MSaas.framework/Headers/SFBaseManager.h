//
//  SFBaseManager.h
//  AdDemo
//
//  Created by lurich on 2021/9/14.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@class SFFeedAdData,SFAdSourcesModel,SFConfigModelAdplace,SFLaunchView,SFFullscreenVideoAdd,SFSkipAdButton,SFInterstitialView;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ADSuccess)(SFAdSourcesModel *model);

@interface SFBaseManager : NSObject

@property (nonatomic, copy, nullable) ADSuccess successBlock;

@property (nonatomic, strong) SFAdSourcesModel * _Nullable baseModel;

@property (nonatomic, strong, nullable) SFLaunchView *yxADView;
@property (nonatomic, strong, nullable) SFInterstitialView *sf_InterstitialView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) SFSkipAdButton *skipButton;

//开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
@property (nonatomic, weak) UIViewController *showAdController;
//销毁不用的属性，防止内存泄漏
- (void)deallocAllProperty;
//获取最顶层控制器
- (UIViewController *)topVC;

//以下三个方法必须子类实现
//加载广告
- (void)loadADWithModel:(SFAdSourcesModel *)model;
//联盟竞价获取参数
- (NSDictionary *)getAdImpWithModel:(SFAdSourcesModel *)model;
//加载bidding广告
- (void)loadBiddingADWithModel:(SFAdSourcesModel *)model;
//上报ECPM
- (void)s2sBidECPMWithPrice:(NSString *)price;
//个性化推荐广告设置  YES:关闭个性化推荐   NO:打开个性化推荐    默认为NO
+ (void)setPersonalizedState:(BOOL)state;

//UIViewLayoutConstraintCreation
- (void)sf_ViewAnchorWithView:(UIView *)view Top:(NSLayoutYAxisAnchor *)top Left:(NSLayoutXAxisAnchor *)left Bottom:(NSLayoutYAxisAnchor *)bottom Right:(NSLayoutXAxisAnchor *)right Padding:(UIEdgeInsets)padding Size:(CGSize)size;

//联盟竞价失败原因上报
- (void)biddingAdFailWithPrice:(NSString *)price;
//联盟竞价成功上报
- (void)biddingAdSuccessWithPrice:(NSString *)price SecondPrice:(NSString *)secondPrice;

@end

@interface SFBaseManager (SFSplashAdd)

//开屏参数
@property (nonatomic) CGRect frame;
@property (nonatomic) NSInteger duration;
@property (nonatomic) NSInteger waitDataDuration;
@property (nonatomic) NSInteger hotspot_type;

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

//原生广告绑定视图和注册
- (void)registerAdViewForBindImage:(UIImageView *)view adData:(SFFeedAdData *)adData clickableViews:(NSArray *)views;
//模板广告渲染视图
- (void)renderViewWithViewArray:(NSArray *)viewArray;
//更换 showAdController
- (void)changeAdViewController:(UIViewController *)adViewController Data:(SFFeedAdData *)adData;

@end



@interface SFBaseManager (SFFullscreenVideoAdd)

//展示全屏视频广告
- (void)showFullscreenVideoAD;

@end
NS_ASSUME_NONNULL_END
