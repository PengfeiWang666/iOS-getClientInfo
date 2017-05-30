//
//  DeviceInfoManager.h
//  ClientTest
//
//  Created by Leon on 2017/5/18.
//  Copyright © 2017年 王鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfoManager : NSObject

/** 能否打电话 */
@property (nonatomic, assign, readonly) BOOL canMakePhoneCall NS_EXTENSION_UNAVAILABLE_IOS("");

+ (instancetype)sharedManager;

/** 获取ip */
- (NSString *)getDeviceIPAddresses;

- (NSString *)getIpAddressWIFI;
- (NSString *)getIpAddressCell;
/** 获取设备型号 */
- (NSString *)getDeviceName;
/** 获取mac地址 */
- (NSString *)getMacAddress;
/** 获取广告标识符 */
- (NSString *)getIDFA;
- (NSString *)getDeviceModel;

/** 获取CPU数量 */
- (NSUInteger)getCPUCount;
/** 获取CPU总的使用百分比 */
- (float)getCPUUsage;
/** 获取单个CPU使用百分比 */
- (NSArray *)getPerCPUUsage;

/** 获取磁盘总空间 */
- (int64_t)getTotalDiskSpace;
/** 获取未使用的磁盘空间 */
- (int64_t)getFreeDiskSpace;
/** 获取已使用的磁盘空间 */
- (int64_t)getUsedDiskSpace;

@end
