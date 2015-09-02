//
//  NSObject+Extension.m
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)
#pragma mark - /****************** 创建有属性值的对象 ******************/
+ (instancetype)objcWithDict: (NSDictionary *)dict {
    
    id objc = [[self alloc] init];
    
    NSArray *properties = [self propertiesArr];
    
    for (int i = 0; i< properties.count; i++) {
        
        if (dict[properties[i]] != nil) {
            
            [objc setValue:dict[properties[i]] forKeyPath:properties[i]];
        }
    }
    
    return objc;
}

#pragma mark - /****************** 动态获取属性列表 ******************/
// 动态加载类的属性的key值
const void *kPropertyKey = @"kPropertyKey";
+ (NSArray *)propertiesArr {
    
    NSArray *properties = objc_getAssociatedObject(self, kPropertyKey);
    if (properties != nil) {
        
        return properties;
    }
    
    // 动态获取属性列表
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i< count; i++) {
        
        // 从list拿到元素
        objc_property_t property = list[i];
        
        // 属性名称
        const char *name = property_getName(property);
        
        // 将属性名称添加到数组中
        [arrM addObject:[NSString stringWithUTF8String:name]];
    }
    // 释放对象
    free(list);
    
    // 通过运行时机制创建属性
    objc_setAssociatedObject(self, kPropertyKey, arrM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return properties;
}

@end
