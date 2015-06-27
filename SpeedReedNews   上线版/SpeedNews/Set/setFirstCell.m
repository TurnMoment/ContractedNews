//
//  setFirstCell.m
//  SpeedNews
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "setFirstCell.h"

@implementation setFirstCell


- (void)dealloc{

    [_subName release];
    [super dealloc];

}





- (id)initWithSize:(CGSize)size withStyle:(UITableViewCellStyle)style
   reuseIdentifier:(NSString *)reuseIdentifier statuImage:(UIImage*)image subjectLabelName:(NSString*)subName EableShowArrowButton:(BOOL)showArrow  EableShowThreeButton:(BOOL)showButton  EableShowRightSwith:(BOOL)showSwith cacheButtonStatu:(NSString*)statu EableShowCacheButton:(BOOL)showCacheButton{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        
        self.subName = subName;
        
        
        
    UIImageView *statuImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7,30 ,30 )];
    statuImageView.image = image;
    //statuImageView.backgroundColor = [UIColor yellowColor];
    statuImageView.layer.cornerRadius = 15;
    statuImageView.layer.masksToBounds = YES;
    [self addSubview:statuImageView];
    [statuImageView release];
    
    UILabel *subLabel = [[UILabel alloc]initWithFrame:CGRectMake(60,size.height/2 + 12 , 150, 20)];
    subLabel.text = subName;
    [self addSubview:subLabel];
    [subLabel release];
    
        if (showArrow) {
            
            UIButton *arrowBtn = [[UIButton alloc]initWithFrame:CGRectMake( size.width - 60, size.height/2 + 10 , 30, 20)];
            [arrowBtn setBackgroundImage:[UIImage imageNamed:@"push.png"] forState:UIControlStateNormal];
            [arrowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:arrowBtn];
            [arrowBtn release];
            
            if ([self.subName isEqualToString:@"账号绑定"]) {
                
                [arrowBtn addTarget:self action:@selector(accountLock:) forControlEvents:UIControlEventTouchDown];
            }
            
            
            
            
        }
        
        
    if (showButton) {
        
        UIButton *firstButton = [[UIButton alloc]initWithFrame:CGRectMake(size.width - 120, size.height/2 + 12 , 30, 20)];
        [firstButton setTitle:@"小" forState:UIControlStateNormal];
        //firstButton.backgroundColor = [UIColor cyanColor];
        [self addSubview:firstButton];
        [firstButton release];
        
        UIButton *secondButton = [[UIButton alloc]initWithFrame: CGRectMake( size.width - 80, size.height/2 + 12 , 30, 20)];
        [secondButton setTitle:@"中" forState:UIControlStateNormal];
        //secondButton.backgroundColor = [UIColor cyanColor];
        [self addSubview:secondButton];
        [secondButton release];
        
        UIButton *thirdButton = [[UIButton alloc]initWithFrame:CGRectMake( size.width - 40, size.height/2 + 12 , 30, 20)];
        [thirdButton setTitle:@"大" forState:UIControlStateNormal];
        //thirdButton.backgroundColor = [UIColor cyanColor];
        [self addSubview:thirdButton];
        [thirdButton release];
        
        if ([self.subName isEqualToString:@"正文字体"]) {
            
            [firstButton addTarget:self action:@selector(smallFont:) forControlEvents:UIControlEventTouchDown];
            [secondButton addTarget:self action:@selector(mediumFont:) forControlEvents:UIControlEventTouchDown];
            [thirdButton addTarget:self action:@selector(bigFont:) forControlEvents:UIControlEventTouchDown];
            
            
        }
        
        
        
    }
    
    if (showSwith) {
        
        UISwitch *rightSwith = [[UISwitch alloc]initWithFrame:CGRectMake( size.width - 80, size.height/2 + 10 , 30, 20)];
        [self addSubview:rightSwith];
        [rightSwith release];
        
        if ([self.subName isEqualToString:@"新闻推送"]) {
            
            [rightSwith addTarget:self action:@selector(publicNews:) forControlEvents:UIControlEventValueChanged];
            
        }if ([self.subName isEqualToString:@"夜间免打扰"]) {
            [rightSwith addTarget:self action:@selector(nightStatu:) forControlEvents:UIControlEventValueChanged];
        }if ([self.subName isEqualToString:@"2G/3G无图模式"]) {
            [rightSwith addTarget:self action:@selector(netStatu:) forControlEvents:UIControlEventValueChanged];
        }
        
        
        
    }
    
    if (showCacheButton) {
        
        UIButton *cacheButton = [[UIButton alloc]initWithFrame:CGRectMake( size.width - 80, size.height/2 + 10 , 60, 30)];
        //cacheButton.backgroundColor = [UIColor yellowColor];
        [cacheButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cacheButton setTitle:statu forState:UIControlStateNormal];
        [self addSubview:cacheButton];
        [cacheButton release];
        
        if ([self.subName isEqualToString:@"清除缓存"]) {
            [cacheButton addTarget:self action:@selector(clearCachesStatu:) forControlEvents:UIControlEventTouchDown];
        }
        
        
        
        
    }
    
    
    
}
return self;


}


- (void)accountLock:(UIButton*)accountLock{

    NSLog(@"wode ");


}

- (void)publicNews:(UISwitch*)rightBtn{

    NSLog(@"新闻推送");

}

- (void)nightStatu:(UISwitch*)rightBtn{

    NSLog(@"夜间免打扰");

}

- (void)netStatu:(UISwitch*)rightBtn{

    NSLog(@"2G/3G无图模式");

}


- (void)clearCachesStatu:(UIButton*)clearCache{

    NSLog(@"缓存清理");

}

- (void)smallFont:(UIButton*)firstBtn{

    NSLog(@"小字体");

}

- (void)mediumFont:(UIButton*)secondBtn{
    NSLog(@"中号字体");

}

- (void)bigFont:(UIButton*)thirdBtn{

    NSLog(@"中号字体");

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
