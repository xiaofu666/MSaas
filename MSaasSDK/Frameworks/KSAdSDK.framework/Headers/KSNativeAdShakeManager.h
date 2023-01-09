//
//  KSNativeAdShakeManager.h
//  KSUNativeAd
//
//  Created by 崔婉莹 on 2022/10/31.
//

#import <Foundation/Foundation.h>

@class KSNativeAd;

NS_ASSUME_NONNULL_BEGIN

@interface KSNativeAdShakeManager : NSObject

+ (instancetype)sharedInstance;
- (void)addWeakNativeAd:(KSNativeAd *)nativeAd;
- (void)removeWeakNativeAd;
- (void)stopDeviceMotionMonitor;

@end

NS_ASSUME_NONNULL_END
