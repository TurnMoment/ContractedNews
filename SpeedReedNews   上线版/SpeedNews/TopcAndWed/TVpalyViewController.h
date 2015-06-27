//
//  TVpalyViewController.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"
#import "ImageDownloading.h"


@interface TVpalyViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>


@property(nonatomic,retain)NetData *netData;

@property(nonatomic,retain)NetData *selfNetData;


@property (nonatomic,retain)UILabel*titLabel;

@property (nonatomic,retain)UILabel *updateTLabel;

@property (nonatomic,retain)UILabel *comentLabel;


@property (nonatomic ,retain)UILabel *soureLabel;

@property(nonatomic,retain)UIScrollView*mainSV;

@property (nonatomic,copy)NSString* imgeStr;









@end
