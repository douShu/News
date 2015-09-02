//
//  ChannelModel.h
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *tid;

+ (NSArray *)channelList;

@end
