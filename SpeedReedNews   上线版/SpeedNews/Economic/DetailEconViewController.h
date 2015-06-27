//
//  DetailEconViewController.h
//  SpeedNews
//
//  Created by lanou3g on 15/5/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"
#import "ImageDownloading.h"

@interface DetailEconViewController : UIViewController<UIScrollViewDelegate>


@property(nonatomic,retain)NetData *netData;

@property(nonatomic,retain)NetData *selfNetData;

@property (nonatomic,retain)UIWebView*webView;

@property (nonatomic,retain)UILabel*titLabel;

@property (nonatomic,retain)UILabel *updateTLabel;

@property (nonatomic,retain)UILabel *comentLabel;


@property (nonatomic ,retain)UILabel *soureLabel;

@property(nonatomic,retain)UIScrollView*mainSV;

//@property (nonatomic,retain)UIImageView *imagV4;

@end
