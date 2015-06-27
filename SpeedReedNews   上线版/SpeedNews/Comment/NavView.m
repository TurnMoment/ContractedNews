//
//  NavView.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NavView.h"
#import "CommentView.h"
#import "DBManager.h"

@interface NavView()

@property (nonatomic,retain)UIViewController* controller;

@property (nonatomic,retain)UIImageView *imagV4;

@end


static CGSize winSize = {0,0};

@implementation NavView


- (void)dealloc{

    [_netData release];
    [_controller release];
    [_imagV4 release];
    [super dealloc];

}





- (instancetype)initWithFrame:(CGRect)frame controller:(UIViewController*)controller netData:(NetData*)netdat  typeIstopic:(BOOL)type{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        self.controller = controller;
        
        //父视图的尺寸
         winSize = controller.view.frame.size;
        
        self.netData = netdat;
        
        UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 44)];
        [leftBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:leftBtn];
        [leftBtn release];
        
        
        UIImageView *imagV1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 12, 25, 20)];
        imagV1.image = [UIImage imageNamed:@"setting_back.png"];
        //    imagV1.backgroundColor = [UIColor greenColor];
        [leftBtn addSubview: imagV1];
        [imagV1 release];
        
        UILabel *btnLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 12, 40, 20)];
        //    btnLabel1.backgroundColor = [UIColor grayColor];
        btnLabel1.text = @"返回";
        [leftBtn addSubview:btnLabel1];
        [btnLabel1 release];
        
        
        
        UIButton *twoBtn = [[UIButton alloc]init];
        [twoBtn addTarget:self action:@selector(speechBtn:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:twoBtn];
        [twoBtn release];
        
        UIImageView *imagV2 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 12, 25, 20)];
        imagV2.image = [UIImage imageNamed:@"tb_write.png"];
        //    imagV2.backgroundColor = [UIColor greenColor];
        [twoBtn addSubview: imagV2];
        [imagV2 release];
        
        UILabel *btnLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 12, 40, 20)];
        //    btnLabel2.backgroundColor = [UIColor grayColor];
        btnLabel2.text = @"跟帖";
        [twoBtn addSubview:btnLabel2];
        [btnLabel2 release];
        
        
        
        UIButton *shareBtn = [[UIButton alloc]init];
        [shareBtn addTarget:self action:@selector(shareBtn:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:shareBtn];
        [shareBtn release];
        
        
        UIImageView *imagV3 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 12, 25, 20)];
        imagV3.image = [UIImage imageNamed:@"share_icon.png"];
        //    imagV3.backgroundColor = [UIColor greenColor];
        [shareBtn addSubview: imagV3];
        [imagV3 release];
        
        UILabel *btnLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(30, 12, 40, 20)];
        //    btnLabel3.backgroundColor = [UIColor grayColor];
        btnLabel3.text = @"分享";
        [shareBtn addSubview:btnLabel3];
        [btnLabel3 release];
        
        if (!type) {
            
         twoBtn.frame = CGRectMake( 100, 0, 50, 44);
         shareBtn.frame = CGRectMake(winSize.width - 180, 0, 50, 44);
            
        UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake( frame.size.width - 75, 0, 50, 44)];
        
        [rightBtn addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:rightBtn];
        [rightBtn release];
        
        
        UIImageView *imagV4 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 12, 25, 20)];
        self.imagV4 = imagV4;
        //    imagV4.backgroundColor = [UIColor greenColor];
        [rightBtn addSubview: imagV4];
        [imagV4 release];
        
        DBManager *dbM = [DBManager shareDBManager];
        BOOL res =  [dbM isFavorite: netdat.title];
        
        if (res) {
            imagV4.image = [UIImage imageNamed:@"contenttoolba.png"];
            
        }else{
            
            imagV4.image = [UIImage imageNamed:@"tb_lit_collect.png"];
            
        }
        
            
        
        UILabel *btnLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(30, 12, 40, 20)];
        //    btnLabel4.backgroundColor = [UIColor grayColor];
        btnLabel4.text = @"收藏";
        [rightBtn addSubview:btnLabel4];
        [btnLabel4 release];

            
            
        }else{
        
            twoBtn.frame = CGRectMake(frame.size.width - 180, 0, 50, 44);
            shareBtn.frame = CGRectMake(frame.size.width - 75, 0, 50, 44);
            
        }
        
        
       
        
        
    }

    return self;


}



- (void)shareBtn:(UIButton*)shareBtn{
    
}


- (void)speechBtn:(UIButton*)speechBtn{
     
    CommentView *comentView =[[CommentView alloc]initWithFrame:CGRectMake(0,winSize.height - 240,winSize.width, 240)];
    [self.controller.view addSubview: comentView];
    [comentView release];
    
}


- (void)goBack:(UIButton*)sender{
    
    [self.controller.navigationController popViewControllerAnimated:YES];
    
    
}


- (void)collect:(UIBarButtonItem*)collect{
    
    DBManager *dbM = [DBManager shareDBManager];
    
    BOOL resust = [dbM isFavorite:self.netData.title];
    
    if (resust) {
        self.imagV4.image = [UIImage imageNamed:@"tb_lit_collect.png"];
      
        [dbM deleteNetDataByTitle:self.netData.title];
        
    }else{
        
        self.imagV4.image = [UIImage imageNamed:@"contenttoolba.png"];
        [dbM instertNetData:self.netData];
        
    }

    
    
}

















@end
