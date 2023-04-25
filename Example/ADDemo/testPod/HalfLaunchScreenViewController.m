//
//  HalfLaunchScreenViewController.m
//  LunchAd
//
//  Created by Lurich on 2018/10/23.
//  Copyright © 2018年 . All rights reserved.
//

#import "HalfLaunchScreenViewController.h"
#import "ADInfo.h"

@interface HalfLaunchScreenViewController ()<SFSplashDelegate>

@property (nonatomic, strong) SFSplashManager *manager;

@end

@implementation HalfLaunchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"半屏开屏广告";
    UIButton *launchScreenBtn = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, [UIScreen mainScreen].bounds.size.width - 100, 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"halfLaunchADTest" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(halfLaunchScreenBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self.view addSubview:launchScreenBtn];
    // Do any additional setup after loading the view from its nib.
//    [self launchScreenBtnClicked:nil];
}
- (void)halfLaunchScreenBtnClicked:(UIButton*)sender
{
    UILabel *bottom = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 125)];
    bottom.text = @"AD Demo";
    bottom.textAlignment = NSTextAlignmentCenter;
    bottom.font = [UIFont systemFontOfSize:35];
    bottom.userInteractionEnabled = YES;
    bottom.backgroundColor = [UIColor whiteColor];
    
    SFSplashManager *manager = [SFSplashManager new];
    manager.delegate = self;
    manager.mediaId = splash_id;
    manager.bottomView = bottom; //bottom 为含logo的view
    [manager loadAdData];
    self.manager = manager;
    NSLog(@"开始请求开屏广告");
}



#pragma mark ADDelegate
/**
 * 广告数据：加载成功
 */
- (void)splashAdDidLoad{
    NSLog(@"开屏广告：加载成功");
    [self.manager showSplashAdWithWindow:[UIApplication sharedApplication].keyWindow];
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)splashAdDidFailed:(NSError *)error{
    NSLog(@"开屏广告：加载失败 error = %@",error);
}
/**
 * 广告视图：点击
 * @param urlStr 媒体自定义广告时，返回的落地页链接
 */
- (void)splashAdDidClickedWithUrlStr:(NSString *_Nullable)urlStr{
    NSLog(@"开屏广告：点击");
}
/**
 * 落地页或者appstoe返回事件
 */
-(void)splashAdDidCloseOtherController{
    NSLog(@"开屏广告：落地页或者appstoe返回事件");
}
/**
 * 广告视图：关闭
 */
- (void)splashAdDidShowFinish{
    NSLog(@"开屏广告：展示完成");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
