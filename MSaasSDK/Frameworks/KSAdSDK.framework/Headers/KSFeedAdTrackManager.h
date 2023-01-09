//
//  KSFeedAdTrackManager.h
//  KSUFeedAd
//
//  Created by 崔婉莹 on 2022/9/26.
//

#import <Foundation/Foundation.h>
#import <KSUCommercialLog/KSUCommercialLog.h>
#import <KSUCommercialLog/KSAdFeedCommercialBaseData.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSFeedAdTrackManager : NSObject

@property (nonatomic, assign) long renderDuration;
@property (nonatomic, assign) long resourceLoadDuration;
@property (nonatomic, assign) long convertDuration;

+ (instancetype)sharedInstance;

#pragma mark - 数据监控
///媒体调用加载广告
- (void)reportLoadStart:(NSInteger)adNum;
///获取到数据，客户端本地过滤剩余的广告数据
- (void)reportDataCalibration:(NSInteger)adNum;
///广告资源下载成功
- (void)reportDataDownload:(NSError *)error
                      type:(KSAdFeedShowType)type
                loadStatus:(KSAdFeedLoadStatus)loadStatus
              materialType:(KSAdMaterialType)materialType
               materialUrl:(NSString *)materialUrl;
///单广告对象预加载完成
- (void)reportPreloadSucceeded:(NSError *)error
                          type:(KSAdFeedShowType)type
                  materialType:(KSAdMaterialType)materialType
                    renderType:(KSAdFeedRenderType)renderType
                        extMsg:(NSString *)extMsg;
///媒体获取到所有数据对象
- (void)reportLoadDataSucceeded:(NSInteger)adNum;
///广告曝光
- (void)reportExposure:(KSAdFeedShowType)type
          materialType:(KSAdMaterialType)materialType
            renderType:(KSAdFeedRenderType)renderType;
///广告第一次交互
- (void)reportConvert:(KSAdFeedShowType)type
         materialType:(KSAdMaterialType)materialType
           renderType:(KSAdFeedRenderType)renderType;
///媒体请求失败
- (void)reportRequestFailed:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
