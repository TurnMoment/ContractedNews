//
//  TVpalyViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "TVpalyViewController.h"
#import "NetworkHander.h"
//#import "RegistAndLoadViewController.h"
//#import "CommentView.h"
#import "NavView.h"
#import "DBManager.h"

@interface TVpalyViewController ()

@property (nonatomic,retain)UIView*commentView;

@property (nonatomic,retain)UISegmentedControl*segment;

@property (nonatomic,retain)UIImageView *TVImView;

@property (nonatomic,copy)NSString*videoSrc;

@property (nonatomic,retain)UIButton *palyBtn;

@property (nonatomic,retain)NavView *navView;

@end

static CGSize winSize = {0,0};
@implementation TVpalyViewController

- (void)dealloc{
    [_segment release];
    [_commentView release];
    [_netData release];
    [_selfNetData release];
    [_soureLabel release];
    [_updateTLabel release];
    [_comentLabel release];
    [_titLabel release];
    [_mainSV release];
    [_TVImView release];
    [_videoSrc release];
    [_imgeStr release];
    [_palyBtn release];
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
    [networkHander getTopicDetailPageWithURL:url follow:^(id selfNetData) {
        self.selfNetData = selfNetData;
    }];
    
    
    UIScrollView *mainSV = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 22, self.view.frame.size.width - 20, self.view.frame.size.height - 22)];
    self.mainSV = mainSV;
    mainSV.delegate = self;
    [self.view addSubview:mainSV];
    
    
    NavView *nav = [[NavView alloc]initWithFrame:CGRectMake(0, winSize.height - 44, winSize.width, 44) controller:self netData:self.netData typeIstopic:NO];
    self.navView = nav;
    nav.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nav];
    [nav release];
    
    
//    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
//    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
//    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [leftBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    [leftBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchDown];
//    [navView addSubview:leftBtn];
//    [leftBtn release];
//    
//    UIButton *twoBtn = [[UIButton alloc]initWithFrame:CGRectMake( 100, 0, 50, 44)];
//    [twoBtn setTitle:@"跟帖" forState:UIControlStateNormal];
//    [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [twoBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    [twoBtn addTarget:self action:@selector(speechBtn:) forControlEvents:UIControlEventTouchDown];
//    [navView addSubview:twoBtn];
//    [twoBtn release];
//    
//    UIButton *shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(winSize.width - 150, 0, 50, 44)];
//    [shareBtn   setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [shareBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
//    [shareBtn addTarget:self action:@selector(shareBtn:) forControlEvents:UIControlEventTouchDown];
//    [navView addSubview:shareBtn];
//    [shareBtn release];
//    
//    
//    
//    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake( winSize.width - 50, 0, 50, 44)];
//    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [rightBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    [rightBtn setTitle:@"收藏" forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchDown];
//    [navView addSubview:rightBtn];
//    [rightBtn release];
    
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,- 15,mainSV.frame.size.width - 10 , 60)];
    titLabel.text = self.netData.title;
    titLabel.numberOfLines = 0;
    titLabel.font = [UIFont systemFontOfSize:22];
    [mainSV addSubview:titLabel];
    [titLabel release];
    
    
    CGRect rect2 = [titLabel.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
    CGRect fram2 = titLabel.frame;
    fram2.size.height = rect2.size.height;
    titLabel.frame = fram2;
    
    
    UILabel *soureLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, titLabel.frame.origin.y + titLabel.frame.size.height + 10, 100, 20)];
    soureLabel.font = [UIFont systemFontOfSize:15];
    self.soureLabel =  soureLabel;
       [mainSV addSubview:soureLabel];
    [soureLabel release];
    
    
    UILabel *updateTLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, titLabel.frame.origin.y + titLabel.frame.size.height + 10, 150, 20)];
    updateTLabel.font = [UIFont systemFontOfSize:15];
    self.updateTLabel = updateTLabel;
      [mainSV addSubview:updateTLabel];
    [updateTLabel release];
    
    
    UILabel *comentLabel = [[UILabel alloc]initWithFrame:CGRectMake(winSize.width - 85, titLabel.frame.origin.y + titLabel.frame.size.height + 10, winSize.width - 280, 20)];
    
    NSString* comment = self.netData.comments;
    comentLabel.text = [NSString stringWithFormat:@"%@",comment];
    comentLabel.textColor = [UIColor blackColor];
    comentLabel.font = [UIFont systemFontOfSize:12];
    comentLabel.textAlignment = NSTextAlignmentLeft;
    comentLabel.backgroundColor = [UIColor redColor];
    [mainSV addSubview:comentLabel];
    [comentLabel release];
    
    
    UIImageView *comentimageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 50, titLabel.frame.origin.y + titLabel.frame.size.height + 10, 30, 20)];
    comentimageView.backgroundColor = [UIColor redColor];
    comentimageView.image = [UIImage imageNamed:@"nav7_blueCommentCount.png"];
    [mainSV addSubview:comentimageView];
    [comentimageView release];
    
    UIImageView *tvImView = [[UIImageView alloc]initWithFrame:CGRectMake(10, self.comentLabel.frame.origin.y + 50, mainSV.frame.size.width - 20 , 250)];
    self.TVImView = tvImView;
    tvImView.backgroundColor = [UIColor yellowColor];
    [mainSV addSubview:tvImView];
    [tvImView release];
    
    
}


