//
//  ThreeCell.m
//  SpeedNews
//
//  Created by lanou3g on 15/5/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ThreeCell.h"
#import "CacheManger.h"

@implementation ThreeCell

- (void)dealloc{
    [_imagesArray release];
    [_titleLabel release];
    [_netData release];
    [_oneImageView release];
    [_twoImageView release];
    [_threeImageView release];
    [super dealloc];

}


- (void)imageDownloaderDidFilishLoading:(UIImage*)imge{

    
    [self.imagesArray addObject:imge];
    
    if (self.imagesArray.count == self.netData.images.count) {
       
        self.oneImageView.image = self.imagesArray[0];
        self.twoImageView.image = self.imagesArray[1];
        self.threeImageView.image = self.imagesArray[2];
        
    }



}



- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)fram reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"threeCell"];
    if (self) {
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, fram.width - 20, 20)];
        //titLabel.backgroundColor = [UIColor yellowColor];
        self.titleLabel = titLabel;
        titLabel.text = @"hujfjdhsfjdhsbnbdfv";
        [self.contentView addSubview:titLabel];
        [titLabel release];
        
        UIImageView *oneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,30, (fram.width-30)/3, 80)];
        self.oneImageView = oneImageView;
        oneImageView.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:oneImageView];
        [oneImageView release];
        
        UIImageView *twoImageView = [[UIImageView alloc]initWithFrame:CGRectMake((fram.width-30)/3 + 15 ,30, (fram.width-30)/3, 80)];
        self.twoImageView = twoImageView;
        twoImageView.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:twoImageView];
        [twoImageView release];
        
        UIImageView *threeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2*(fram.width-30)/3 + 20,30, (fram.width-30)/3, 80)];
        self.threeImageView = threeImageView;
        threeImageView.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:threeImageView];
        [threeImageView release];
        
        
        
    }

    return self;


}


- (void)setNetData:(NetData *)netData{

    if (_netData != netData) {
        [_netData release];
        _netData = [netData retain];
    }

    self.titleLabel.text = netData.title;
    
    self.imagesArray = [NSMutableArray array];
    
    for (int i = 0; i < netData.images.count; i++) {
        
        
        
        [ImageDownloading imageDownloaderWithUrlStr:netData.images[i] delegate:self];
    }
    
      
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
