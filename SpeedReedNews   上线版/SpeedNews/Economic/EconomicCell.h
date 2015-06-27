//
//  EconomicCell.h
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"
#import "ImageDownloading.h"

@interface EconomicCell : UITableViewCell<ImageDownloaderDelegate>

@property (nonatomic,retain)UILabel *titleLabel;

@property (nonatomic,retain)UILabel *commentLabel;

@property (nonatomic,retain)UIImageView *commentView;


@property (nonatomic,retain)UIImageView *lefeImage;

@property (nonatomic,retain)NetData *netData;

@property (nonatomic,retain)UILabel *markLabel;



- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)fram reuseIdentifier:(NSString *)reuseIdentifier;







@end
