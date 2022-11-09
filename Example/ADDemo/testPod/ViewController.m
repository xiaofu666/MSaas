//
//  ViewController.m
//  LunchAd
//
//  Created by Lurich on 2018/5/21.
//  Copyright © 2018年 . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSDictionary *> *dataArr;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"广告组件";
    
    self.dataArr = [NSMutableArray array];
    
    [self.dataArr addObjectsFromArray:@[
     @{@"class":@"LaunchScreenViewController",@"name":@"开屏广告（全屏样式）"},
     @{@"class":@"HalfLaunchScreenViewController",@"name":@"开屏广告（半屏样式）"},
     @{@"class":@"FeedAdViewController",@"name":@"原生信息流广告"},
     @{@"class":@"NativeExpressAdController",@"name":@"模板广告"},
     @{@"class":@"BannerViewController",@"name":@"横幅广告"},
     @{@"class":@"InterstitialViewController",@"name":@"插屏广告"},
     @{@"class":@"MotivationVideoViewController",@"name":@"激励视频"},
     @{@"class":@"FullscreenVideoViewController",@"name":@"全屏视频"},
     @{@"class":@"PasterVideoViewController",@"name":@"视频贴片"},
     @{@"class":@"IDFAViewController",@"name":@"查看IDFA"}
    ]];
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.rowHeight = 60;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

static NSString * cellID = @"CELL";

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row][@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *classStr = self.dataArr[indexPath.row][@"class"];
    [self.navigationController pushViewController:[NSClassFromString(classStr) new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
}

@end
