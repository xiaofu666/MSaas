//
//  SFInterstitialManager.h
//  TransferPlatform
//
//  Created by lurich on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SFInterstitialDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)interstitialAdDidLoad;
/**
 * 广告数据：加载失败（因为属于聚合SDK，所以该回调可能会调用多次）
 * @param error : 错误信息
 */
- (void)interstitialAdDidFailed:(NSError *)error;
/**
 * 广告视图：展示
 */
- (void)interstitialAdDidVisible;
/**
 * 广告视图：点击
 */
- (void)interstitialAdDidClick;
/**
 * 落地页或者appstoe返回事件
 */
- (void)interstitialAdDidCloseOtherController;
/**
 * 广告视图：关闭
 */
- (void)interstitialAdDidClose;

@end

@interface SFInterstitialManager : NSObject
/**
 * 广告回调的代理
 */
@property(nonatomic, weak) id<SFInterstitialDelegate> delegate;
/**
 * 获取广告的媒体位
 */
@property (nonatomic, copy) NSString *mediaId;
/**
 * 广告大小尺寸
 */
@property (nonatomic) CGSize size;

@property (nonatomic, weak) UIViewController *showAdController;

//加载广告数据
- (void)loadAdData;

//展示横幅广告  传入承载广告的
- (void)showInterstitialAd;

/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在MedPro平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
