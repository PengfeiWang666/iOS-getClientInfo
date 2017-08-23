//
//  NetWorkInfoManager.h
//  ClientTest
//
//  Created by Leon on 2017/8/23.
//  Copyright © 2017年 王鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkInfoManager : NSObject


+ (instancetype)sharedManager;

/** 获取ip */
- (NSString *)getDeviceIPAddresses;

- (NSString *)getIpAddressWIFI;
- (NSString *)getIpAddressCell;

@end
