//
//  singleTon.h
//  11-单例对象
//
//  Created by 逗叔 on 15/8/13.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#ifndef _1______singleton_h
#define _1______singleton_h

#define singletonInterface(className) + (instancetype)shared##className;

#if __has_feature(objc_arc)

#define singletonImplementation(className) \
static id instance; \
+ (instancetype)shared##className {\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        instance = [[self alloc] init];\
    });\
    return instance;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        instance = [super allocWithZone:zone];\
    });\
    return instance;\
}\
- (id)copyWithZone:(NSZone *)zone {\
    return instance;\
}

#else

#define singletonImplementation(className) \
static id instance; \
+ (instancetype)shared##className {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [[self alloc] init];\
});\
return instance;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
- (id)copyWithZone:(NSZone *)zone {\
return instance;\
}\
- (instancetype)retain {return instance;}\
- (oneway void)release {}\
- (NSUInteger)retainCount {return ULONG_MAX;}\
- (instancetype)autorelease {return instance;}

#endif


#endif
