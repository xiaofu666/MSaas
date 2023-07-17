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

@property (nonatomic, strong) NSMutableDictionary *registerDict;

+(instancetype)defaultManager;

/// 注册APP id
+ (BOOL)registerAppId:(NSString *)appId;
+ (NSString *)appId;

/// 自定义配置用户分组信息
+ (void)setUserInfoForMap:(NSDictionary *)userInfo;

/// 设置流量渠道 默认AppStore (只限大小写字母组成)
+ (void)setChannel:(NSString *)channel;

/// 设置子渠道
+ (void)setSubChannel:(NSString *)sub_channel;

/// 个性化推荐广告设置  YES:关闭个性化推荐   NO:打开个性化推荐    默认为NO
+ (void)setPersonalizedState:(BOOL)state;

/// 设置地理位置经纬度，可提高广告填充及收益
+ (void)setGeographicLocationLongitude:(NSString *)longitude Latitude:(NSString *)latitude;

/// 获取SDK Version 版本号
+ (NSString *)SDKVersion;

/// 检查集成的联盟SDK版本号
+ (void)checkSdkIntegration;

/// 开启联盟SDK回调日志
+ (void)unionAdCallbackLog:(BOOL)open;

/// 清除广告素材缓存
+ (void)clearAdMaterialCache;

@end

NS_ASSUME_NONNULL_END
