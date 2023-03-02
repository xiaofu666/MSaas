//
//  SFVideoView.h
//  AdDemo
//
//  Created by lurich on 2021/9/8.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <MSaas/SFFeedManager.h>

@class SFVideoView;

NS_ASSUME_NONNULL_BEGIN

@protocol SFVideoViewPlayerDelegate <NSObject>

- (void)sf_nativeAdView:(SFVideoView *)videoView playerStatusChanged:(SFMediaPlayerStatus)status;

@end

@interface SFVideoView : UIView

@property (nonatomic, weak) id delegate;

@property (nonatomic, strong) AVPlayerLayer *playLayer;

@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, strong) AVPlayerItem *playItem;

- (void)renderWirhVideo:(NSString *)videoUrl Image:(NSString *)imageUrl;

@end

NS_ASSUME_NONNULL_END
