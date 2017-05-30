//
//  BasicViewController.h
//  ClientTest
//
//  Created by Leon on 2017/5/18.
//  Copyright © 2017年 王鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BasicInfoType) {
    BasicInfoTypeHardWare,
    BasicInfoTypeIpAddress,
    BasicInfoTypeDisk,
};

@interface BasicViewController : UIViewController

- (instancetype)initWIthType:(BasicInfoType)type;

@end
