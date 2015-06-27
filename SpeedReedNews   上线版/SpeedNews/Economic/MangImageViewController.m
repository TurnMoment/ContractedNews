//
//  MangImageViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MangImageViewController.h"
#import "NetworkHander.h"
#import "DBManager.h"
#import "NavView.h"

@interface MangImageViewController ()

@property (nonatomic,retain)UIView*commentView;

@property (nonatomic,retain)UIView *navView;

@end

static CGSize winSize = {0,0};
@implementation MangImageViewController

- (void)dealloc{
    [_commentView release];
    [_itemLabel release];
    [_descripLabel release];
    [_selfNetData release];
    [_netData release];
    [_scrollView release];
    [_comentLabel release];
    [_image release];
    [_scrollerView2 release];
    [_descripArray release];
    [_pageLabel release];
    [_imageArray release];
    [_descSV release];
    [_navView release];
    [super dealloc];

}

- (void)viewWillAppear:(BOOL)animated{

    winSize = self.view.frame.size;
    
    self.navigationController.navigationBarHidden = YES;
    
        
   NavView *nav = [[NavView alloc]initWithFrame:CGRectMake(0, winSize.height - 44, winSize.width, 44) controller:self netData:self.netData typeIstopic:NO];
    self.navView = nav;
    nav.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:nav];
    [nav release];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    UIView *headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 25)];
    headerview.backgroundColor = [UIColor whiteColor];
    headerview.alpha = 0.5;
    [self.view addSubview:headerview];
    [headerview release];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,80, self.view.frame.size.width, self.view.frame.size.height - 80)];
    self.scrollView = scrollView;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    [scrollView release];

    UIScrollView *scrollView2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0,- 60, self.view.frame.size.width, 425)];
    scrollView2.pagingEnabled = YES;
    self.scrollerView2 = scrollView2;
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.showsVerticalScrollIndicator = NO;
    scrollView2.bounces = NO;
    scrollView2.delegate = self;
    [scrollView  addSubview:scrollView2];
    [scrollView2 release];
    
    
    
    UILabel *comentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 70 , 45, 70, 20)];
    self.comentLabel = comentLabel;
    comentLabel.textAlignment = NSTextAlignmentRight;
    self.comentLabel.text =  self.netData.comments ;
    comentLabel.font = [UIFont systemFontOfSize:15];
    comentLabel.textAlignment = NSTextAlignmentLeft;
    comentLabel.textColor = [UIColor blackColor];
    comentLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:comentLabel];
    [comentLabel release];
    
    UIImageView *comentimageView = [[UIImageView alloc]initWithFrame:CGRectMake( 40, 0,30, 20)];
    comentimageView.backgroundColor = [UIColor yellowColor];
    comentimageView.image = [UIImage imageNamed:@"nav7_blueCommentCount.png"];
    [comentLabel addSubview:comentimageView];
    [comentimageView release];

    
    UIView *footView  = [[UIView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height - 210,self.view.frame.size.width,210)];
    footView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:footView];
    [footView release];
    
    
    UILabel *itemLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 50, 50)];
    itemLabel.numberOfLines = 0;
    itemLabel.textColor = [UIColor whiteColor];
    self.itemLabel = itemLabel;
    [footView addSubview:itemLabel];
    [itemLabel release];
    
    UILabel *pageLabel = [[UILabel alloc]init ];
    self.pageLabel = pageLabel;
    pageLabel.textAlignment = NSTextAlignmentCenter;
    pageLabel.textColor = [UIColor whiteColor];
    [footView addSubview:pageLabel];
    [pageLabel release];
    
    
    UIScrollView *descSV = [[UIScrollView alloc]initWithFrame:CGRectMake(0,50,  self.view.frame.size.width, 90)];
    self.descSV = descSV;
    [footView addSubview:descSV];
    [descSV release];

    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width, 100)];
    descLabel.numberOfLines = 0;
    self.descripLabel= descLabel;
    descLabel.textColor = [UIColor whiteColor];
    descLabel.font = [UIFont systemFontOfSize:16];
    [descSV addSubview:descLabel];
    [descLabel release];

    
        
    NSURL *url = [NSURL URLWithString:self.netData.Id];
    NetworkHander *netWorkHander = [[NetworkHander alloc]init];
    [netWorkHander getDetailPageWithURL:url follow:^(id list) {
        self.selfNetData = list;
        [self getImageWithImageString:_selfNetData.images];
        self.pageLabel.text = self.pageLabel.text = [NSString stringWithFormat:@"%d/%lu",1,(unsigned long)self.selfNetData.images.count];
        
        
         self.descripLabel.text = self.descripArray[0];
        
        CGRect rect = [self.descripLabel.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
        CGRect fram = self.descripLabel.frame;
        fram.size.height = rect.size.height;
        self.descripLabel.frame = fram;
        descSV.contentSize = CGSizeMake(self.view.frame.size.width, rect.size.height);
        
        self.pageLabel.frame = CGRectMake( self.view.frame.size.width - 50,0, 50, self.itemLabel.frame.size.height);

        
    }];
    
    
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offSet = scrollView.contentOffset;
    int pageCount = offSet.x/self.scrollView.frame.size.width;

    self.pageLabel.text = [NSString stringWithFormat:@"%d/%lu",pageCount + 1,(unsigned long)self.selfNetData.images.count];
    
    self.descripLabel.text = self.descripArray[pageCount];
    
    CGRect rect = [self.descripLabel.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    CGRect fram = self.descripLabel.frame;
    fram.size.height = rect.size.height;
    self.descripLabel.frame = fram;
    self.descSV.contentSize = CGSizeMake(self.view.frame.size.width, rect.size.height);

    
}






- (void)setSelfNetData:(NetData *)selfNetData{
    if (_selfNetData != selfNetData) {
        [_selfNetData release];
        _selfNetData = [selfNetData retain];
    }

    self.itemLabel.text = _selfNetData.title;
    
    self.descripArray =_selfNetData.descripArr;
  
}




- (void)getImageWithImageString:(NSMutableArray*)manyImagArr{
    if (!manyImagArr) {
        return ;
    }
   
   self.imageArray = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i = 0; i < manyImagArr.count; i++) {
            
            NSURL * url = [NSURL URLWithString:manyImagArr[i]];
            NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
            NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            UIImage * img = [UIImage imageWithData:data];
           
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
        UIImageView * imgView = [[UIImageView alloc]initWithImage:img];
    imgView.frame = CGRectMake(i*self.view.frame.size.width,0, self.view.frame.size.width, self.view.frame.size.height - 220);
    [self.scrollerView2 addSubview:imgView];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [imgView release];
    self.scrollerView2.contentSize = CGSizeMake(i*self.view.frame.size.width, 260) ;
                
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 300) ;

                
                
            });
            
            
        }
        
        
    });
    
   
    
}






@end
