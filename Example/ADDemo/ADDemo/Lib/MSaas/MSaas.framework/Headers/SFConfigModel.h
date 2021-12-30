//
//Created by ESJsonFormatForMac on 21/10/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SFConfigModelAdplace,SFConfigModelAd_Sources;
@interface SFConfigModel : NSObject

@property (nonatomic, copy) NSString *req_id;

@property (nonatomic, strong) SFConfigModelAdplace *adplace;

@property (nonatomic, assign) NSInteger code;

@end
@interface SFConfigModelAdplace : NSObject

@property (nonatomic, copy) NSString *group_id;

@property (nonatomic, assign) NSInteger timeout;

@property (nonatomic, assign) NSInteger all_time;

@property (nonatomic, strong) NSArray *ad_sources;

@property (nonatomic, copy) NSString *place_id;

@property (nonatomic, assign) NSInteger cache_time;

@property (nonatomic, assign) NSInteger request_num;

@end

@interface SFConfigModelAd_Sources : NSObject

//广告位ID,1=穿山甲，2=优量汇，3=快手，4=京准通，5=直客，6=百度优选，7=sigmob
@property (nonatomic, assign) NSInteger adv_id;
//广告主key值
@property (nonatomic, copy) NSString *app_key;
//广告主应用ID
@property (nonatomic, copy) NSString *app_id;
//广告源广告位id
@property (nonatomic, copy) NSString *tagid;
//底价
@property (nonatomic, assign) NSInteger bidfloor;
//自定义参数，json格式
@property (nonatomic, copy) NSString *ext;
//直客模板style
@property (nonatomic) NSInteger style;
//直客模板边距，默认20
@property (nonatomic) CGFloat margin;

/*  以下参数为block回调  */
//1：素材加载成功  2：素材加载失败  3：点击  4：从落地页返回  5：广告关闭 6：素材成功展示 7：激励视频获得奖励回调  8：素材渲染成功
@property (nonatomic, assign) NSInteger type;
//请求广告的错误信息
@property (nonatomic, strong) NSError *error;
//自投类点击链接
@property (nonatomic, copy) NSString *clickUrl;
//对应的广告主类
@property (nonatomic, strong) id objc;
//对应的广告主数据，Feed：原始数据数组   Template:模板view数组
@property (nonatomic, strong) NSArray *views;
//模板view
@property (nonatomic, weak) UIView *showView;

@end

