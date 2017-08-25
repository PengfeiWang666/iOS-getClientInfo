//
//  DeviceDataLibrery.h
//  ClientTest
//
//  Created by Leon on 2017/8/24.
//  Copyright © 2017年 王鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceDataLibrery : NSObject

+ (instancetype)sharedLibrery;
- (const NSString *)getDiviceName;

@end
