//
//  SFRewardVideoManager.h
//  MSaas
//
//  Created by lurich on 2021/10/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MSaas/SFBaseAdManager.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFRewardVideoDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 激励视频广告-视频-加载成功
 */
- (void)rewardedVideoDidLoad;

/**
 * 激励视频广告素材加载失败
 * @param error 错误对象
 */
- (void)rewardedVideoDidFailWithError:(NSError *)error;

/**
 * 激励视频广告成功展示
 */
- (void)rewardedVideoDidVisible;

/**
 * 激励视频广告点击
 */
- (void)rewardedVideoDidClick;

/**
 * 激励视频广告播放达到激励条件
 * @param extra 额外参数，即初始化传入的extra
 */
- (void)rewardedVideoDidRewardEffectiveWithExtra:(NSDictionary*)extra;

/**
 * 激励视频广告已经关闭
 */
- (void)rewardedVideoDidClose;

@end

@interface SFRewardVideoManager : SFBaseAdManager

/**
 * 广告回调的代理
 */
@property (nonatomic, weak) id<SFRewardVideoDelegate> delegate;


/**
 * 用户ID，可选参数，服务端校验奖励时透传
 */
@property (nonatomic, copy) NSString *userId;


/**
 * 加载广告数据
 * @param extra 额外参数
 */
- (void)loadAdDataWithExtra:(NSDictionary * _Nullable)extra;

/// 展示激励视频广告
- (void)showRewardVideoAdWithController:(UIViewController *)showAdController;


/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在Mediatom平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
