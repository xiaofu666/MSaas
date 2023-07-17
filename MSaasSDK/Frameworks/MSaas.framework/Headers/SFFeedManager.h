//
//  SFInterstitialManager.h
//  MSaas
//
//  Created by lurich on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MSaas/SFBaseAdManager.h>

@class SFFeedAdData;

/**
 *  视频播放器状态
 *
 *  播放器只可能处于以下状态中的一种
 */
typedef NS_ENUM(NSUInteger, SFMediaPlayerStatus) {
    SFMediaPlayerStatusInitial      = 0,    // 初始状态
    SFMediaPlayerStatusLoading      = 1,    // 加载中
    SFMediaPlayerStatusStarted      = 2,    // 开始播放
    SFMediaPlayerStatusPaused       = 3,    // 用户行为导致暂停
    SFMediaPlayerStatusError        = 4,    // 播放出错
    SFMediaPlayerStatusStoped       = 5,    // 播放停止
    SFMediaPlayerStatusPlaying      = 6,    // 播放中
    SFMediaPlayerStatusWillStart    = 10,   // 即将播放
};

NS_ASSUME_NONNULL_BEGIN
@protocol SFFeedDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)feedAdDidLoadDatas:(NSArray<__kindof SFFeedAdData *> *)datas;
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)feedAdDidFailed:(NSError *)error;
/**
 * 广告视图：展示
 */
- (void)feedAdDidVisible;
/**
 * 广告视图：点击
 */
- (void)feedAdDidClicked;
/**
 * 落地页或者appstoe返回事件
 */
- (void)feedAdDidCloseOtherController;
/**
 * 视频广告播放状态更改回调
 * @param status 视频广告播放状态
 */
- (void)feedAdViewPlayerStatusChanged:(SFMediaPlayerStatus)status;

@end

@interface SFFeedManager : SFBaseAdManager
/**
 * 广告回调的代理
 */
@property(nonatomic, weak) id<SFFeedDelegate> delegate;

/**
 * 开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *showAdController;

/**
 * 最多返回的广告数量 ,默认为1
 */
@property (nonatomic) NSInteger adCount;

// !!!:  必须在确保视图成功显示在屏幕上之后再调用注册点击，确保广告进行有效曝光
/**
 绑定展示的图片视图和点击视图，行为由SDK控制
 @param view 展示的图片视图
 @param adData 广告数据
 @param views 可点击的视图
 */
- (void)registerAdViewForBindImage:(UIImageView *)view adData:(SFFeedAdData *)adData clickableViews:( NSArray<__kindof UIView *> *)views;

/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在Mediatom平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;
- (void)deallocAllFeedProperty;

@end

NS_ASSUME_NONNULL_END
