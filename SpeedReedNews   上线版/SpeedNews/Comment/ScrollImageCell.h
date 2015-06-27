//
//  ScrollImageCell.h
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetData.h"
#import "ImageDownloading.h"

//@class FirstViewController;





@interface ScrollImageCell : UITableViewCell<UIScrollViewDelegate,ImageDownloaderDelegate>



@property(nonatomic,retain)UIScrollView *scrollView;

@property(nonatomic,retain)UIPageControl*pageControl;

@property (nonatomic,retain)NSMutableArray *netDataArray;


@property (nonatomic,retain)NSMutableArray *imageViewArray;


@property (nonatomic,retain)NSMutableArray *imageArr;

- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)fram reuseIdentifier:(NSString *)reuseIdentifier;




@end
