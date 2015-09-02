//
//  NSObject+Extension.h
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
/**
 *  创建对象
 */
+ (instancetype)objcWithDict: (NSDictionary *)dict;
/**
 *  类的属性列表
 */
+ (NSArray *)propertiesArr;
@end
