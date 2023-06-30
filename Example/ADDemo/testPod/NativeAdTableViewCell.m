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

@end

@implementation NativeAdTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.infoBtn.layer.masksToBounds = YES;
    self.infoBtn.layer.borderColor =  [UIColor colorWithRed:208/255.0 green:0 blue:0 alpha:1].CGColor;
    self.infoBtn.layer.borderWidth = 1;
    self.infoBtn.layer.cornerRadius = 4;
}

- (void)loadAD{
    NSLog(@"广告数据：开始请求");
    SFNativeManager *manager = [[SFNativeManager alloc] init];
    manager.mediaId = natives_id;
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
    //请求单个广告示例
    SFFeedAdData *adData = datas.firstObject;
    self.adData = adData;
    if (adData.adView) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self addSubview:adData.adView];
    } else {
        self.adContentLabel.text = adData.adContent;
        self.adTitleLabel.text = adData.adTitle;
        CGFloat iconH = 17;
        CGFloat iconW = adData.adLogo.size.width * iconH / adData.adLogo.size.height;
        self.adLogoW.constant = iconW;
        self.adIconImageView.image = adData.adLogo;
        [self.infoBtn setTitle:adData.buttonText?:@"查看详情" forState:UIControlStateNormal];
        self.infoBtn.userInteractionEnabled = NO;
    //        adData.isCustomRender = YES;
        adData.isRenderImage = YES;
    }
    NSLog(@"getCurrentBaseEcpmInfo = %@",[self.nativeManager getCurrentBaseEcpmInfo]);
    if (self.successBlock) {
        self.successBlock(1);
    }
}
- (void)registerAdView{
    if (self.adData.adView) {
        
    } else {
        self.nativeManager.showAdController = self.showAdController;
        [self.nativeManager registerAdViewForBindImage:self.adImageView adData:self.adData clickableViews:@[self]];
    }
}
- (CGFloat)cellHeight{
    if (self.adData.adView) {
        CGFloat cellHeight = self.adData.adView.bounds.size.height;
        NSLog(@"AdViewHeight = %f",cellHeight);
        return cellHeight;
    } else {
        CGFloat cellHeight = 90 + (UIScreen.mainScreen.bounds.size.width - 30) * 9 / 16;
        NSLog(@"cellHeight = %f",cellHeight);
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
    if (self.successBlock) {
        self.successBlock(3);
    }
}


@end
