//
//  News.m
//  News
//
//  Created by 逗叔 on 15/9/2.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"

@implementation News

+ (void)dataListsWith: (NSString *)tid finished: (void (^)(NSArray *dataLists))finished {

    // 断言
    NSAssert(finished != nil, @"请传入完成回调");
    
    // 异步加载数据
    NetworkTools *net = [NetworkTools shared];
    net.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSString *strURL = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/headline/%@/0-40.html", tid];
    
    [net GET:strURL parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        NSArray *arr = responseObject[responseObject.keyEnumerator.nextObject];
        
        // 创建模型数组
        NSMutableArray *arrM = [NSMutableArray array];
        
        // 遍历数组
        for (NSDictionary *dict in arr) {
            
            News *news = [News objcWithDict:dict];
            
            [arrM addObject:news];
        }
        finished(arrM);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@", error);
    }];
}


@end
