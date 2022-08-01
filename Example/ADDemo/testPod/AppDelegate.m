//
//  AppDelegate.m
//  TransferPlatform
//
//  Created by lurich on 2021/9/14.
//

#import "AppDelegate.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import "ADInfo.h"

@interface AppDelegate ()<SFSplashDelegate>

@property (nonatomic, strong) SFSplashManager *manager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *rootVC = [[UINavigationController alloc]initWithRootViewController:[NSClassFromString(@"ViewController") new]];//Study
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    [SFAdSDKManager registerAppId:app_id];
    
//    [self requestIDFA];
    return YES;
}

- (void)requestIDFA {
   if (@available(iOS 14, *)) {
       [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
           // Tracking authorization completed. Start loading ads here.
            [self loadSplashAd];
       }];
   } else {
       // Fallback on earlier versions
   }
}
- (void)loadSplashAd{
    self.manager = [SFSplashManager new];
    self.manager.delegate = self;
    self.manager.mediaId = splash_id;
    [self.manager loadAdData];
}
#pragma mark ADDelegate
/**
 * 广告数据：加载成功
 */
- (void)splashAdDidLoad{
    NSLog(@"广告数据：加载成功");
    [self.manager showSplashAdWithWindow:self.window];
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)splashAdDidFailed:(NSError *)error{
    NSLog(@"广告数据：加载失败 error = %@",error);
}
/**
 * 广告视图：点击
 * @param urlStr 媒体自定义广告时，返回的落地页链接
 */
- (void)splashAdDidClickedWithUrlStr:(NSString *_Nullable)urlStr{
    NSLog(@"广告视图：点击 urlStr = %@",urlStr);
}
/**
 * 落地页或者appstoe返回事件
 */
-(void)splashAdDidCloseOtherController{
    NSLog(@"落地页或者appstoe返回事件");
}
/**
 * 广告视图：关闭
 */
- (void)splashAdDidShowFinish{
    NSLog(@"广告视图：展示完成");
}

@end
