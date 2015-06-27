//
//  setFirstCell.h
//  SpeedNews
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface setFirstCell : UITableViewCell

- (id)initWithSize:(CGSize)size withStyle:(UITableViewCellStyle)style
      reuseIdentifier:(NSString *)reuseIdentifier statuImage:(UIImage*)image subjectLabelName:(NSString*)subName EableShowArrowButton:(BOOL)showArrow  EableShowThreeButton:(BOOL)showButton  EableShowRightSwith:(BOOL)showSwith cacheButtonStatu:(NSString*)statu EableShowCacheButton:(BOOL)showCacheButton;

@property(nonatomic,copy)NSString*subName;



@end
