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

/// 是否自动控制播放
@property (nonatomic, assign) BOOL isAutoControl;

@property (nonatomic, assign) NSTimeInterval currentTime;

- (void)renderWirhVideo:(NSString *)videoUrl Image:(nullable NSString *)imageUrl;

- (void)replay;

- (void)video_play;
- (void)video_pause;

/// 声音控制 YES：静音； NO：有声
- (void)videoMuted:(BOOL)muted;

/// 释放当前的播放器
-(void)freePlayer;

@end

NS_ASSUME_NONNULL_END
