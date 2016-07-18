//
//  ChargeFailVC.m
//  JKChongZhi
//
//  Created by Jiker on 2016/7/13.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "ChargeFailVC.h"
#define kFloatMainSize [UIScreen mainScreen].bounds.size.width/320.f
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kFloatSize [UIScreen mainScreen].bounds.size.width/320.f
#define kFloatHeight [UIScreen mainScreen].bounds.size.height/568.0f
#define UserDefaults [NSUserDefaults standardUserDefaults]

@interface ChargeFailVC ()
{
    UILabel * failMoney;
}
@end

@implementation ChargeFailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)backTheChuangKe:(UIButton * )buttom
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)setStr_failMoney:(NSString *)str_failMoney
{
    _str_failMoney = str_failMoney;
}

-(void)setNav
{
    self.navigationItem.title = @"充值失败";
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:233.0/255.0 green:46.0/255.0 blue:106.0/255.0 alpha:1.0];
    
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftbtn addTarget:self action:@selector(backToMessageVC) forControlEvents:UIControlEventTouchUpInside];
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"nav_bar_left_new.png"] forState:UIControlStateNormal];
    [leftbtn setFrame:CGRectMake( 0, 0, 12*kFloatSize, 17*kFloatSize)];
    UIBarButtonItem *leftItem  =[[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)backToMessageVC
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
