
//
//  NativeExpressAdController.m
//  TestAdA
//
//  Created by lurich on 2019/8/26.
//  Copyright © 2019 . All rights reserved.
//

#import "NativeExpressAdController.h"
#import "ADInfo.h"

@interface NativeExpressAdController ()<UITableViewDelegate,UITableViewDataSource,SFTemplateDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) SFTemplateManager *manager;

@end

@implementation NativeExpressAdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"模板广告";
    // Do any additional setup after loading the view.
    
    self.dataArray = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        [self.dataArray addObject:@"测试数据"];
    }
    [self.view addSubview:self.tableView];
    
    self.manager = [[SFTemplateManager alloc] init];
    self.manager.mediaId = template_id;
    self.manager.adCount = 3;
    self.manager.size = CGSizeMake(SF_ScreenW, 0);
    self.manager.showAdController = self;
    self.manager.delegate = self;
    [self.manager loadAdData];
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id objc = self.dataArray[indexPath.row];
    if ([objc isKindOfClass:[UIView class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
        }
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIView *view = objc;
        [cell.contentView addSubview:view];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCellID"];
        }
        cell.textLabel.text = objc;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id objc = self.dataArray[indexPath.row];
    if ([objc isKindOfClass:[UIView class]]) {
        UIView *view = objc;
        return view.bounds.size.height;
    }else{
        return 80;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"tableView cell 被点击");
}

/**
 * 广告数据：加载成功
 */
- (void)templateAdDidLoadViews:(NSArray<__kindof UIView *> *)views{
    NSLog(@"模板广告：加载成功");
    NSMutableArray *dataSources = [self.dataArray mutableCopy];
    if (views.count > 0) {
        for (UIView *view in views) {
            uint32_t index = arc4random_uniform((uint32_t)self.dataArray.count);
            [dataSources insertObject:view atIndex:index];
        }
        self.dataArray = [dataSources mutableCopy];
    }
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)templateAdDidFailed:(NSError *)error{
    NSLog(@"模板广告：加载失败 error = %@",error);
}
/**
 * 广告视图：点击
 */
- (void)templateAdDidClickedWithADView:(UIView *)templateAdView{
    NSLog(@"模板广告：点击");
}
/**
 * 广告视图：渲染成功
 */
- (void)templateAdDidRenderSuccessWithADView:(UIView *)templateAdView{
    NSLog(@"模板广告：渲染成功,此时view的高度已自适应");
    [self.tableView reloadData];
}
/**
 * 落地页或者appstoe返回事件
 */
- (void)templateAdDidCloseOtherControllerWithADView:(UIView *)templateAdView{
    NSLog(@"模板广告：落地页或者appstoe返回事件");
}
/**
 * 广告视图：关闭
 */
- (void)templateAdDidCloseWithADView:(UIView *)templateAdView{
    NSLog(@"广告被关闭");
    //此处处理关闭逻辑，信息流中删除对应广告
    [self.dataArray removeObject:templateAdView];
    [self.tableView reloadData];
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

@end
