//
//  ChargeVC.m
//  JKChongZhi
//
//  Created by Jiker on 2016/7/13.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "ChargeVC.h"
#define kFloatMainSize [UIScreen mainScreen].bounds.size.width/320.f

@interface ChargeVC ()
{
    UITextField * customMoney;
}
@end

@implementation ChargeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    // Do any additional setup after loading the view.
}

-(void)buildUI
{
    UILabel * money =[[UILabel alloc] initWithFrame:CGRectMake(18 * kFloatMainSize, 20 * kFloatMainSize, 117 * kFloatMainSize, 15 * kFloatMainSize)];
    money.text =@"请输入充值金额：";
    [money setTextColor:[UIColor colorWithRed:0.502 green:0.502 blue:0.502 alpha:1.00]];
    [self.view addSubview:money];
    
    customMoney = [[UITextField alloc] initWithFrame:CGRectMake(24 * kFloatMainSize, 54 * kFloatMainSize, 255 * kFloatMainSize, 38 * kFloatMainSize)];
    customMoney.keyboardType =UIKeyboardTypeNumbersAndPunctuation;
    [customMoney setTextColor:[UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.00]];
    customMoney.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:customMoney];
    
    
    UILabel* customMoneyTail = [[UILabel alloc] initWithFrame:CGRectMake(279 * kFloatMainSize, 64 * kFloatMainSize, 19 * kFloatMainSize, 19 * kFloatMainSize)];
    
    customMoneyTail.text = @"元";
    [customMoneyTail setTextColor:[UIColor blackColor]];
    [self.view addSubview:customMoney];
    
    UILabel * fastlabel =[[UILabel alloc] initWithFrame:CGRectMake(20 * kFloatMainSize, 142 * kFloatMainSize, 73 * kFloatMainSize, 15 * kFloatMainSize)];
    fastlabel.text = @"快捷支付：";
    [self.view addSubview:fastlabel];
    
    [self addMoenyButton];
}

-(void)addMoenyButton
{
    for (int i = 0; i<4; i++) {
        UIButton * moneyCount = [[UIButton alloc] initWithFrame:CGRectMake(20 *kFloatMainSize + (73 * kFloatMainSize)*i, 173 * kFloatMainSize, 73 * kFloatMainSize, 29 * kFloatMainSize)];
        NSArray * butstr_arr = @[@"50元",@"100元",@"200元",@"500元"];
        [moneyCount setTitle:butstr_arr[i] forState:UIControlStateNormal];
        [moneyCount setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [moneyCount setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [moneyCount setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        moneyCount.tag = 5142+i;
        
        [moneyCount addTarget:self action:@selector(moneycountConfirm:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

-(void)moneycountConfirm:(UIButton * )but
{
    switch (but.tag) {
        case 5142:
        {
            NSLog(@"50");
        }
            break;
        case 5143:
        {
            NSLog(@"100");
        }
            break;
        case 5144:
        {
            NSLog(@"200");
        }
            break;
        case 5145:
        {NSLog(@"500");
            
        }
            break;
            
            
        default:
            break;
    }
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
