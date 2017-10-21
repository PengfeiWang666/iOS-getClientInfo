//
//  ViewController.m
//  ClientTest
//
//  Created by 王鹏飞 on 16/7/1.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "ViewController.h"
#import "BasicViewController.h"

@interface ViewController () 



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Event Response
- (IBAction)hardWareInfoButtonTapped:(id)sender {
    BasicViewController *hardwareVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeHardWare];
    [self.navigationController pushViewController:hardwareVC  animated:YES];
}

- (IBAction)batteryInfoButtonTapped:(id)sender {
    BasicViewController *batteryVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeBattery];
    [self.navigationController pushViewController:batteryVC  animated:YES];
}

- (IBAction)addressInfoButtonTapped:(id)sender {
    BasicViewController *addressVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeIpAddress];
    [self.navigationController pushViewController:addressVC  animated:YES];
}

- (IBAction)CPUInfoButtonTapped:(id)sender {
    BasicViewController *dickVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeCPU];
    [self.navigationController pushViewController:dickVC  animated:YES];
}

- (IBAction)diskInfoButtonTapped:(id)sender {
    BasicViewController *dickVC = [[BasicViewController alloc] initWIthType:BasicInfoTypeDisk];
    [self.navigationController pushViewController:dickVC  animated:YES];
}

@end
