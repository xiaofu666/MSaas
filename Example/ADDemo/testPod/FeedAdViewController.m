//
//  FeedAdViewController.m
//  LunchAd
//
//  Created by shuai on 2018/10/14.
//  Copyright © 2018年 . All rights reserved.
//

#import "FeedAdViewController.h"
#import "ADTableViewCell.h"

@interface FeedAdViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation FeedAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"原生自渲染广告";
    
    self.dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 10; i ++ ) {
        NSString *title = [NSString stringWithFormat:@"Number:%d  点击插入广告",i];
        [self.dataSource addObject:title];
    }
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
    NSLog(@"开始广告请求");
    [self insertAdView:0];
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
    if ([model isKindOfClass:[ADTableViewCell class]]) {
        ADTableViewCell *cell = (ADTableViewCell *)model;
        [cell registerAdView];
        return cell;
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
    if ([model isKindOfClass:[ADTableViewCell class]]) {
        // 按照图片 宽:高 = 16:9适配
        return 90 + (UIScreen.mainScreen.bounds.size.width - 30) * 9 / 16;
    }else{
        return 80;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id model = self.dataSource[indexPath.row];
    if (![model isKindOfClass:[ADTableViewCell class]]) {
        NSLog(@"tableView cell 被点击");
        [self insertAdView:indexPath.row];
    }
}

- (void)insertAdView:(NSInteger)index{
    [self.dataSource insertObject:[self adTableViewCell] atIndex:index];
}

- (ADTableViewCell *)adTableViewCell{
    ADTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ADTableViewCell" owner:nil options:nil] firstObject];
    cell.showAdController = self;
    __weak typeof(self) weakSelf= self;
    cell.successBlock = ^{
        [weakSelf.tableView reloadData];
    };
    return cell;
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
