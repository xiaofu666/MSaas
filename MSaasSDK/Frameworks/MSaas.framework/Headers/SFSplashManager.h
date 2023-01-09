//
//  SFSplashManager.h
//  MSaas
//
//  Created by lurich on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MSaas/SFBaseAdManager.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SFSplashDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)splashAdDidLoad;
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)splashAdDidFailed:(NSError *)error;
/**
 * 广告成功展示
 */
- (void)splashAdDidVisible;
/**
 * 广告视图：点击
 * @param urlStr 媒体自定义广告时，返回的落地页链接
 */
- (void)splashAdDidClickedWithUrlStr:(NSString *_Nullable)urlStr;
/**
 * 落地页或者appstoe返回事件
 */
-(void)splashAdDidCloseOtherController;
/**
 * 广告视图：关闭
 */
- (void)splashAdDidShowFinish;
/**
 * 广告成功渲染
 */
- (void)splashAdDidRender;

@end

@interface SFSplashManager : SFBaseAdManager
/**
 * 广告回调的代理
 */
@property(nonatomic, weak) id<SFSplashDelegate> delegate;
/**
 1. 全屏接入：bottomView 不传入
 2. 半屏接入：bottomView 传入logo的view
 */
/** 设置半屏广告的所含 logo 的 view  */
@property (nonatomic, strong) UIView * _Nullable bottomView;
/**
 * 获取广告的媒体位
 */
@property (nonatomic, copy) NSString *mediaId;
/**
 * 设置开屏广告的停留时间default 5s
 */
@property (nonatomic, assign) NSInteger duration DEPRECATED_MSG_ATTRIBUTE("已弃用，固定5秒");
/**
 * 设置开屏广告的等待时间 default 5s
 */
@property (nonatomic, assign) NSInteger waitDataDuration DEPRECATED_MSG_ATTRIBUTE("已弃用，后台配置");
/**
 * 用来弹出目标页的ViewController，一般为当前ViewController或root控制器
 */
@property (nonatomic, weak) UIViewController *showAdController;

//加载广告数据
- (void)loadAdData;

//展示开屏广告
- (void)showSplashAdWithWindow:(UIWindow *)window;


/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在MedPro平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;

/**
 API广告视频播放静音开关
 @param isMute 是否静音
 */
- (void)videoMute:(BOOL)isMute;

@end

NS_ASSUME_NONNULL_END
