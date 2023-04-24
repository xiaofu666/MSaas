//
//  ADTableViewCell.m
//  TestAdA
//
//  Created by lurich on 2020/4/4.
//  Copyright © 2020 YX. All rights reserved.
//

#import "ADTableViewCell.h"
#import "ADInfo.h"

@interface ADTableViewCell ()<SFFeedDelegate>

@property (nonatomic, strong) SFFeedManager *feedManager;
@property (nonatomic, strong) SFFeedAdData *adData;

@end

@implementation ADTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.infoBtn.layer.masksToBounds = YES;
    self.infoBtn.layer.borderColor =  [UIColor colorWithRed:208/255.0 green:0 blue:0 alpha:1].CGColor;
    self.infoBtn.layer.borderWidth = 1;
    self.infoBtn.layer.cornerRadius = 4;
    
    [self loadAD];
}

- (void)loadAD{
    SFFeedManager *feedManager = [[SFFeedManager alloc] init];
    feedManager.mediaId = feed_id;
    feedManager.adCount = 1;
    feedManager.delegate = self;
    [feedManager loadAdData];
    self.feedManager = feedManager;
}

#pragma mark FeedAd delegate
/**
 * 广告数据：加载成功
 */
- (void)feedAdDidLoadDatas:(NSArray<__kindof SFFeedAdData *> *)datas{
    NSLog(@"广告数据：加载成功  %zd",datas.count);
    SFFeedAdData *adData = datas.firstObject;
    self.adData = adData;
    self.adContentLabel.text = adData.adContent;
    self.adTitleLabel.text = adData.adOriginName;
    CGFloat iconH = 17;
    CGFloat iconW = adData.adLogo.size.width * iconH / adData.adLogo.size.height;
    self.adLogoW.constant = iconW;
    self.adIconImageView.image = adData.adLogo;
    [self.infoBtn setTitle:adData.buttonText?:@"查看详情" forState:UIControlStateNormal];
    self.infoBtn.userInteractionEnabled = NO;
//        adData.isCustomRender = YES;
    adData.isRenderImage = YES;
    NSLog(@"getCurrentBaseEcpmInfo = %@",[self.feedManager getCurrentBaseEcpmInfo]);
    if (self.successBlock) {
        self.successBlock();
    }
}
- (void)registerAdView{
    self.feedManager.showAdController = self.showAdController;
    [self.feedManager registerAdViewForBindImage:self.adImageView adData:self.adData clickableViews:@[self]];
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
    NSLog(@"广告数据：点击");
}
/**
 * 落地页或者appstoe返回事件
 */
- (void)feedAdDidCloseOtherController{
    NSLog(@"广告数据：落地页或者appstoe返回事件");
}
/**
 * 广告视图：展示
 */
- (void)feedAdDidVisible{
    NSLog(@"广告数据：展示");
}
/**
 * 视频广告播放状态更改回调
 * @param status 视频广告播放状态
 */
- (void)feedAdViewPlayerStatusChanged:(SFMediaPlayerStatus)status{
    NSLog(@"广告数据：视频广告播放状态更改回调 %d", (int)status);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
