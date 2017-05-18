//
//  DeviceInfoManager.h
//  ClientTest
//
//  Created by Leon on 2017/5/18.
//  Copyright © 2017年 王鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfoManager : NSObject

+ (instancetype)sharedManager;

/** 获取ip */
- (NSString *)getDeviceIPAddresses;
- (NSString *)getDeviceName;
- (NSString *)getMacAddress;
- (NSString *)getIDFA;
- (NSString *)getDeviceModel;

@end
