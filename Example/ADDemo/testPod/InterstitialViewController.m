//
//  YXInterstitialViewController.m
//  LunchAd
//
//  Created by Lurich on 2018/10/25.
//  Copyright © 2018年 YX. All rights reserved.
//

#import "InterstitialViewController.h"
#import "ADInfo.h"

@interface InterstitialViewController ()<SFInterstitialDelegate>

@property (nonatomic, strong) SFInterstitialManager *interstitialAd;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"插屏广告";//插屏
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width - 100 , 40)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"InterstitialAdTest" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(interstitialAdBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)interstitialAdBtnClicked:(UIButton*)button
{
    self.interstitialAd = [SFInterstitialManager new];
    self.interstitialAd.mediaId = interstitial_id;
    self.interstitialAd.showAdController = self.navigationController;
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAdData];
    NSLog(@"插屏广告请求");
}
/**
 * 广告数据：加载成功
 */
- (void)interstitialAdDidLoad{
    NSLog(@"插屏广告请求成功");
    [self.interstitialAd showInterstitialAd];
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)interstitialAdDidFailed:(NSError *)error{
    NSLog(@"插屏广告请求失败 error = %@",error);
}
/**
 * 广告视图：点击
 */
- (void)interstitialAdDidClick{
    NSLog(@"插屏广告点击");
}
/**
 * 落地页或者appstoe返回事件
 */
-(void)interstitialAdDidCloseOtherController{
    NSLog(@"落地页或者appstoe返回事件");
}
/**
 * 广告视图：关闭
 */
- (void)interstitialAdDidClose{
    NSLog(@"插屏广告关闭");
}

- (void)dealloc
{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
}

@end
