//
//  HomeViewController.m
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelLabel.h"
#import "ChannelModel.h"
#import "ChannelCell.h"
#import <objc/runtime.h>

@interface HomeViewController () <ChannelLabelDelegate>
/**
 *  放置频道的view
 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/**
 *  数据
 */
@property (nonatomic, strong) NSArray *channelList;
/**
 *  布局
 */
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
/**
 *  collectionView
 */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置频道
    [self setChannelLabel];
    
}

#pragma mark - /****************** 设置collcetionView ******************/
- (void)viewDidLayoutSubviews {

    [super viewDidLayoutSubviews];
    
    [self setLayout];
}
- (void)setLayout {

    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    self.layout.itemSize = self.collectionView.bounds.size;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;
}
#pragma mark - /****************** 数据源方法 ******************/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.channelList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 模型
    ChannelModel *channel = self.channelList[indexPath.item];

    static NSString *ID = @"CollectionCell";
    
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.channel = channel;
    
    return cell;
}


#pragma mark - /****************** 设置频道 ******************/
- (void)setChannelLabel {

    NSInteger count = self.channelList.count;
    
    // 设置frame
    CGFloat y = 0;
    CGFloat h = self.scrollView.bounds.size.height;
    CGFloat x = 12;
    
    for (int i = 0; i< count; i++) {
        
        // 取出数据
        ChannelModel *channel = self.channelList[i];
        
        // 创建Label
        ChannelLabel *l = [ChannelLabel channelLabelWith:channel];
        
        l.frame = CGRectMake(x, y, l.bounds.size.width, h);
        
        x += l.bounds.size.width;
        
        l.tag = i;
        l.userInteractionEnabled = YES;
        l.delegate = self;
        
        // 添加至scroolview上
        [self.scrollView addSubview:l];
    }
    // 去掉scroolview的64高度
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置scroolview的滚动范围
    self.scrollView.contentSize = CGSizeMake(x, 0);
    
}

#pragma mark - /****************** label代理 ******************/
- (void)channelLabelDidSeleted:(ChannelLabel *)channelLabel {
    
    NSLog(@"11");

    self.collectionView.contentOffset = CGPointMake(self.collectionView.bounds.size.width * channelLabel.tag, 0);
}
#pragma mark - /****************** 懒加载 ******************/
- (NSArray *)channelList {

    if (_channelList == nil) {
        
        _channelList = [ChannelModel channelList];
    }
    return _channelList;
}
@end
