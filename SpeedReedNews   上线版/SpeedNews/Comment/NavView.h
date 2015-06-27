//
//  NavView.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"



@interface NavView : UIView

@property(nonatomic,retain)NetData *netData;



- (instancetype)initWithFrame:(CGRect)frame controller:(UIViewController*)controller netData:(NetData*)netdat  typeIstopic:(BOOL)type;

@end
