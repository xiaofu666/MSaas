//
//  SFBannerView.h
//  MSaasAdapter
//
//  Created by Lurich on 2023/3/28.
//

#import <UIKit/UIKit.h>

@class SFFeedAdData,SFAdSourcesModel;

NS_ASSUME_NONNULL_BEGIN

@interface SFBannerView : UIView

@property (nonatomic, strong) UIImageView *logoImgView;
@property (nonatomic, strong, nullable) SFFeedAdData *model;

@end

NS_ASSUME_NONNULL_END
