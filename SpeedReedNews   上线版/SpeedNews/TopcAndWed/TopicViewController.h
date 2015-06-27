//
//  TopicViewController.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/4.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"

@interface TopicViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>

@property (nonatomic,copy)NSString *comments;


@property(nonatomic,retain)NetData *netData;

@property (nonatomic,retain)NSMutableDictionary *mainDic;

@property (nonatomic,retain)NSMutableArray *array;







@end
