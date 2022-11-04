//
//  SFInterstitialManager.h
//  MSaas
//
//  Created by lurich on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SFTemplateDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)templateAdDidLoadViews:(NSArray<__kindof UIView *> *)views;
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)templateAdDidFailed:(NSError *)error;
/**
 * 广告视图：点击
 */
- (void)templateAdDidClickedWithADView:(UIView *)templateAdView;
/**
 * 广告视图：渲染成功
 */
- (void)templateAdDidRenderSuccessWithADView:(UIView *)templateAdView;
/**
 * 落地页或者appstoe返回事件
 */
- (void)templateAdDidCloseOtherControllerWithADView:(UIView *)templateAdView;
/**
 * 广告视图：关闭
 */
- (void)templateAdDidCloseWithADView:(UIView *)templateAdView;

@end

@interface SFTemplateManager : NSObject
/**
 * 广告回调的代理
 */
@property(nonatomic, weak) id<SFTemplateDelegate> delegate;
/**
 * 获取广告的媒体位
 */
@property (nonatomic, copy) NSString *mediaId;
/**
 * 广告view大小尺寸,高度为0时，将自适应高度（推荐高度传0进行自适应高度）
 */
@property (nonatomic) CGSize size;
/**
 * 广告数量,不传则后台控制
 */
@property (nonatomic) NSInteger adCount;
/**
 * 开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *showAdController;

//加载广告数据
- (void)loadAdData;

/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在MedPro平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
