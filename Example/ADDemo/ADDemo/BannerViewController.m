//
//  BannerViewController.m
//  LunchAd
//
//  Created by Lurich on 2018/10/8.
//  Copyright © 2018年 . All rights reserved.
//

#import "BannerViewController.h"
#import "ADInfo.h"

#define SF_ScreenW    [UIScreen mainScreen].bounds.size.width
#define SF_ScreenH    [UIScreen mainScreen].bounds.size.height

@interface BannerViewController ()<SFBannerDelegate>

@property (nonatomic, strong) SFBannerManager *banner;

@property (nonatomic,strong) UIView *bannerView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"横幅广告";
    // Do any additional setup after loading the view from its nib.
    
    UIButton *iconBtn = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width - 100 , 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"BannerADTest" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(bannerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self.view addSubview:iconBtn];
}
- (void)bannerBtnClicked:(UIButton*)button{
    CGFloat width = self.view.frame.size.width;
    //根据宽高比自定义适配
    CGFloat height = 60;
    self.bannerView = [[UIView alloc]initWithFrame:CGRectMake(0,SF_ScreenH-height , width, height)];
    
    self.banner =  [SFBannerManager new];
    [self.banner registerADVId:@"2" ClassName:@"CustomGdtBannerManager"];
    self.banner.size = self.bannerView.bounds.size;
    self.banner.delegate = self;
    self.banner.mediaId = banner_id;
    self.banner.showAdController = self;
    [self.banner loadAdData];
    NSLog(@"Banner请求");
}

- (void)bannerAdDidLoad{
    NSLog(@"Banner广告请求成功");
    [self.banner showBannerAdWithView:self.bannerView];
    [self.view addSubview:self.bannerView];
}

- (void)bannerAdDidFailed:(NSError *)error{
    NSLog(@"Banner广告请求失败 error = %@",error);
}

- (void)bannerAdDidClick{
    NSLog(@"Banner广告点击");
}

- (void)bannerAdDidCloseOtherController{
    NSLog(@"Banner广告点击后从落地页或者appstoe返回事件");
}

- (void)bannerAdDidClose{
    NSLog(@"Banner广告关闭");
    [self.bannerView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
}

@end
