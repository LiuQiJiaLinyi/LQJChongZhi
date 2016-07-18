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
    UIWebView *web;
}
@end

@implementation ChuangKeHomeVC

- (void)loadView{
    web = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = web;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addRechargeBut];
    
}

-(void)addRechargeBut
{
    recharge = [[UIButton alloc] initWithFrame:CGRectMake(235 *kFloatMainSize, 188 * kFloatMainSize, 78 * kFloatMainSize, 25 * kFloatMainSize)];
    
    [recharge setBackgroundColor:[UIColor colorWithRed:1.000 green:0.671 blue:0.000 alpha:1.00]];
    [recharge setTitle:@"充值" forState:UIControlStateNormal];
    recharge.layer.masksToBounds = YES;
    recharge.layer.cornerRadius = 5;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    
    recharge.layer.borderColor = colorref;
  
    recharge.layer.borderWidth = 2* kFloatMainSize;
    [recharge addTarget:self action:@selector(charge) forControlEvents:UIControlEventTouchUpInside];
    
    web.delegate = self;
    [web setOpaque:YES];
    [web setScalesPageToFit:YES];
    [web.scrollView addSubview:recharge];
    
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://baidu.com/"]]];
   
    
    
}

-(void)charge
{

    ChargeVC * charge = [[ChargeVC alloc] init];
    [self.navigationController pushViewController:charge animated:YES];
    
}

#pragma mark-
#pragma mark ––––webview代理方法–––––
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
    _webView_string = webView_string;
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
