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

@property (nonatomic) CGRect tipFrame;
@property (nonatomic) CGRect skipFrame;
@property (nonatomic) CGRect volumeFrame;
@property (nonatomic, assign) BOOL frameSet;

@property (nonatomic) CGRect adFrame;
@property (nonatomic, weak) SFFeedAdData *model;
//底图背景
@property (nonatomic, weak) UIImageView *backImgView;
//图片
@property (nonatomic, weak) UIImageView *bigImgView;

- (void)restrictedClickAreaWithFrame:(CGRect)frame;

@property (nonatomic, copy) ShowBlock block;

- (void)addTipLabel:(NSString *)tipStr WithView:(UIView *)bottomView restrictedClick:(BOOL)isRes;

@end

NS_ASSUME_NONNULL_END
