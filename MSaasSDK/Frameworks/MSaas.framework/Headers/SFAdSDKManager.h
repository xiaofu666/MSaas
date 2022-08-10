//
//  SFAdSDKManager.h
//  AdDemo
//
//  Created by lurich on 2021/9/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFAdSDKManager : NSObject<WKScriptMessageHandler,WKNavigationDelegate>

@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

//注册APP id
+ (BOOL)registerAppId:(NSString *)appId;

// 自定义配置用户分组信息
+ (void)setUserInfoForMap:(NSDictionary *)userInfo;

//设置流量渠道 默认AppStore (只限大小写字母组成)
+ (void)setChannel:(NSString *)channel;

//设置子渠道
+ (void)setSubChannel:(NSString *)sub_channel;

//个性化推荐广告设置
+ (void)setPersonalizedState:(BOOL)state;

//设置地理位置经纬度，可提高广告填充及收益
+ (void)setGeographicLocationLongitude:(NSString *)longitude Latitude:(NSString *)latitude;

//获取SDK Version 版本号
+ (NSString *)SDKVersion;


@end

NS_ASSUME_NONNULL_END
