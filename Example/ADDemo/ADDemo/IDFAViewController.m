//
//  IDFAViewController.m
//  ADDemo
//
//  Created by lurich on 2021/11/9.
//

#import "IDFAViewController.h"
#import <AdSupport/ASIdentifierManager.h>

@interface IDFAViewController ()

@end

@implementation IDFAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"获取IDFA";
    
    UIButton *launchScreenBtn2 = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, [UIScreen mainScreen].bounds.size.width - 100, 40)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"获取IDFA" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(getIDFACode) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self.view addSubview:launchScreenBtn2];
}

- (void)getIDFACode{
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString *idfaCopyedMsg = [NSString stringWithFormat:@"%@\n 已经复制到你的粘贴板",idfa];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:idfaCopyedMsg preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK");
    }]];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = idfa;
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end

