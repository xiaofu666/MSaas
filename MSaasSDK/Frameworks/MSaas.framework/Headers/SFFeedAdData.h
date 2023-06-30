//
//  SFFeedAdData.h
//  LunchAd
//
//  Created by shuai on 2018/10/15.
//  Copyright © 2018年 YX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//视频声音控制宏
#define MSaasGdtMuteEnable @"MSaasGdtMuteEnable"
//视频播放控制宏
#define MSaasGdtPlayEnable @"MSaasGdtPlayEnable"

#define MSaasGdtEnableSwitchKey @"MSaasGdtEnableSwitchKey"

@interface SFFeedAdData : NSObject

/**
 * 是否由SDK渲染图片，默认为NO，如想让SDK渲染，注册点击事件之前赋值更改为YES，
 */
@property (nonatomic) BOOL isRenderImage;

/**
 * 大图Url，可能为空，不能以次区分视频和照片素材，视频可能也会有封面素材图，使用 isVideoAd 区分是否是视频素材
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
 * >1：横图
 * <1：竖图
 */
@property (nonatomic) double imageRatio;

/**
 * 多图广告的Url集合
 */
@property (nonatomic, copy, nullable) NSArray *mediaUrlList;

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
@property (nonatomic, assign) NSUInteger adID;

/**
 * 广告按钮显示文字
 */
@property (nonatomic, copy, nullable) NSString *buttonText;

/**
 * 广告主类型
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
 * 是否自定义视频播放器，注册点击事件之前赋值，默认由SDK去渲染视频广告
 */
@property (nonatomic) BOOL isCustomRender;

/**
 * 是否为视频广告
 */
@property (nonatomic) BOOL isVideoAd;

/**
 * 视频广告Url，可能为空
 */
@property (nonatomic, copy, nullable) NSString *videoUrl;

/**
 * 视频广告时长
 */
@property (nonatomic) double videoDuration;

/**
 * 视频广告的宽(非必传，可能为空)
 */
@property (nonatomic) double videoWidth;

/**
 * 视频广告的高(非必传，可能为空)
 */
@property (nonatomic) double videoHeight;

/**
 * 广告元数据
 */
@property (nonatomic, strong, nullable) id data;

/**
 * 广告主元数据
 */
@property (nonatomic, strong, nullable) id manager;

/**
 * 缓存的大图Image，注册之后异步有值
 */
@property (nonatomic, strong, nullable) UIImage *bgImage;

/**
 * 在混合信息流中，当为模板广告时，此属性有值
 */
@property (nonatomic, weak, nullable) UIView *adView;

@end
