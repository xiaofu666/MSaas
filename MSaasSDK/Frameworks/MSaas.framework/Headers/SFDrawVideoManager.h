//
//  SFDrawVideoManager.h
//  MSaas
//
//  Created by lurich on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MSaas/SFBaseAdManager.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SFDrawVideoDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)drawVideoAdDidLoadViews:(NSArray<__kindof UIView *> *)views;
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)drawVideoAdDidFailed:(NSError *)error;
/**
 * 广告视图：展示
 */
- (void)drawVideoAdDidVisible;
/**
 * 广告视图：点击
 */
- (void)drawVideoAdDidClicked;
/**
 * 落地页或者appstoe返回事件
 */
- (void)drawVideoAdDidCloseOtherController;

@end

@interface SFDrawVideoManager : SFBaseAdManager

/// 广告回调的代理
@property(nonatomic, weak) id<SFDrawVideoDelegate> delegate;

/// 广告view大小尺寸，默认屏幕宽高
@property (nonatomic) CGSize size;

/// 广告数量,不传则后台控制
@property (nonatomic) NSInteger adCount;

/// 开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
@property (nonatomic, weak) UIViewController *showAdController;



/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在Mediatom平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;
- (void)deallocAllDrawVideoProperty;

@end

NS_ASSUME_NONNULL_END
