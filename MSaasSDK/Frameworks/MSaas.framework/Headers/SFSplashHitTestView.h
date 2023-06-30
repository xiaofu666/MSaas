//
//  SFSplashHitTestView.h
//  MSaas
//
//  Created by Lurich on 2023/5/30.
//

#import <UIKit/UIKit.h>
#import <MSaas/MSaas.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFSplashHitTestView : UIView

@property (nonatomic, weak) SFLaunchView *launchView;
@property (nonatomic, weak) SFSkipAdButton *skipButton;

@property (nonatomic) CGRect tipFrame;
@property (nonatomic, assign) BOOL frameSet;

- (void)addClickAreaWithView:(UIView *)bottomView restrictedClick:(BOOL)isRes;
- (void)startAnimation;

@end

NS_ASSUME_NONNULL_END