- (void)setSelfNetData:(NetData *)selfNetData{
    
    if (_selfNetData != selfNetData) {
        [_selfNetData release];
        _selfNetData = [selfNetData retain];
    }
    
    self.soureLabel.text = selfNetData.source;
    self.updateTLabel.text = selfNetData.editTime;
    self.videoSrc = selfNetData.Id;
    
    UIButton *playBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.TVImView.center.x - 20, self.TVImView.center.y,80, 80)];
    [playBtn setBackgroundImage:[UIImage imageNamed:@"live_play_icon.png"] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playTV:) forControlEvents:UIControlEventTouchDown];
    playBtn.alpha = 0.5;
   playBtn.layer.cornerRadius = 40;
    self.palyBtn = playBtn;
    [playBtn.layer setMasksToBounds:YES];
    playBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:playBtn];
    [playBtn release];
    
    
}

- (void)playTV:(UIButton*)play{
 
    [self.palyBtn removeFromSuperview];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(10, self.comentLabel.frame.origin.y + 40,self.mainSV.frame.size.width - 20 , 200)];
    [self.mainSV addSubview:webView];
    [webView release];
    
    NSURL *url = [NSURL URLWithString:self.videoSrc];
    NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
    [webView loadRequest:resqust];
    
    
}

- (void)setImgeStr:(NSString *)imgeStr{
    
    if (_imgeStr != imgeStr) {
        [_imgeStr release];
        _imgeStr = [imgeStr retain];
    }
    [self getImage:_imgeStr];
    
}




- (void)getImage:(NSString*)str{
    
    NSURL *url = [NSURL URLWithString:str];
    
    NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        UIImage *image =[UIImage imageWithData:data];
        self.TVImView.image = image;
        
    }];
    
}




//- (void)shareBtn:(UIButton*)shareBtn{
//    
//}
//
//
//- (void)speechBtn:(UIButton*)speechBtn{
//    
//    CommentView *comentView =[[CommentView alloc]initWithFrame:CGRectMake(0,winSize.height - 240,winSize.width, 240)];
//    
//    [self.view addSubview:comentView];
//    [comentView release];
//    
//    
//}
//
//
//- (void)goBack:(UIButton*)sender{
//    
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    
//    
//}
//
//
//- (void)collect:(UIBarButtonItem*)collect{
//    
//    DBManager *dbM = [DBManager shareDBManager];
//    
//    BOOL resust = [dbM isFavorite:self.netData.title];
//    
//    NSLog(@"******************%@,%@",self.netData.type,self.netData.title);
//    
//    if (resust) {
//        
//        return;
//    }else{
//        
//        [dbM instertNetData:self.netData];
//        
//    }
//    
//}
//





@end


