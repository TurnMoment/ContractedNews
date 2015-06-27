//
//  EconomicViewController.h
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EconomicViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain)NSMutableArray * netDataArray;

@property (nonatomic, retain)NSMutableArray * netDataArray2;

@property (nonatomic, assign)NSInteger  selectedSegmentIndex;


@property (nonatomic,copy)NSString*subjectStr;



@property (nonatomic,retain)NSMutableDictionary *mainDic;






@end
