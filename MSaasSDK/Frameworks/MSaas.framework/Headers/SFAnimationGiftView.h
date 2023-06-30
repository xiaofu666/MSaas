//
//  SFAnimationGiftView.h
//  MSaas
//
//  Created by Lurich on 2023/5/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFAnimationGiftDelegate <NSObject>

- (void)adImageClick:(UITapGestureRecognizer *)tap;

@end

@interface SFAnimationGiftView : UIView

+ (instancetype)createWithDegate:(nullable id<SFAnimationGiftDelegate>)delegate;

- (void)startAnimationWithGesView:(nullable UIView *)gesView;

@end

NS_ASSUME_NONNULL_END
