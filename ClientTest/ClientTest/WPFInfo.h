//
//  WPFInfo.h
//  ClientTest
//
//  Created by 王鹏飞 on 16/7/1.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPFInfo : NSObject

/** 信息名称 */
@property (nonatomic, copy) NSString *infoKey;

/** 信息内容 */
@property (nonatomic, copy) NSString *infoValue;

/** 遍历构造器 */
+ (instancetype)infoWithDict:(NSDictionary *)dict;

@end
