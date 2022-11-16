//
//  SFVideoView.h
//  AdDemo
//
//  Created by lurich on 2021/9/8.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFVideoView : UIView

@property (nonatomic, strong) AVPlayerLayer *playLayer;

@property (nonatomic, assign) CMTime currentTime;
@property (nonatomic, strong) AVPlayerItem *playItem;

- (void)renderWirhVideo:(NSString *)videoUrl Image:(NSString *)imageUrl;

@end

NS_ASSUME_NONNULL_END
