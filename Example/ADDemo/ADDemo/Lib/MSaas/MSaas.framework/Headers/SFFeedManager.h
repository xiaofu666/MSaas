//
//  SFInterstitialManager.h
//  TransferPlatform
//
//  Created by lurich on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SFFeedAdData;

NS_ASSUME_NONNULL_BEGIN
@protocol SFFeedDelegate <NSObject>

@optional
//回调已全部转为主线程
/**
 * 广告数据：加载成功
 */
- (void)feedAdDidLoadDatas:(NSArray<__kindof SFFeedAdData *> *)datas;
/**
 * 广告数据：加载失败（因为属于聚合SDK，所以该回调可能会调用多次）
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

@end

typedef NS_ENUM(NSInteger, SFFeedAdType) {
    SFFeedAdTypeImage         = 0,       // 信息流
    SFFeedAdTypePaster        = 1,       // 贴片
};

@interface SFFeedManager : NSObject
/**
 * 广告回调的代理
 */
@property(nonatomic, weak) id<SFFeedDelegate> delegate;
/**
 * 获取广告的媒体位
 */
@property (nonatomic, copy) NSString *mediaId;
/**
 * 广告数量,不传则后台控制
 */
@property (nonatomic) NSInteger adCount;
/**
 * 请求广告类型，默认是SFFeedAdTypeImage
 */
@property (nonatomic) SFFeedAdType adType;
/**
 * 开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *showAdController;

//加载广告数据
- (void)loadAdData;

/**
 绑定展示的图片视图和点击视图，行为由SDK控制
 @param view 展示的图片视图
 @param adData 广告数据
 @param views 可点击的视图
 */
- (void)registerAdViewForBindImage:(UIImageView *)view adData:(SFFeedAdData *)adData clickableViews:( NSArray<__kindof UIView *> *)views;

/// 自定义广告主时，需要进行注册
/// @param adv_id 广告主在MedPro平台对应的adv_id
/// @param className 自定义Adapter的类名
- (void)registerADVId:(NSString *)adv_id ClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
