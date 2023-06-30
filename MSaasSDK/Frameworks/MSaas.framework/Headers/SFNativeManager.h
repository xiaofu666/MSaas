//
//  SFNativeManager.h
//  MSaas
//
//  Created by Lurich on 2023/5/26.
//

#import <MSaas/MSaas.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SFNativeDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)nativeAdDidLoadDatas:(NSArray<__kindof SFFeedAdData *> *)datas;
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)nativeAdDidFailed:(NSError *)error;
/**
 * 广告视图：展示
 */
- (void)nativeAdDidVisible;
/**
 * 广告视图：点击
 */
- (void)nativeAdDidClicked;
/**
 * 落地页或者appstoe返回事件
 */
- (void)nativeAdDidCloseOtherController;
/**
 * 视频广告播放状态更改回调
 * @param status 视频广告播放状态
 */
- (void)nativeAdVideoPlayerStatusChanged:(SFMediaPlayerStatus)status;

//当为模板广告时有以下回调
/**
 * 广告视图：渲染成功
 */
- (void)nativeAdDidRenderSuccessWithADView:(UIView *)nativeAdView;
/**
 * 广告视图：关闭
 */
- (void)nativeAdDidCloseWithADView:(UIView *)nativeAdView;

@end

// ***** SFNativeManager 为 SFFeedManager 和 SFTemplateManager 和 SFDrawVideoManager 的聚合使用 *****
@interface SFNativeManager : SFBaseAdManager
/**
 * 广告回调的代理
 */
@property(nonatomic, weak) id<SFNativeDelegate> delegate;

/**
 * 开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *showAdController;

/**
 * 最多返回的广告数量 ,默认为1
 */
@property (nonatomic) NSInteger adCount;

/**
 绑定展示的图片视图和点击视图，行为由SDK控制
 @param view 展示的图片视图
 @param adData 广告数据
 @param views 可点击的视图
 */
// !!!:  必须在确保视图成功显示在屏幕上之后再调用注册点击，确保广告进行有效曝光
- (void)registerAdViewForBindImage:(UIImageView *)view adData:(SFFeedAdData *)adData clickableViews:(NSArray *)views;

- (void)deallocAllFeedProperty;

// **************************** 当为模板广告时，以下属性可用 **************************** 
/**
 * 广告view大小尺寸,高度为0时，将自适应高度（推荐高度传0进行自适应高度）
 */
@property (nonatomic) CGSize size;
/**
 * 针对部分联盟广告主有效
 */
@property (nonatomic, assign) SFTemplateExpressNativeTheme theme;

@end

NS_ASSUME_NONNULL_END
