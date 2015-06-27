//
//  DetailEconViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/5/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DetailEconViewController.h"
#import "NetworkHander.h"
#import "DBManager.h"
#import "NavView.h"


@class myCollectViewController;

@interface DetailEconViewController ()<UIWebViewDelegate>

@property (nonatomic,retain)UIView*commentView;

@property (nonatomic,retain)UIView *navView;



@end


static CGSize winSize = {0,0};

@implementation DetailEconViewController

- (void)dealloc{
    [_webView release];
    [_commentView release];
    [_netData release];
    [_selfNetData release];
    [_soureLabel release];
    [_updateTLabel release];
    [_comentLabel release];
    [_titLabel release];
    [_mainSV release];
    [_navView release];
    [super dealloc];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    winSize = self.view.frame.size;
   
    
    NSURL *url = [NSURL URLWithString:self.netData.Id];
      NetworkHander *networkHander = [NetworkHander currentNetworkHander];
    [networkHander getDetailPageWithURL:url follow:^(id selfNetData) {
        self.selfNetData = selfNetData;
        
    }];

    UIScrollView *mainSV = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 22, self.view.frame.size.width - 20, self.view.frame.size.height - 22)];
    self.mainSV = mainSV;
    mainSV.delegate = self;
    //mainSV.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:mainSV];

    
    NavView *nav = [[NavView alloc]initWithFrame:CGRectMake(0, winSize.height - 44, winSize.width, 44) controller:self netData:self.netData typeIstopic:NO];
    self.navView = nav;
    nav.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nav];
    [nav release];
    
    
       
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,- 15,mainSV.frame.size.width - 10 , 60)];
    titLabel.text = self.netData.title;
     titLabel.numberOfLines = 0;
    titLabel.font = [UIFont systemFontOfSize:20];
    [mainSV addSubview:titLabel];
    [titLabel release];
    
    CGRect rect2 = [titLabel.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
    CGRect fram2 = titLabel.frame;
    fram2.size.height = rect2.size.height;
    titLabel.frame = fram2;

    
    UILabel *soureLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, titLabel.frame.origin.y + titLabel.frame.size.height + 10, 120, 20)];
    soureLabel.font = [UIFont systemFontOfSize:15];
    self.soureLabel =  soureLabel;
     [mainSV addSubview:soureLabel];
    [soureLabel release];
    
    
    UILabel *updateTLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, titLabel.frame.origin.y + titLabel.frame.size.height + 10, 150, 20)];
    updateTLabel.font = [UIFont systemFontOfSize:15];
    self.updateTLabel = updateTLabel;
    [mainSV addSubview:updateTLabel];
    [updateTLabel release];
    
    
    UILabel *comentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 85, titLabel.frame.origin.y + titLabel.frame.size.height + 10, self.view.frame.size.width - 280, 20)];
     comentLabel.text = self.netData.comments;
    comentLabel.font = [UIFont systemFontOfSize:15];
    comentLabel.textAlignment = NSTextAlignmentLeft;
    comentLabel.backgroundColor = [UIColor redColor];
    [mainSV addSubview:comentLabel];
    [comentLabel release];
    
    UIImageView *comentimageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 50, titLabel.frame.origin.y + titLabel.frame.size.height + 10, 30, 20)];
    comentimageView.backgroundColor = [UIColor redColor];
    comentimageView.image = [UIImage imageNamed:@"nav7_blueCommentCount.png"];
    [mainSV addSubview:comentimageView];
    [comentimageView release];
    
    
  
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, self.comentLabel.frame.origin.y + 40, mainSV.frame.size.width , 400)];
    [mainSV addSubview:webView];
    self.webView = webView;
    [webView release];
    webView.delegate = self;
    webView.scrollView.scrollEnabled = NO;

}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGPoint offSet = *targetContentOffset;
    
    if (offSet.y>0) {
        
        self.navView.frame = CGRectMake(0, winSize.height, winSize.width, 44);
                
    }else{
    
         self.navView.frame = CGRectMake(0, winSize.height - 44, winSize.width, 44);
            
    }
    
    
}




- (void)setSelfNetData:(NetData *)selfNetData{

    if (_selfNetData != selfNetData) {
        [_selfNetData release];
        _selfNetData = [selfNetData retain];
    }

    self.soureLabel.text = selfNetData.source;
    self.updateTLabel.text = selfNetData.editTime;
    [self.webView loadHTMLString:self.selfNetData.text baseURL:nil];
    
   }


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    CGRect frame = webView.frame;
     webView.frame = CGRectMake(frame.origin.x, self.soureLabel.frame.origin.y + self.soureLabel.frame.size.height + 20, frame.size.width, height + 60);
    self.mainSV.contentSize = CGSizeMake(self.view.frame.size.width - 20,webView.frame.size.height + 60);

}

@end
