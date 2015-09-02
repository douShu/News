//
//  NewsCell.h
//  News
//
//  Created by 逗叔 on 15/9/2.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsCell : UITableViewCell

@property (nonatomic, strong) News *news;

+ (NSString *)cellID: (News *)news;
@end
