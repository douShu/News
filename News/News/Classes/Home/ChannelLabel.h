//
//  ChannelLabel.h
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChannelModel;
@class ChannelLabel;

@protocol ChannelLabelDelegate <NSObject>

- (void)channelLabelDidSeleted: (ChannelLabel *)channelLabel;

@end

@interface ChannelLabel : UILabel

+ (instancetype)channelLabelWith: (ChannelModel *)channel;

@property (nonatomic, strong) id<ChannelLabelDelegate> delegate;
@end
