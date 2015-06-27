//
//  collectCell.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NetData.h"
#import "ImageDownloading.h"

@interface collectCell : UITableViewCell<ImageDownloaderDelegate>

@property (nonatomic,retain)UILabel *titleLabel;


@property (nonatomic,retain)UIImageView *lefeImage;

@property (nonatomic,retain)NetData *netData;

@property (nonatomic,retain)UIButton *deleCBtn;



- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)fram reuseIdentifier:(NSString *)reuseIdentifier;

@end
