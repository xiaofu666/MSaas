//
//  UIImageView+SFAdd.h
//  MSaasAdapter
//
//  Created by Lurich on 2023/4/21.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SFAdd)

- (void)adaptDisplayImage:(UIImage *)img;

- (void)setImageWithUrl:(NSString *)imgUrl;

- (void)showImageWithUrl:(NSString *)imgUrl;

- (void)showImageWithUrl:(NSString *)imgUrl successBlock:(void(^)(UIImage *img))successBlock failBlock:(void(^)(NSError *error))faiBlock;

- (void)showImageWithUrl:(NSString *)imgUrl Show:(BOOL)isShow successBlock:(void(^)(UIImage *img))successBlock failBlock:(void(^)(NSError *error))failBlock;

@end
