//
//  UIImageView+SFAdd.h
//  MSaasAdapter
//
//  Created by Lurich on 2023/4/21.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SFAdd)

/// SDK 优化式展示图片
- (void)adaptDisplayImage:(UIImage *)img;

/// 直接展示图片
- (void)setImageWithUrl:(NSString *)imgUrl;

/// SDK 优化式展示图片
/// - Parameter imgUrl: 图片 url
- (void)showImageWithUrl:(NSString *)imgUrl;

/// SDK 优化式展示图片
/// - Parameters:
///   - imgUrl: 图片 url
///   - successBlock: 成功回调，返回图片
///   - faiBlock: 失败回调，返回错误
- (void)showImageWithUrl:(NSString *)imgUrl successBlock:(void(^)(UIImage *img))successBlock failBlock:(void(^)(NSError *error))faiBlock;

/// SDK 优化式展示图片
/// - Parameters:
///   - imgUrl: 图片 url
///   - isShow: 是否用 SDK 展示广告：YES-展示；NO-不展示
///   - successBlock: 成功回调，返回图片
///   - failBlock: 失败回调，返回错误
- (void)showImageWithUrl:(NSString *)imgUrl Show:(BOOL)isShow successBlock:(void(^)(UIImage *img))successBlock failBlock:(void(^)(NSError *error))failBlock;

@end
