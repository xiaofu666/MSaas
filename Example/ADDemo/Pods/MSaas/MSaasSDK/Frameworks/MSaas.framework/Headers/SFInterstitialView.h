//
//  SFInterstitialView.h
//  MSaas
//
//  Created by lurich on 2021/10/12.
//

#import <UIKit/UIKit.h>

@class SFFeedAdData,SFAdSourcesModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^ShowBlock)(void);

@interface SFInterstitialView : UIView

@property (nonatomic) CGRect adFrame;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, readonly) UIEdgeInsets sf_safeAreaInsets;

@property (nonatomic, strong) SFAdSourcesModel *adModel;

@property (nonatomic, assign) double currentTime;

@property (nonatomic, strong) UIImage *logoImg;

-(void)startGCDTimer;

- (UIView *)interstitialViewWithModel:(SFFeedAdData *)model;

@property (nonatomic, copy) ShowBlock block;

@property (nonatomic, copy) void(^cloaseBlock)(void);

@end

NS_ASSUME_NONNULL_END
