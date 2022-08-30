//
//  SFFeedAdData.h
//  LunchAd
//
//  Created by shuai on 2018/10/15.
//  Copyright © 2018年 YX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define MSaasGdtMuteEnable @"MSaasGdtMuteEnable"
#define MSaasGdtPlayEnable @"MSaasGdtPlayEnable"

#define MSaasGdtEnableSwitchKey @"MSaasGdtEnableSwitchKey"

@interface SFFeedAdData : NSObject

/**
 * 大图Url，可能为空，建议使用 - (void)registerAdViewForInteraction:(UIImageView *)view adData:(SFFeedAdData*)adData clickableViews:(NSArray *)views; 方法替代
 */
@property (nonatomic, copy, nullable) NSString *imageUrl;

/**
 * 大图广告的宽
 */
@property (nonatomic) double imageWidth;

/**
 * 大图广告的高
 */
@property (nonatomic) double imageHeight;

/**
 * >1：横图 <1：竖图
 */
@property (nonatomic) double imageRatio;

/**
 * 图标Url
 */
@property (nonatomic, copy, nullable) NSString *iconUrl;

/**
 * 标题
 */
@property (nonatomic, copy, nullable) NSString *adTitle;

/**
 * 描述
 */
@property (nonatomic, copy, nullable) NSString *adContent;

/**
 * 广告ID
 */
@property (nonatomic, assign) NSInteger adID;

/**
 * 创意按钮显示文字
 */
@property (nonatomic, copy, nullable) NSString *buttonText;

/**
 * 广告类型
 */
@property (nonatomic, assign) NSInteger adType;

/**
 * 广告角标
 */
@property (nonatomic, strong, nullable) UIImage *adLogo;

/**
 * 广告主名称
 */
@property (nonatomic, copy, nullable) NSString *adOriginName;

/**
 * 是否为视频广告
 */
@property (nonatomic) BOOL isVideoAd;

/**
 * 视频广告时长
 */
@property (nonatomic) double videoDuration;

/**
 * 视频广告Url
 */
@property (nonatomic, copy, nullable) NSString *videoUrl;

/**
 * 是否自定义视频播放器，注册点击事件之前赋值
 */
@property (nonatomic) BOOL isCustomRender;

/**
 * 数据
 */
@property (nonatomic, strong, nullable) id data;

/**
 * 广告主
 */
@property (nonatomic, strong, nullable) id manager;

/**
 * 缓存的大图Image，注册之后有值
 */
@property (nonatomic, strong, nullable) UIImage *bgImage;

@end
