//
//  ChannelLabel.m
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "ChannelLabel.h"
#import "ChannelModel.h"

@implementation ChannelLabel

+ (instancetype)channelLabelWith: (ChannelModel *)channel {

    ChannelLabel *l = [[ChannelLabel alloc] init];
    
    l.text = channel.tname;
    
    l.font = [UIFont systemFontOfSize:20];
    
    [l sizeToFit];
    
    l.font = [UIFont systemFontOfSize:14];
    
    return l;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    [super touchesBegan:touches withEvent:event];
    
    if ([self.delegate respondsToSelector:@selector(channelLabelDidSeleted:)]) {
        
        [self.delegate channelLabelDidSeleted:self];
    }
}

@end
