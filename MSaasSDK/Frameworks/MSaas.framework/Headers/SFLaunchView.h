//
//  SFLaunchView.h
//  TransferPlatform
//
//  Created by lurich on 2021/10/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFLaunchView : UIView

@property (nonatomic) CGRect tipFrame;
@property (nonatomic, assign) BOOL frameSet;

- (void)restrictedClickAreaWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
