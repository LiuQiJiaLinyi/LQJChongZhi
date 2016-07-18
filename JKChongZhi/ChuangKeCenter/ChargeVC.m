//
//  ChargeVC.m
//  JKChongZhi
//
//  Created by Jiker on 2016/7/13.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "ChargeVC.h"
#import "AlipayHeader.h"
#define kFloatMainSize [UIScreen mainScreen].bounds.size.width/320.f
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kFloatSize [UIScreen mainScreen].bounds.size.width/320.f
#define kFloatHeight [UIScreen mainScreen].bounds.size.height/568.0f
#define UserDefaults [NSUserDefaults standardUserDefaults]

@interface ChargeVC ()
{
    UITextField * customMoney;
    NSMutableArray * butArray;
}
@end

@implementation ChargeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    butArray =[[NSMutableArray alloc] init];
    [self setNav];
    
    self.navigationController.navigationBar.topItem.title = @"充值";
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildUI];
    // Do any additional setup after loading the view.
}

-(void)buildUI
{
    UILabel * money =[[UILabel alloc] initWithFrame:CGRectMake(18 * kFloatMainSize, 20 * kFloatMainSize, 117 * kFloatMainSize, 15 * kFloatMainSize)];
    money.text =@"请输入充值金额：";
    [money setTextColor:[UIColor colorWithRed:0.5 green:0.502 blue:0.502 alpha:1.00]];
    [self.view addSubview:money];
    
    customMoney = [[UITextField alloc] initWithFrame:CGRectMake(24 * kFloatMainSize, 54 * kFloatMainSize, 255 * kFloatMainSize, 38 * kFloatMainSize)];
    customMoney.keyboardType =UIKeyboardTypeNumbersAndPunctuation;
    [customMoney setTextColor:[UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.00]];
    customMoney.placeholder = @"100";
    customMoney.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:customMoney];
    
    
    UILabel* customMoneyTail = [[UILabel alloc] initWithFrame:CGRectMake(279 * kFloatMainSize, 64 * kFloatMainSize, 19 * kFloatMainSize, 19 * kFloatMainSize)];
    
    customMoneyTail.text = @"元";
    [customMoneyTail setTextColor:[UIColor blackColor]];
    [self.view addSubview:customMoneyTail];
    
    UILabel * fastlabel =[[UILabel alloc] initWithFrame:CGRectMake(20 * kFloatMainSize, 142 * kFloatMainSize, 73 * kFloatMainSize, 15 * kFloatMainSize)];
    fastlabel.text = @"快捷支付：";
    [self.view addSubview:fastlabel];
   
    [self addMoenyButton];
    
    [self addPayWay];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    
}

-(void)addPayWay
{
    NSArray * but_str = @[@"微信支付",@"支付宝支付"];
    for (int i =0 ; i <2; i++) {
        UIButton * but = [[UIButton alloc] initWithFrame:CGRectMake(14 *kFloatMainSize, 282 * kFloatMainSize + (47 * i *kFloatMainSize) , 296 * kFloatMainSize, 36 * kFloatMainSize)];
        
        [but setBackgroundColor:[UIColor colorWithRed:(0.933- i*0.05) green:0.294 blue:0.490 alpha:1.00]];
        but.tag = 1106 +i;
        but.layer.masksToBounds = YES;
        but.layer.cornerRadius =18 *kFloatMainSize;
        
        [but addTarget:self  action:@selector(payWaychoosen:) forControlEvents:UIControlEventTouchUpInside];
        
        [but setTitle:but_str[i] forState:UIControlStateNormal];
        [self.view addSubview:but];
    }

}

-(void)addMoenyButton
{
    for (int i = 0; i<4; i++) {
        UIButton * moneyCount = [[UIButton alloc] initWithFrame:CGRectMake(20 *kFloatMainSize + (73 * kFloatMainSize)*i, 173 * kFloatMainSize, 73 * kFloatMainSize, 29 * kFloatMainSize)];
        NSArray * butstr_arr = @[@"50元",@"100元",@"200元",@"500元"];
        [moneyCount setTitle:butstr_arr[i] forState:UIControlStateNormal];
        [moneyCount setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [moneyCount setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [moneyCount setBackgroundImage:[UIImage imageNamed:@"but_selected.tiff"] forState:UIControlStateSelected];
        moneyCount.tag = 5142+i;
        
        if (moneyCount.tag ==5143) {
            moneyCount.selected = YES;
        }
        [butArray addObject:moneyCount];
        [moneyCount addTarget:self action:@selector(moneycountConfirm:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:moneyCount];
    }
    
}

-(void)payWaychoosen:(UIButton *)button
{

    switch (button.tag) {
        case 1106:
        {
            //微信
            NSLog(@"微信支付");
        
        }
            break;
        case 1107:
        {
            //支付宝
             NSLog(@"支付宝支付");
            [AlipayRequestConfig alipayWithPartner:kPartnerID seller:kSellerAccount tradeNO:[AlipayToolKit genTradeNoWithTime] productName:@"邮票" productDescription:@"全真邮票" amount:@"0.8" notifyURL:kNotifyURL itBPay:@"30m"];
        }
            break;
      
            
            
        default:
            break;
    }
}

-(void)setNav
{
    self.navigationItem.title = @"充 值";
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
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)moneycountConfirm:(UIButton * )but
{
    switch (but.tag) {
        case 5142:
        {
            
            but.selected = YES;
            
            for (UIButton * buttt in butArray) {
                if (buttt.tag != 5142) {
                    buttt.selected = NO;
                }
            }
            
            [customMoney setText:@"50"];
            
        }
            break;
        case 5143:
        {
            
            but.selected = YES;
            for (UIButton * buttt in butArray) {
                if (buttt.tag != 5143) {
                    buttt.selected = NO;
                }
            }
            [customMoney setText:@"100"];
        }
            break;
        case 5144:
        {
           
            but.selected = YES;
            
            for (UIButton * buttt in butArray) {
                if (buttt.tag != 5144) {
                    buttt.selected = NO;
                }
            }
            
            [customMoney setText:@"200"];
        }
            break;
        case 5145:
        {
            
            but.selected = YES;
            
            for (UIButton * buttt in butArray) {
                if (buttt.tag != 5145) {
                    buttt.selected = NO;
                }
            }
            
            [customMoney setText:@"500"];
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
