//
//  ViewController.m
//  ClientTest
//
//  Created by 王鹏飞 on 16/7/1.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "ViewController.h"
#import "BasicViewController.h"
#import "BatteryInfoViewController.h"

@interface ViewController () 



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)hardWareInfoButtonTapped:(id)sender {
    BasicViewController *hardwareVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeHardWare];
    [self.navigationController pushViewController:hardwareVC  animated:YES];
}

- (IBAction)addressInfoButtonTapped:(id)sender {
    BasicViewController *addressVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeIpAddress];
    [self.navigationController pushViewController:addressVC  animated:YES];
}
- (IBAction)diskInfoButtonTapped:(id)sender {
    BasicViewController *dickVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeDisk];
    [self.navigationController pushViewController:dickVC  animated:YES];
}

- (IBAction)batteryInfoButtonTapped:(id)sender {
    BatteryInfoViewController *batteryVC = [[BatteryInfoViewController alloc] init];
    [self.navigationController pushViewController:batteryVC animated:YES];
    
}

@end
