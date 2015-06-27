//
//  CommentViewController.m
//  ifengDomo
//
//  Created by lanou3g on 15/5/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentViewCell.h"
@implementation CommentViewController

#pragma 评论页面
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 450)];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView release];
    
      
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    

    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CommentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        cell = [[CommentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return 90;
}




@end
