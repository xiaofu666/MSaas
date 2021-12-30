//
//  SFFeedAdData.h
//  LunchAd
//
//  Created by shuai on 2018/10/15.
//  Copyright © 2018年 YX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SFFeedAdData : NSObject

/**
 * 大图Url，可能为空，建议使用 - (void)registerAdViewForInteraction:(UIImageView *)view adData:(SFFeedAdData*)adData clickableViews:(NSArray *)views; 方法替代
 */
@property (nonatomic,copy) NSString *imageUrl;

/**
 * 图标Url
 */
@property (nonatomic,copy) NSString *iconUrl;

/**
 * 标题
 */
@property (nonatomic,copy) NSString *adTitle;

/**
 * 描述
 */
@property (nonatomic,copy) NSString *adContent;

/**
 * 广告ID
 */
@property (nonatomic,assign) NSInteger adID;

/**
 * 创意按钮显示文字
 */
@property (nonatomic, copy) NSString *buttonText;

/**
 * 广告类型
 */
@property (nonatomic,assign) NSInteger adType;

/**
 是否为视频广告
 */
@property (nonatomic) BOOL isVideoAd;

/**
 * 视频广告时长
 */
@property (nonatomic) double videoDuration;

/**
 * 数据
 */
@property (nonatomic,strong) id data;

/**
 * 广告主
 */
@property (nonatomic,strong) id manager;

/**
 * 缓存的大图Image，注册之后有值
 */
@property (nonatomic,strong) UIImage *bgImage;

@end
