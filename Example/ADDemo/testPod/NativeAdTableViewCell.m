//
//  NativeAdTableViewCell.m
//  TestAdA
//
//  Created by lurich on 2020/4/4.
//  Copyright © 2020 YX. All rights reserved.
//

#import "NativeAdTableViewCell.h"
#import "ADInfo.h"

@interface NativeAdTableViewCell ()<SFNativeDelegate>

@property (nonatomic, strong) SFNativeManager *nativeManager;
@property (nonatomic, strong) SFFeedAdData *adData;
@property (nonatomic, strong) SFTemplateAdView *adView;

@end

@implementation NativeAdTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.closeBtn.layer.masksToBounds = YES;
    self.closeBtn.layer.borderColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1].CGColor;
    self.closeBtn.layer.borderWidth = 1;
    self.closeBtn.layer.cornerRadius = 10;
}

- (void)loadAD{
    SFNativeManager *manager = [[SFNativeManager alloc] init];
    manager.mediaId = self.placeId;
    manager.adCount = 1;
    manager.size = CGSizeMake(SF_ScreenW, 0);
    manager.showAdController = self.showAdController;
    manager.delegate = self;
    [manager setTheme:SFTemplateExpressNativeNormalTheme];
    [manager loadAdData];
    self.nativeManager = manager;
}
/// MARK: SFNativeDelegate 代理回调
/**
 * 广告数据：加载成功
 */
- (void)nativeAdDidLoadDatas:(NSArray<__kindof SFFeedAdData *> *)datas{
    NSLog(@"广告数据：加载成功  %zd",datas.count);
    SFFeedAdData *adData = datas.firstObject;
    //请求单个广告示例
    self.adData = adData;
    if (adData.adView) {
        /// 模版广告直接添加
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self addSubview:adData.adView];
    } else {
        adData.isRenderImage = YES;
        /// 使用 SDK 自带模版渲染广告示例
        SFTemplateAdView *adView = [[SFTemplateAdView alloc] initWithFrame:CGRectMake(0, 0, self.adBackView.frame.size.width, 0) Model:adData Style:SFTemplateStyleLIRT LRMargin:0 TBMargin:0];
        [self.adBackView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.adBackView addSubview:adView];
        self.adView = adView;
    }
    NSLog(@"getCurrentBaseEcpmInfo = %@",[self.nativeManager getCurrentBaseEcpmInfo]);
    if (self.successBlock) {
        self.successBlock(1);
    }
}
- (void)registerAdView{
    if (self.adData.adView) {
        //模板 SDK 处理
    } else {
        [self.nativeManager registerAdViewForBindImage:self.adView.adImageView adData:self.adData clickableViews:@[self.adBackView]];
    }
}
- (CGFloat)cellHeight{
    if (self.adData.adView) {
        CGFloat cellHeight = self.adData.adView.bounds.size.height;
        return cellHeight;
    } else {
        /// 使用 SDK 模版渲染示例 (广告高度+cell 上下间距)
        CGFloat cellHeight = self.adView.bounds.size.height + 20;
        return cellHeight;
    }
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)nativeAdDidFailed:(NSError *)error{
    NSLog(@"广告数据：加载失败 error = %@",error);
}
/**
 * 广告视图：展示
 */
- (void)nativeAdDidVisible{
    NSLog(@"广告视图：展示");
}
/**
 * 广告视图：点击
 */
- (void)nativeAdDidClicked{
    NSLog(@"广告数据：点击");
}
/**
 * 落地页或者appstoe返回事件
 */
- (void)nativeAdDidCloseOtherController{
    NSLog(@"广告数据：落地页或者appstoe返回事件");
}
/**
 * 视频广告播放状态更改回调
 * @param status 视频广告播放状态
 */
- (void)nativeAdVideoPlayerStatusChanged:(SFMediaPlayerStatus)status{
    NSLog(@"广告数据：视频广告播放状态更改回调 %d", (int)status);
}
/**
 * 广告视图：渲染成功
 */
- (void)nativeAdDidRenderSuccessWithADView:(UIView *)nativeAdView{
    NSLog(@"广告视图：渲染成功");
    if (self.successBlock) {
        self.successBlock(2);
    }
}
/**
 * 广告视图：关闭
 */
- (void)nativeAdDidCloseWithADView:(UIView *)nativeAdView{
    NSLog(@"广告视图：关闭");
    [self closeBtnClick];
}
- (IBAction)closeBtnClick {
    if (self.successBlock) {
        self.successBlock(3);
    }
}
- (void)deallocAllFeedProperty{
    NSLog(@"%s",__func__);
    //释放绑定的资源对象
    [self.nativeManager deallocAllFeedProperty];
}

@end
