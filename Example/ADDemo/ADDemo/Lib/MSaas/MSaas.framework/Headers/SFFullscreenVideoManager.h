//
//  SFFullscreenVideoManager.h
//  TransferPlatform
//
//  Created by lurich on 2021/10/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFFullscreenVideoDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 激励视频广告-视频-加载成功
 */
- (void)fullscreenVideoDidLoad;

/**
 * 激励视频广告素材加载失败（因为属于聚合SDK，所以该回调可能会调用多次）
 * @param error 错误对象
 */
- (void)fullscreenVideoDidFailWithError:(NSError *)error;

/**
 * 激励视频广告成功展示
 */
- (void)fullscreenVideoDidVisible;

/**
 * 激励视频广告点击
 */
- (void)fullscreenVideoDidClick;

/**
 * 激励视频广告播放达到激励条件
 * @param extra 额外参数，即初始化传入的extra
 */
- (void)fullscreenVideoDidRewardEffectiveWithExtra:(NSDictionary*)extra;

/**
 * 激励视频广告已经关闭
 */
- (void)fullscreenVideoDidClose;

@end

@interface SFFullscreenVideoManager : NSObject

/**
 * 广告回调的代理
 */
@property (nonatomic, weak) id<SFFullscreenVideoDelegate> delegate;
/**
 * 获取广告的媒体位
 */
@property (nonatomic, copy) NSString *mediaId;

/**
 * 加载广告数据
 * @param extra 额外参数
 */
- (void)loadAdDataWithExtra:(NSDictionary * _Nullable)extra;

//展示激励视频广告
- (void)showFullscreenVideoAdWithController:(UIViewController *)showAdController;


/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在MedPro平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
