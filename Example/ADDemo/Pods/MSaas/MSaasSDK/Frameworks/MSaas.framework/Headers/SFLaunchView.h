//
//  SFLaunchView.h
//  MSaas
//
//  Created by lurich on 2021/10/12.
//

#import <UIKit/UIKit.h>

@class SFFeedAdData;

NS_ASSUME_NONNULL_BEGIN

typedef void(^ShowBlock)(void);

@interface SFLaunchView : UIView

@property (nonatomic) UIEdgeInsets sf_safeAreaInsets;

@property (nonatomic) CGRect tipFrame;
@property (nonatomic) CGRect skipFrame;
@property (nonatomic, assign) BOOL frameSet;

@property (nonatomic) CGRect adFrame;
@property (nonatomic, strong) UIImageView *bigImgView;
@property (nonatomic, strong) UIImageView *backImgView;
@property (nonatomic, strong) SFFeedAdData *model;
@property (nonatomic, strong) UIImageView *iconView;

- (void)restrictedClickAreaWithFrame:(CGRect)frame;

@property (nonatomic, copy) ShowBlock block;

@end

NS_ASSUME_NONNULL_END
