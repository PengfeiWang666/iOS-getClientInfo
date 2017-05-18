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

- (IBAction)basicInfoButtonTapped:(id)sender {
    BasicViewController *basicVC = [[BasicViewController alloc] init];
    [self.navigationController pushViewController:basicVC  animated:YES];
}

- (IBAction)batteryInfoButtonTapped:(id)sender {
    BatteryInfoViewController *batteryVC = [[BatteryInfoViewController alloc] init];
    [self.navigationController pushViewController:batteryVC animated:YES];
    
}

@end
