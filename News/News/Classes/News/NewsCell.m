//
//  NewsCell.m
//  News
//
//  Created by 逗叔 on 15/9/2.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "NewsCell.h"
#import "UIKit+AFNetworking.h"

@interface NewsCell ()
/**
 *  图像
 */
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
/**
 *  标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  摘要
 */
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
/**
 *  跟帖
 */
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgViews;

@end

@implementation NewsCell

- (void)setNews:(News *)news {

    _news = news;
    
    self.titleLabel.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%d", news.replyCount];
    
    self.imgView.image = nil;
    [self.imgView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    
    if (news.imgextra.count == 2) {
        
        int index = 0;
        
        for (UIImageView *img in self.imgViews) {
            
            img.image = nil;
            [img setImageWithURL:[NSURL URLWithString:news.imgextra[index][@"imgsrc"]]];
            
            index++;
        }
    }
}


- (void)awakeFromNib {

    // 设置摘要的换行宽度
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.digestLabel.frame.origin.x - 29;
}

#pragma mark - /****************** 确定Cell的ID ******************/
+ (NSString *)cellID: (News *)news {

    if (news.isBigImage) {
        
        return @"BigCell";
    } else if (news.imgextra.count == 2) {

        return @"MoreCell";
    } else {
    
        return @"Cell";
    }
}
@end
