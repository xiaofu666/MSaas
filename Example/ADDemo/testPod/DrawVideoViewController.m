//
//  DrawVideoViewController.m
//  TestAdA
//
//  Created by lurich on 2020/5/9.
//  Copyright © 2020 . All rights reserved.
//

#import "DrawVideoViewController.h"
#import "ADInfo.h"

@interface DrawVideoViewController () <SFDrawVideoDelegate ,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) SFDrawVideoManager *drawVideoManager;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation DrawVideoViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Draw视频流广告";
    
    self.dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 10; i ++ ) {
        NSString * title = [NSString stringWithFormat:@"Number:%d  测试数据",i];
        [self.dataSource addObject:title];
    }
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
    
    [self loadAD];
}

- (UITableView *)tableView{
    if (!_tableView ) {
        CGFloat topHeight = self.navigationController.navigationBar.bounds.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, topHeight, self.view.frame.size.width, self.view.frame.size.height - topHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = self.view.bounds.size.height - topHeight;
        _tableView.pagingEnabled = YES;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id objc = self.dataSource[indexPath.row];
    if ([objc isKindOfClass:[UIView class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
        }
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIView *view = objc;
        view.backgroundColor = UIColor.blackColor;
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

- (void)loadAD{
    [self.view endEditing:YES];
    NSLog(@"广告数据：开始请求");
    self.drawVideoManager = [SFDrawVideoManager new];
    self.drawVideoManager.mediaId = draw_video_id;
    self.drawVideoManager.size = self.tableView.bounds.size;
    self.drawVideoManager.adCount = 3;
    self.drawVideoManager.showAdController = self;
    self.drawVideoManager.delegate = self;
    [self.drawVideoManager loadAdData];
}

#pragma mark SFDrawVideoDelegate
/**
 * 广告数据：加载成功
 */
- (void)drawVideoAdDidLoadViews:(NSArray<__kindof UIView *> *)views{
    NSLog(@"广告数据：加载成功");
    NSMutableArray *dataSources = [self.dataSource mutableCopy];
    if (views.count > 0) {
        for (UIView *view in views) {
            uint32_t index = arc4random_uniform((uint32_t)self.dataSource.count);
            [dataSources insertObject:view atIndex:index];
        }
        self.dataSource = [dataSources mutableCopy];
    }
    [self.tableView reloadData];
    NSLog(@"getCurrentBaseEcpmInfo = %@",[self.drawVideoManager getCurrentBaseEcpmInfo]);
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)drawVideoAdDidFailed:(NSError *)error{
    NSLog(@"广告数据：加载失败 error = %@", error);
}
/**
 * 广告视图：展示
 */
- (void)drawVideoAdDidVisible{
    NSLog(@"广告视图：展示");
}
/**
 * 广告视图：点击
 */
- (void)drawVideoAdDidClicked{
    NSLog(@"广告视图：点击");
}
/**
 * 落地页或者appstoe返回事件
 */
- (void)drawVideoAdDidCloseOtherController{
    NSLog(@"落地页或者appstoe返回事件");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

@end
