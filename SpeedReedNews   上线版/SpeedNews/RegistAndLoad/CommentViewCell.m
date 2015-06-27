//
//  CommentViewCell.m
//  ifengDomo
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CommentViewCell.h"

@implementation CommentViewCell

- (void)viewDidLoad
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 40,40)];
    imageView.backgroundColor = [UIColor blueColor];
    self.imageV = imageView;
    [self.contentView addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 100, 20)];
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    
    self.titleLabel = label;
    [self.contentView addSubview:label];
    [label release];
    
   

}
@end
