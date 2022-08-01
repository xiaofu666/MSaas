//
//  LaunchScreenViewController.m
//  LunchAd
//
//  Created by Lurich on 2018/10/8.
//  Copyright © 2018年 . All rights reserved.
//

#import "LaunchScreenViewController.h"
#import "ADInfo.h"

@interface LaunchScreenViewController ()<SFSplashDelegate>

@property (nonatomic, strong) SFSplashManager *manager;

@end

@implementation LaunchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"全屏开屏广告";
    
    UIButton *launchScreenBtn = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width - 100, 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"LaunchADTest" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(launchScreenBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self.view addSubview:launchScreenBtn];
}

- (void)launchScreenBtnClicked:(UIButton*)sender{
    _manager = [SFSplashManager new];
    _manager.delegate = self;
    _manager.mediaId = splash_id;
    [_manager loadAdData];
    NSLog(@"开始请求开屏广告");
}

#pragma mark ADDelegate
/**
 * 广告数据：加载成功
 */
- (void)splashAdDidLoad{
    NSLog(@"广告数据：加载成功");
    [self.manager showSplashAdWithWindow:[UIApplication sharedApplication].keyWindow];
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)splashAdDidFailed:(NSError *)error{
    NSLog(@"广告数据：加载失败 error = %@",error);
}
/**
 * 广告视图：点击
 * @param urlStr 媒体自定义广告时，返回的落地页链接
 */
- (void)splashAdDidClickedWithUrlStr:(NSString *_Nullable)urlStr{
    NSLog(@"广告视图：点击 urlStr = %@",urlStr);
}
/**
 * 落地页或者appstoe返回事件
 */
-(void)splashAdDidCloseOtherController{
    NSLog(@"落地页或者appstoe返回事件");
}
/**
 * 广告视图：关闭
 */
- (void)splashAdDidShowFinish{
    NSLog(@"广告视图：展示完成");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
