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
    [self _pushVCWithType:BasicInfoTypeHardWare sender:sender];
}

- (IBAction)batteryInfoButtonTapped:(id)sender {
    [self _pushVCWithType:BasicInfoTypeBattery sender:sender];
}

- (IBAction)addressInfoButtonTapped:(id)sender {
    [self _pushVCWithType:BasicInfoTypeIpAddress sender:sender];
}

- (IBAction)CPUInfoButtonTapped:(id)sender {
    [self _pushVCWithType:BasicInfoTypeCPU sender:sender];
}

- (IBAction)diskInfoButtonTapped:(id)sender {
    [self _pushVCWithType:BasicInfoTypeDisk sender:sender];
}

- (void)_pushVCWithType:(BasicInfoType)type sender:(UIButton *)sender {
    BasicViewController *basicVC = [[BasicViewController alloc] initWithType:type];
    basicVC.navigationItem.title = sender.titleLabel.text;
    [self.navigationController pushViewController:basicVC  animated:YES];
}

@end
