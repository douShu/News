//
//  News.h
//  News
//
//  Created by 逗叔 on 15/9/2.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extension.h"

@interface News : NSObject

/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  跟贴数量
 */
@property (nonatomic, assign) int replyCount;
/**
 *  配图地址
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  多图数组(两张)
 */
@property (nonatomic, strong) NSArray *imgextra;
/**
 *  是否大图标记
 */
@property (nonatomic, assign, getter=isBigImage) BOOL imgType;

+ (void)dataListsWith: (NSString *)tid finished: (void (^)(NSArray *dataLists))finished;
@end
