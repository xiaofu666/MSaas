//
//  SFBannerManager.h
//  TransferPlatform
//
//  Created by lurich on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SFBannerDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)bannerAdDidLoad;
/**
 * 广告数据：加载失败（因为属于聚合SDK，所以该回调可能会调用多次）
 * @param error : 错误信息
 */
- (void)bannerAdDidFailed:(NSError *)error;
/**
 * 广告视图：展示
 */
- (void)bannerAdDidVisible;
/**
 * 广告视图：点击
 */
- (void)bannerAdDidClick;
/**
 * 落地页或者appstoe返回事件
 */
-(void)bannerAdDidCloseOtherController;
/**
 * 广告视图：关闭
 */
- (void)bannerAdDidClose;

@end

@interface SFBannerManager : NSObject
/**
 * 广告回调的代理
 */
@property(nonatomic, weak) id<SFBannerDelegate> delegate;
/**
 * 获取广告的媒体位
 */
@property (nonatomic, copy) NSString *mediaId;
/**
 * 是否轮播。 若要开启轮播。 时间选择为30-120s之间。若不符合 则不轮播 （默认30秒自动轮播）
 */
@property (nonatomic, assign, getter=isLoop) BOOL loop;
/**
 * 轮播间隔，单位秒，设置时间在 30~120s 范围内，初始化时传入。若不符合，则不轮播。
 */
@property (nonatomic, assign) int interval;
/**
 * 广告大小尺寸
 */
@property (nonatomic) CGSize size;

@property (nonatomic, weak) UIViewController *showAdController;

//加载广告数据
- (void)loadAdData;

//展示横幅广告  传入承载广告的
- (void)showBannerAdWithView:(UIView *)view;


/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在MedPro平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
