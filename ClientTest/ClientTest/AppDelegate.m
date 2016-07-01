//
//  AppDelegate.m
//  ClientTest
//
//  Created by 王鹏飞 on 16/7/1.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "AppDelegate.h"
#import "NSData+CRC32.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // 获取各种数据
    NSMutableData *sendData = [[NSMutableData alloc] initWithData:deviceToken];
    int32_t checksum = [deviceToken crc32];
    int32_t swapped = CFSwapInt32LittleToHost(checksum);
    char *a = (char*) &swapped;
    [sendData appendBytes:a length:sizeof(4)];
    
    //检验
    //    Byte *b1 = (Byte *)[sendData bytes];
    //    for (int i = 0; i < sendData.length; i++) {
    //        NSLog(@"b1[%d] == %d",i,b1[i]);
    //    }
    NSString *device_token_crc32 = [sendData base64EncodedStringWithOptions:0];
    //    NSLog(@"b1:%@",[sendData base64EncodedStringWithOptions:0]);
    //保存获取到的数据
    NSString *device_token = [NSString stringWithFormat:@"%@",deviceToken];
    [[NSUserDefaults standardUserDefaults]setObject:device_token forKey:@"device_token"];
    [[NSUserDefaults standardUserDefaults]setObject:device_token_crc32 forKey:@"device_token_crc32"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //    NSLog(@"deviceToken---------------》%@", deviceToken);
    //    NSLog(@"device_token--------------》%@", device_token);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
