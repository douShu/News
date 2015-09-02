//
//  ChannelCell.m
//  News
//
//  Created by 逗叔 on 15/9/3.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "ChannelCell.h"
#import "NewsTableViewController.h"



@interface ChannelCell ()

@property (nonatomic, strong) NewsTableViewController *vc;

@end

@implementation ChannelCell

- (void)setChannel:(ChannelModel *)channel {

    _channel = channel;
    
    self.vc.tid = channel.tid;
}

- (void)awakeFromNib {

    // 添加子视图
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.vc = [sb instantiateInitialViewController];
    
    [self addSubview:self.vc.tableView];
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.vc.tableView.frame = self.bounds;
    
}
@end
