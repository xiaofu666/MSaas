//
//  PasterVideoViewController.m
//  MedProAdapter
//
//  Created by lurich on 2021/12/28.
//

#import "PasterVideoViewController.h"
#import "ADInfo.h"

@interface PasterVideoViewController () <SFFeedDelegate>

@property (nonatomic,strong) SFFeedManager *feedManager;
@property (nonatomic,strong) UIImageView *videoView;
@property (nonatomic, strong) UILabel *timeView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) double videoDuration;

@end

@implementation PasterVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"贴片广告";
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width - 100 , 40)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"贴片广告" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadAd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
    
    UIButton *removebtn = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, [UIScreen mainScreen].bounds.size.width - 100 , 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"删除视频" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(removeVideoView) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self.view addSubview:removebtn];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeVideoView];
}
- (void)loadAd{
    [self removeVideoView];
    
    self.feedManager = [[SFFeedManager alloc] init];
    self.feedManager.mediaId = paster_id;
    self.feedManager.adCount = 1;
    self.feedManager.adType = SFFeedAdTypePaster;
    self.feedManager.showAdController = self;
    self.feedManager.delegate = self;
    [self.feedManager loadAdData];
}
- (void)removeVideoView{
    if (_timer) {
        [_timer invalidate];
        _feedManager = nil;
    }
    if (_videoView) {
        [_videoView removeFromSuperview];
    }
}

#pragma mark FeedAd delegate
/**
 * 广告数据：加载成功
 */
- (void)feedAdDidLoadDatas:(NSArray<__kindof SFFeedAdData *> *)datas{
    NSLog(@"广告数据：加载成功");
    if (datas.count > 0) {
        SFFeedAdData *model = datas.firstObject;
        NSLog(@"视频时长：%f",model.videoDuration);
        self.videoDuration = model.videoDuration;
        [self.feedManager registerAdViewForBindImage:self.videoView adData:model clickableViews:@[self.videoView]];
        [self.view addSubview:self.videoView];
        [self.videoView addSubview:self.timeView];
        
        //倒计时
        if (@available(iOS 10.0, *)) {
            self.timeView.text = [NSString stringWithFormat:@"%.0f 秒",self.videoDuration];
            __weak typeof(self) weakSelf = self;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                NSLog(@"视频倒计时：%f",self.videoDuration);
                weakSelf.timeView.text = [NSString stringWithFormat:@"%.0f 秒",weakSelf.videoDuration];
                if (weakSelf.videoDuration <= 0) {
                    [weakSelf.videoView removeFromSuperview];
                    weakSelf.videoView = nil;
                    [timer invalidate];
                }
                weakSelf.videoDuration -= 1;
            }];
        }
    }
}
- (UIImageView *)videoView{
    if (!_videoView) {
        CGFloat width = self.view.frame.size.width-60;
        CGFloat height = 9 * width / 16;
        _videoView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 400, width, height)];
        _videoView.backgroundColor = [UIColor lightGrayColor];
    }
    return _videoView;
}
- (UILabel *)timeView{
    if (!_timeView) {
        _timeView = [[UILabel alloc] initWithFrame:CGRectMake(self.videoView.bounds.size.width-80, 10, 70, 30)];
        _timeView.textAlignment = NSTextAlignmentCenter;
        _timeView.textColor = UIColor.whiteColor;
        _timeView.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
        _timeView.backgroundColor = UIColor.grayColor;
        _timeView.layer.masksToBounds = YES;
        _timeView.layer.cornerRadius = 15;
        _timeView.text = @"";
    }
    return _timeView;
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)feedAdDidFailed:(NSError *)error{
    NSLog(@"广告数据：加载失败 error = %@",error);
}
/**
 * 广告视图：点击
 */
- (void)feedAdDidClicked{
    NSLog(@"广告视图：点击");
}
/**
 * 落地页或者appstoe返回事件
 */
- (void)feedAdDidCloseOtherController{
    NSLog(@"落地页或者appstoe返回事件");
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

@end
