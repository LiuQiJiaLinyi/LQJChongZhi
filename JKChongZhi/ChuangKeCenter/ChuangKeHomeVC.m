//
//  ChuangKeHomeVC.m
//  JKChongZhi
//
//  Created by Jiker on 2016/7/12.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//
#import "ChargeVC.h"
#import "ChuangKeHomeVC.h"
#define kFloatMainSize [UIScreen mainScreen].bounds.size.width/320.f

@interface ChuangKeHomeVC ()<UIWebViewDelegate>
{
    UIButton * recharge;
}
@end

@implementation ChuangKeHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addRechargeBut];
    
    // Do any additional setup after loading the view.
}

-(void)addRechargeBut
{
    recharge = [[UIButton alloc] initWithFrame:CGRectMake(235 *kFloatMainSize, 188 * kFloatMainSize, 78 * kFloatMainSize, 25 * kFloatMainSize)];
    
    [recharge setBackgroundColor:[UIColor colorWithRed:1.000 green:0.671 blue:0.000 alpha:1.00]];
    [recharge setTitle:@"充值" forState:UIControlStateNormal];
    recharge.layer.masksToBounds = YES;
    recharge.layer.cornerRadius = recharge.bounds.size.width/2;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 1 });
    recharge.layer.borderColor = [UIColor whiteColor].CGColor;
  
    recharge.layer.borderWidth = 2* kFloatMainSize;
    [recharge addTarget:self action:@selector(charge) forControlEvents:UIControlEventTouchUpInside];
    
    UIWebView * backView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backView.delegate = self;
    [backView setOpaque:YES];
    [backView setScalesPageToFit:YES];
    [backView.scrollView addSubview:recharge];
    [backView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.view addSubview:backView];
    
    
}

-(void)charge
{
    NSLog(@"charge点击事件");
    ChargeVC * charge = [[ChargeVC alloc] init];
    [self.navigationController pushViewController:charge animated:YES];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"webViewDidStartLoad");
    
}

- (void)webViewDidFinishLoad:(UIWebView *)web{
    
    NSLog(@"webViewDidFinishLoad");
    
}

-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    
    NSLog(@"DidFailLoadWithError");
    
}
-(void)setWebView_string:(NSString *)webView_string
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
