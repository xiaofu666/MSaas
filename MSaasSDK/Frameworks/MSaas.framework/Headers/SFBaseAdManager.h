//
//  SFBaseAdManager.h
//  MSaas
//
//  Created by lurich on 2022/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFADInfo : NSObject

/// 广告主名称
@property (nonatomic, copy) NSString *adnName;

// 广告主APPID
@property (nonatomic, copy) NSString *adnAppID;

// 广告位ID
@property (nonatomic, copy) NSString *adnPlaceID;

// 最佳ECPM
@property (nonatomic) double ecpm;

// 当前平台的APPID
@property (nonatomic, copy) NSString *appID;

// 当前平台的广告位ID
@property (nonatomic, copy) NSString *placeID;

// 广告加载ID
@property (nonatomic, copy) NSString *requestID;

// 广告类型： 1:开屏；2:插屏；3:信息流；4:模板；5:banner；6:激励视频；7:全屏视频；8:draw视频流；
@property (nonatomic, assign) NSInteger adType;

@end

@interface SFBaseAdManager : NSObject

/**
 * 获取广告的媒体位
 */
@property (nonatomic, copy) NSString *mediaId;

//加载广告数据
- (void)loadAdData;
/* 填充后可调用，返回当前最佳广告的信息 */
- (SFADInfo *)getCurrentBaseEcpmInfo;

@end

NS_ASSUME_NONNULL_END
