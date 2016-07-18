//
//  ChagerSusseccVC.m
//  JKChongZhi
//
//  Created by Jiker on 2016/7/13.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "ChagerSusseccVC.h"
#define FONTSIZE [UIScreen mainScreen].bounds.size.width*(15.f/400.f)


@interface ChagerSusseccVC ()
{
    UILabel * payMoney;
}
@end

@implementation ChagerSusseccVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    // Do any additional setup after loading the view.
}

-(void)buildUI
{
    UIImageView * coinImageview = [[UIImageView alloc] initWithFrame:CGRectMake(114 * kFloatMainSize, 77 * kFloatMainSize, 92*kFloatMainSize, 92*kFloatMainSize)];
    coinImageview.image = [UIImage imageNamed:@"pay_su"];
    coinImageview.layer.masksToBounds = YES;
    coinImageview.layer.cornerRadius = 46 * kFloatMainSize;
    
    [self.view addSubview:coinImageview];
    
    
    NSString * money =[NSString stringWithFormat:@"¥ %@",_str_Paymoney];
    payMoney =[[UILabel alloc] initWithFrame:CGRectMake(97 * kFloatMainSize, 182 * kFloatMainSize, 125 * kFloatMainSize, 29 * kFloatMainSize)];
    [payMoney setTextColor:[UIColor colorWithRed:0.929 green:0.173 blue:0.451 alpha:1.00]];
    [payMoney setFont:[UIFont boldSystemFontOfSize:15 * FONTSIZE]];
    [payMoney setText:money];
    [self.view addSubview:payMoney];
    
    UILabel * sussecc = [[UILabel alloc] initWithFrame:CGRectMake(79 * kFloatMainSize, 233 * kFloatMainSize, 166 * kFloatMainSize, 22 *kFloatMainSize)];
    [sussecc setTextColor:[UIColor colorWithRed:0.549 green:0.549 blue:0.549 alpha:1.00]];
    [sussecc setFont:[UIFont boldSystemFontOfSize:15 * FONTSIZE]];
    [sussecc setText:@"恭喜您，充值成功"];
    [self.view addSubview:sussecc];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(13 * kFloatMainSize, 293 * kFloatMainSize, 296 * kFloatMainSize, 36 * kFloatMainSize)];
    
    button.backgroundColor = [UIColor colorWithRed:0.933 green:0.294 blue:0.490 alpha:1.00];
    button.layer.cornerRadius = 18* kFloatMainSize;
    [button addTarget:self action:@selector(backTheChuangKe:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"返回创客中心" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
}

-(void)backTheChuangKe:(UIButton * )buttom
{
    [self.navigationController popToRootViewControllerAnimated:YES];

}
-(void)setStr_Paymoney:(NSString *)str_Paymoney
{
    _str_Paymoney = str_Paymoney;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
