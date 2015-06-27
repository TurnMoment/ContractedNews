//
//  ThreeCell.h
//  SpeedNews
//
//  Created by lanou3g on 15/5/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"
#import "ImageDownloading.h"

@interface ThreeCell : UITableViewCell<ImageDownloaderDelegate>

@property (nonatomic,retain)UILabel *titleLabel;

@property (nonatomic,retain)UIImageView *oneImageView;

@property (nonatomic,retain)UIImageView *twoImageView;

@property (nonatomic,retain)UIImageView *threeImageView;

@property (nonatomic,retain)NetData *netData;


@property (nonatomic,retain)NSMutableArray *imagesArray;


@property (nonatomic,copy)NSString *imageStr;


- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)fram reuseIdentifier:(NSString *)reuseIdentifier;




@end
