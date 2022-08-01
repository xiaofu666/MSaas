//
//  SFAdSourcesModel.h
//  MSaas
//
//  Created by lurich on 2022/2/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFAdSourcesModel : NSObject
//adId
@property (nonatomic, copy) NSString *ad_id;

@property (nonatomic, assign) NSInteger adv_id;

@property (nonatomic, copy) NSString *adv_name;
//广告主key值
@property (nonatomic, copy) NSString *app_key;
//广告主应用ID
@property (nonatomic, copy) NSString *app_id;
//广告源广告位id
@property (nonatomic, copy) NSString *tagid;
//广告源版位id
@property (nonatomic, copy) NSString *slot_id;
//底价
@property (nonatomic, assign) double bidfloor;
//直客竞价
@property (nonatomic, assign) BOOL has_api_bid;
//联盟竞价
@property (nonatomic, assign) BOOL has_ad_bid;
//联盟SDK竞价
@property (nonatomic, assign) BOOL sdk_bidding;
//token
@property (nonatomic, copy) NSString *token;
//竞价价格
@property (nonatomic, assign) double price;

@property (nonatomic, copy) NSString *place_id;

@property (nonatomic, copy) NSString *group_id;

@property (nonatomic, copy) NSString *test_id;

@property (nonatomic, copy) NSString *skip;
//竞价胜出时 调用的胜出通知 URL。
@property (nonatomic, copy) NSString *nurl;
//竞价失败时，调用的通知URL。
@property (nonatomic, copy) NSString *lurl;
//广告请求成功的时间戳
@property (nonatomic, copy) NSString *timeLocal;
//摇一摇灵敏度
@property (nonatomic, assign) NSInteger sensitivity;
//插屏关闭按钮控制  A. 默认（直接出现）；B.显示时机：n秒后出关闭按钮
@property (nonatomic, copy) NSString *close_button_type;
//插屏关闭按钮倒计时 , 范围0-10s,默认5s
@property (nonatomic, assign) NSInteger count_down;
//插屏按钮大小,范围0-100,默认50
@property (nonatomic, assign) NSInteger button_size;

//自定义参数，json格式
@property (nonatomic, copy) NSString *ext;
//自定义转接器类名
@property (nonatomic, copy) NSString *adapter_class;

/*  以下参数为block回调  */
//1：素材加载成功  2：素材加载失败  3：点击  4：从落地页返回  5：广告关闭 6：素材成功展示 7：激励视频获得奖励回调  8：素材渲染成功   9：视频播放状态改变
@property (nonatomic, assign) NSInteger type;
//请求广告的错误信息
@property (nonatomic, strong) NSError *error;
//自投类点击链接
@property (nonatomic, copy) NSString *clickUrl;
//对应的广告主类
@property (nonatomic, strong, nullable) id objc;
//对应的广告主数据，Feed：原始数据数组   Template:模板view数组
@property (nonatomic, copy, nullable) NSArray *views;
//模板view
@property (nonatomic, weak) UIView *showView;
//视频状态（具体查看SFMediaPlayerStatus枚举）
@property (nonatomic, assign) NSInteger status;

@end

NS_ASSUME_NONNULL_END