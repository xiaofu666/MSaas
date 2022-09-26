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

@interface SFAdSDKManager : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

//注册APP id
+ (BOOL)registerAppId:(NSString *)appId;

//设置流量渠道 默认AppStore
+ (void)setChannel:(NSString *)channel;

@end

NS_ASSUME_NONNULL_END
