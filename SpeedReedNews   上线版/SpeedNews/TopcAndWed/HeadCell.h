//
//  HeadCell.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/7.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HeadCell : UITableViewCell

@property (nonatomic,copy)NSString *titleImStr;

@property (nonatomic,retain)UIImageView *titleImage;



@property (nonatomic,retain)UILabel *descripLabel;

@property (nonatomic ,retain)UIImageView *commentview;

@property (nonatomic ,retain)UILabel *commentLabel;








- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)windowSize reuseIdentifier:(NSString *)reuseIdentifier;



@end
