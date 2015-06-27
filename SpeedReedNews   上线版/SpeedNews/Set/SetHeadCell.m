//
//  SetHeadCell.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/11.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SetHeadCell.h"
#import "myCollectViewController.h"
#import "DBManager.h"



static CGSize sized = {0,0};

@implementation SetHeadCell

- (id)initWithSize:(CGSize)size withStyle:(UITableViewCellStyle)style
   reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        sized = size;
        
        
        UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, sized.width/3, sized.height)];
//        firstBtn.backgroundColor = [UIColor yellowColor];
        [self addSubview:firstView];
        [firstView release];
        
        
        UIButton *funcIV1 = [[UIButton alloc]initWithFrame:CGRectMake(firstView.center.x - 30, firstView.center.y - 40, 60, 60)];
        [funcIV1 setBackgroundImage:[UIImage imageNamed:@"setting_Push.png"] forState:UIControlStateNormal];
    
        [firstView addSubview: funcIV1];
        [funcIV1 release];
        
        UILabel *funLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(firstView.center.x - 30,sized.height - 30, 60, 20)];
        funLabel1.text = @"新闻快讯";
        funLabel1.font = [UIFont systemFontOfSize:13];
        funLabel1.textAlignment = NSTextAlignmentCenter;
        //funLabel1.backgroundColor = [UIColor redColor];
        [firstView addSubview:funLabel1];
        [funLabel1 release];
        
        
        UIView *secView = [[UIView alloc]initWithFrame:CGRectMake(sized.width/3, 0, sized.width/3, sized.height)];
        [self addSubview:secView];
        [secView release];
      
        
        UIButton *funcIV2 = [[UIButton alloc]initWithFrame:CGRectMake(secView.center.x - 30, secView.center.y - 40, 60, 60)];
        [funcIV2 setBackgroundImage:[UIImage imageNamed:@"contenttoolbar_hd_fav_light@2x.png"] forState:UIControlStateNormal];
         [funcIV2 setBackgroundImage:[UIImage imageNamed:@"collection.png"] forState:UIControlStateHighlighted];
        [funcIV2 addTarget:self action:@selector(collectClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: funcIV2];
        [funcIV2 release];
        
        UILabel *funLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(secView.center.x - 30, sized.height - 30, 60, 20)];
        funLabel2.text = @"我的收藏";
        funLabel2.font = [UIFont systemFontOfSize:13];
        funLabel2.textAlignment = NSTextAlignmentCenter;
        //funLabel2.backgroundColor = [UIColor redColor];
        [self addSubview:funLabel2];
        [funLabel2 release];

        
        UIView *thirdView = [[UIButton alloc]initWithFrame:CGRectMake(sized.width * 2/3, 0, sized.width/3, sized.height)];
        //thirdBtn.backgroundColor = [UIColor greenColor];
        [self addSubview:thirdView];
        [thirdView release];
        
        
        
        UIButton *funcIV3 = [[UIButton alloc]initWithFrame:CGRectMake(thirdView.center.x - 30, secView.center.y - 40, 60, 60)];
        [funcIV3 setBackgroundImage:[UIImage imageNamed:@"setting_Push.png"] forState:UIControlStateNormal];
        [self addSubview: funcIV3];
        [funcIV3 release];
        
        UILabel *funLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(thirdView.center.x - 30, sized.height - 30, 60, 20)];
        funLabel3.text = @"离线下载";
        funLabel3.font = [UIFont systemFontOfSize:13];
        funLabel3.textAlignment = NSTextAlignmentCenter;
        [self addSubview:funLabel3];
        [funLabel3 release];

        
        
    }

    return self;

}


- (void)collectClick:(UIButton*)sender{

    UIViewController *VC =[self viewController];
    myCollectViewController *mycollecVC =[[myCollectViewController alloc]init];
    
    DBManager *dbma = [DBManager shareDBManager];
    NSArray *allNetDaArr =  [dbma selectAllNetData];
    
    mycollecVC.netDataArr = [NSMutableArray arrayWithArray:allNetDaArr];
    [VC.navigationController pushViewController:mycollecVC animated:YES];
    [mycollecVC release];
    

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
