//
//  NewsTableViewController.m
//  News
//
//  Created by 逗叔 on 15/8/31.
//  Copyright (c) 2015年 逗叔. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsTableViewController ()

@property (nonatomic, strong) NSArray *dataLists;
@end

@implementation NewsTableViewController

- (void)setTid:(NSString *)tid {

    _tid = tid.copy;
    
    __weak typeof(self) weakSelf = self;
    [News dataListsWith:tid finished:^(NSArray *dataLists) {
        
        weakSelf.dataLists = dataLists;
    }];
    
}

- (void)setDataLists:(NSArray *)dataLists {

    _dataLists = dataLists;
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置cell高度
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    NSLog(@"%@", self.tid);
}
#pragma mark - /****************** 数据源方法 ******************/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataLists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    News *news = self.dataLists[indexPath.row];
    
    NSString *ID = [NewsCell cellID:news];
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    // 给cell传模型
    cell.news = news;
    
    return cell;
}


@end
