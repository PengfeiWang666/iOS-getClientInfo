//
//  BatteryInfoManager.h
//  ClientTest
//
//  Created by Leon on 2017/8/23.
//  Copyright © 2017年 王鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BatteryInfoDelegate
- (void)batteryStatusUpdated;
@end

@interface BatteryInfoManager : NSObject

@property (nonatomic, weak) id<BatteryInfoDelegate> delegate;

@property (nonatomic, assign) NSUInteger capacity;
@property (nonatomic, assign) CGFloat voltage;

@property (nonatomic, assign) NSUInteger levelPercent;
@property (nonatomic, assign) NSUInteger levelMAH;
@property (nonatomic, copy)   NSString *status;

+ (instancetype)sharedManager;
/** 开始监测电池电量 */
- (void)startBatteryMonitoring;
/** 停止监测电池电量 */
- (void)stopBatteryMonitoring;

@end
