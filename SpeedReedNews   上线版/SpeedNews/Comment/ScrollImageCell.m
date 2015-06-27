//
//  ScrollImageCell.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ScrollImageCell.h"
#import "MangImageViewController.h"
#import "CacheManger.h"


@interface ScrollImageCell ()



@end



@implementation ScrollImageCell


-(void)dealloc{
    [_netDataArray release];
    [_imageViewArray release];
    [_imageArr release];
    [_pageControl release];
    [_scrollView release];
    [super dealloc];
    
}



- (void)imageDownloaderDidFilishLoading:(UIImage*)imge{
    
    if (!imge) {
        return;
    }
    
    [self.imageArr addObject:imge];
    
    if (self.imageArr.count == self.imageViewArray.count) {
        for (int i = 0; i < self.imageViewArray.count; i++) {
            UIImageView *imageView = self.imageViewArray[i];
            imageView.image = self.imageArr[i];
            
        }
        
    }
    
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)size reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ScrollImageCell"];
    if (self) {
        
        
        UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, size.width, 170)];
        
       
        self.scrollView = scrollView;
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
        [tap addTarget:self action:@selector(tap:)];
        [scrollView addGestureRecognizer:tap];
        [tap release];
        
        [self.contentView addSubview:scrollView];
        [scrollView release];
        
        
        UIPageControl *page = [[UIPageControl alloc]initWithFrame:CGRectMake(self.frame.size.width/2 + 60, 140, 100, 40)];
            self.pageControl = page;
        page.pageIndicatorTintColor = [UIColor yellowColor];
        page.currentPageIndicatorTintColor = [UIColor greenColor];
        [self.contentView addSubview:page];
        [page release];
        
                
    }

    return self;

}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offSet = scrollView.contentOffset;
    int pageCount = offSet.x/self.scrollView.frame.size.width;
    self.pageControl.currentPage = pageCount;


}

- (void)pageConrolChange{
    
    
        if (self.pageControl.currentPage == self.netDataArray.count- 1) {
            self.pageControl.currentPage = 0;
        }else{
            
            self.pageControl.currentPage += 1;
            
        }

        long currentPage = self.pageControl.currentPage;
        CGPoint offSet = CGPointMake(currentPage * self.scrollView.frame.size.width, 0);
        [self.scrollView setContentOffset:offSet animated:YES];
        
        
   
}


- (void)setNetDataArray:(NSMutableArray *)netDataArray{

    if (_netDataArray != netDataArray)
    {
        [_netDataArray release];
        _netDataArray = [netDataArray retain];
    }
    
    self.pageControl.numberOfPages = self.netDataArray.count;
    
    CGFloat with = self.scrollView.frame.size.width;
    self.scrollView.contentSize = CGSizeMake(with*_netDataArray.count, 170);
    
    NSTimer *timer = [[NSTimer alloc]initWithFireDate:[NSDate date] interval:3 target:self selector:@selector(pageConrolChange) userInfo:nil repeats:YES];
    
     [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.imageViewArray = [NSMutableArray array];
     self.imageArr = [NSMutableArray array];
    
    for (int i = 0; i < self.netDataArray.count; i++)
    {
        
        UIImageView *scrollImV = [[UIImageView alloc]init];
        scrollImV.frame = CGRectMake(i*with,5,with,190);
        [self.scrollView addSubview:scrollImV];
        [scrollImV release];
        
        [self.imageViewArray addObject:scrollImV];
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(i * with + 5, 140, 240, 20)];
        titLabel.font = [UIFont systemFontOfSize:13];
        titLabel.backgroundColor = [UIColor cyanColor];
        titLabel.alpha = 0.5;
        titLabel.textAlignment = NSTextAlignmentCenter;
        [self.scrollView addSubview:titLabel];
        [titLabel release];
        
        NetData *netData = [self.netDataArray objectAtIndex:i];
        titLabel.text = netData.title;
        
        CGRect rect = [titLabel.text boundingRectWithSize:CGSizeMake(1000, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
        CGRect fram = titLabel.frame;
        fram.size.width = rect.size.width+10;
        titLabel.frame = fram;
        
        [ImageDownloading imageDownloaderWithUrlStr:netData.thumbnail delegate:self];
        
    }
   


}


- (void)tap:(UITapGestureRecognizer*)tap{

   
    UIViewController *VC =[self viewController];
   MangImageViewController *mangeVC =[[MangImageViewController alloc]init];
    
       
    for (int i = 0; i < self.imageViewArray.count; i++) {
        if (self.pageControl.currentPage == i) {
            
            NetData *netData = [self.netDataArray objectAtIndex:i];
            mangeVC.netData = netData;
            
            if ([netData.type isEqualToString:@"slide"]) {
            [VC.navigationController pushViewController:mangeVC animated:YES];
                [mangeVC release];
            }
            
        }
        
    }
    
    
}


- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}




@end
