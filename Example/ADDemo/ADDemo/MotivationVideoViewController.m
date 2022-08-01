//
//  MotivationVideoViewController.m
//  LunchAd
//
//  Created by Lurich on 2018/11/29.
//  Copyright © 2018 . All rights reserved.
//

#import "MotivationVideoViewController.h"
#import "ADInfo.h"

@interface MotivationVideoViewController ()<SFRewardVideoDelegate>

@property (nonatomic, strong) SFRewardVideoManager * motivationVideo;

@end

@implementation MotivationVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"激励视频广告";
    
    UIButton *launchScreenBtn2 = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, [UIScreen mainScreen].bounds.size.width - 100, 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"激励视频" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(loadRewardedVideo) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self.view addSubview:launchScreenBtn2];
    
    // Do any additional setup after loading the view.
}

- (void)loadRewardedVideo
{
    self.motivationVideo = [SFRewardVideoManager new];
    self.motivationVideo.mediaId = reward_video_id;
    self.motivationVideo.delegate = self;
    [self.motivationVideo loadAdDataWithExtra:nil];
}

/**
 * 激励视频广告-加载成功
 */
- (void)rewardedVideoDidLoad{
    NSLog(@"激励视频广告-加载成功 %s",__func__);
    [self.motivationVideo showRewardVideoAdWithController:self];
}

/**
 * 激励视频广告-加载失败
 * @param error 错误对象
 */
- (void)rewardedVideoDidFailWithError:(NSError *)error{
    NSLog(@"激励视频广告-加载失败 %s error = %@",__func__,error);
}

/**
 * 激励视频广告点击
 */
- (void)rewardedVideoDidClick{
    NSLog(@"激励视频广告-点击 %s",__func__);
}

/**
 * 激励视频广告播放达到激励条件
 * @param extra 额外参数，即初始化传入的extra
 */
- (void)rewardedVideoDidRewardEffectiveWithExtra:(NSDictionary*)extra{
    NSLog(@"激励视频广告播放达到激励条件 %s extra = %@",__func__,extra);
}

/**
 * 激励视频广告已经关闭
 */
- (void)rewardedVideoDidClose{
    NSLog(@"激励视频广告-已经关闭 %s",__func__);
}
- (void)dealloc{
    NSLog(@"%s",__func__);
}

@end
