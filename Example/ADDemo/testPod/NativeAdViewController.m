
//
//  NativeAdViewController.m
//  TestAdA
//
//  Created by lurich on 2019/8/26.
//  Copyright © 2019 . All rights reserved.
//

#import "NativeAdViewController.h"
#import "ADInfo.h"
#import "NativeAdTableViewCell.h"

@interface NativeAdViewController ()<UITableViewDelegate,UITableViewDataSource,SFNativeDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation NativeAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"信息流混出广告";
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        NSString *title = [NSString stringWithFormat:@"Number:%d  点击插入广告",i];
        [self.dataArray addObject:title];
    }
    [self.view addSubview:self.tableView];
    [self insertAdView:0];
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
    if ([objc isKindOfClass:[NativeAdTableViewCell class]]) {
        NativeAdTableViewCell *cell = (NativeAdTableViewCell *)objc;
        [cell registerAdView];
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
    if ([objc isKindOfClass:[NativeAdTableViewCell class]]) {
        NativeAdTableViewCell *cell = (NativeAdTableViewCell *)objc;
        // 按照图片 宽：高 = 16:9适配
        return cell.cellHeight;
    }else{
        return 80;
    }
}

- (void)insertAdView:(NSInteger)index{
    [self.view endEditing:YES];
    [self.dataArray insertObject:[self adTableViewCell] atIndex:index];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"tableView cell 被点击");
    [self insertAdView:indexPath.row];
}

//当为模板广告时有以下回调
- (NativeAdTableViewCell *)adTableViewCell{
    NativeAdTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"NativeAdTableViewCell" owner:nil options:nil] firstObject];
    cell.showAdController = self;
    __weak typeof(self) weakSelf= self;
    __weak typeof(cell) weakCell= cell;
    cell.successBlock = ^(NSInteger type) {
        switch (type) {
            case 1:
                {
                    //广告加载成功
                    [weakSelf.tableView reloadData];
                }
                break;
            case 2:
                {
                    //广告渲染成功
                    [weakSelf.tableView reloadData];
                }
                break;
            case 3:
                {
                    //广告关闭
                    [weakSelf.dataArray removeObject:weakCell];
                    [weakSelf.tableView reloadData];
                }
                break;
                
            default:
                break;
        }
    };
    cell.placeId = natives_id;
    [cell loadAD];
    return cell;
}
- (void)dealloc{
    NSLog(@"%s",__func__);
    for (id objc in self.dataArray) {
        if ([objc isKindOfClass:[NativeAdTableViewCell class]]) {
            NativeAdTableViewCell *cell = (NativeAdTableViewCell *)objc;
            [cell deallocAllFeedProperty];
        }
    }
}

@end
