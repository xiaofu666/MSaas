//
//  FeedAdViewController.m
//  LunchAd
//
//  Created by shuai on 2018/10/14.
//  Copyright © 2018年 . All rights reserved.
//

#import "FeedAdViewController.h"
#import "ADInfo.h"

@interface FeedAdViewController () <SFFeedDelegate ,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) SFFeedManager *feedManager;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation FeedAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"原生自渲染广告";
    
    self.dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 20; i ++ ) {
        NSString * title = [NSString stringWithFormat:@"Number:%d  测试数据",i];
        [self.dataSource addObject:title];
    }
    [self.view addSubview:self.tableView];
    
    self.feedManager = [[SFFeedManager alloc] init];
    self.feedManager.mediaId = feed_id;
    self.feedManager.adCount = 3;
    self.feedManager.showAdController = self;
    self.feedManager.delegate = self;
    [self.feedManager loadAdData];
    
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerNib:[UINib nibWithNibName:@"ADTableViewCell" bundle:nil] forCellReuseIdentifier:@"ADTableViewCellID"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataSource[indexPath.row];
    if ([model isKindOfClass:[SFFeedAdData class]]) {
        SFFeedAdData *adData = model;
        ADTableViewCell *adcell = [tableView dequeueReusableCellWithIdentifier:@"ADTableViewCellID" forIndexPath:indexPath];
        adcell.adContentLabel.text = adData.adContent;
        adcell.adTitleLabel.text = adData.adTitle;
        [adcell.infoBtn setTitle:adData.buttonText?:@"查看详情" forState:UIControlStateNormal];
        [self.feedManager registerAdViewForBindImage:adcell.adImageView adData:adData clickableViews:@[adcell.adContentLabel,adcell.adImageView,adcell.adTitleLabel,adcell.infoBtn]];
        return adcell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
        }
        cell.textLabel.text = model;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataSource[indexPath.row];
    if ([model isKindOfClass:[SFFeedAdData class]]) {
        return 270;
    }else{
        return 80;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark FeedAd delegate
/**
 * 广告数据：加载成功
 */
- (void)feedAdDidLoadDatas:(NSArray<__kindof SFFeedAdData *> *)datas{
    NSLog(@"原生信息流广告：加载成功");
    NSMutableArray *dataSources = [self.dataSource mutableCopy];
    if (datas.count > 0) {
        for (SFFeedAdData *adData in datas) {
            uint32_t index = arc4random_uniform((uint32_t)self.dataSource.count);
            [dataSources insertObject:adData atIndex:index];
        }
        self.dataSource = [dataSources mutableCopy];
        [self.tableView reloadData];
    }
}
/**
 * 广告数据：加载失败
 * @param error : 错误信息
 */
- (void)feedAdDidFailed:(NSError *)error{
    NSLog(@"原生信息流广告：加载失败 error = %@",error);
}
/**
 * 广告视图：点击
 */
- (void)feedAdDidClicked{
    NSLog(@"原生信息流广告：点击");
}
/**
 * 落地页或者appstoe返回事件
 */
- (void)feedAdDidCloseOtherController{
    NSLog(@"原生信息流广告：落地页或者appstoe返回事件");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
