//
//  ChannelModel.m
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "ChannelModel.h"
#import "NSObject+Extension.h"

@implementation ChannelModel

+ (NSArray *)channelList {
        
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *arr = dict[dict.keyEnumerator.nextObject];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    // 字典转模型
    for (NSDictionary *dict in arr) {
        
        ChannelModel *channel = [ChannelModel objcWithDict:dict];
        
        [arrM addObject:channel];
    }
    
    // 对arrM的对象进行排序
    NSArray *a = [arrM sortedArrayUsingComparator:^NSComparisonResult(ChannelModel *obj1, ChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
    return a;
}

#pragma mark - /****************** 打印详细列表 ******************/
- (NSString *)description {

    NSArray *arr = [ChannelModel propertiesArr];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:arr];
    
    return [NSString stringWithFormat:@"%@-%p-%@", [self class], self, dict];
}

@end
