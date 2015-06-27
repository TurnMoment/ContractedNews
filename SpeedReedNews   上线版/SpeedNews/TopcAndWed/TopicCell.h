//
//  TopicCell.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/6.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)size reuseIdentifier:(NSString *)reuseIdentifier;

@property (nonatomic,assign)int numberItem;


@property (nonatomic,retain)NSArray *TVarray;
@end
