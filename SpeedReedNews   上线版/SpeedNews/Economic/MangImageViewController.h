//
//  MangImageViewController.h
//  SpeedNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"


@interface MangImageViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate>

@property (nonatomic,retain)UIScrollView *scrollView;

@property(nonatomic,retain)NetData *netData;

@property (nonatomic,retain)UIScrollView * scrollerView2;

@property(nonatomic,retain)UILabel *comentLabel;

@property(nonatomic,retain)NetData *selfNetData;

@property(nonatomic,copy)NSString*image;


@property(nonatomic,retain)UILabel *itemLabel;

@property (nonatomic,retain)UILabel*descripLabel;

@property (nonatomic,retain)UILabel*pageLabel;

@property (nonatomic,retain)NSMutableArray*imageArray;

@property(nonatomic,retain)NSMutableArray*descripArray;

@property (nonatomic,retain)UIScrollView*descSV;



@end
