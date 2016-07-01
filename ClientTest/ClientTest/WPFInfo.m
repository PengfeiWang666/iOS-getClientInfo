//
//  WPFInfo.m
//  ClientTest
//
//  Created by 王鹏飞 on 16/7/1.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "WPFInfo.h"

@implementation WPFInfo

+ (instancetype)infoWithDict:(NSDictionary *)dict {
    
    WPFInfo *info = [[WPFInfo alloc] init];
    [info setValuesForKeysWithDictionary:dict];
    return info;
}

@end
