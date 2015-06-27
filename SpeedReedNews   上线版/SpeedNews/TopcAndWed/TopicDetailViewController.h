//
//  TopicDetailViewController.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/7.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"
#import "ImageDownloading.h"

@interface TopicDetailViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate,UIWebViewDelegate>

@property(nonatomic,retain)NetData *netData;

@property(nonatomic,retain)NetData *selfNetData;

@property (nonatomic,retain)UIWebView*webView;

@property (nonatomic,retain)UILabel*titLabel;

@property (nonatomic,retain)UILabel *updateTLabel;

@property (nonatomic,retain)UILabel *comentLabel;


@property (nonatomic ,retain)UILabel *soureLabel;

@property(nonatomic,retain)UIScrollView*mainSV;






@end
