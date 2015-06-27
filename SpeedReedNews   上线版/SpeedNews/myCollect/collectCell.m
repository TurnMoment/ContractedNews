//
//  collectCell.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "collectCell.h"

#import "CacheManger.h"
#import "DBManager.h"


static CGSize mineSize = {0,0};
//static int count = 0;

@interface collectCell();

@property (nonatomic,copy)NSString *imageStr;


@end

@implementation collectCell

-(void)dealloc {
    
    [_deleCBtn release];
    [_lefeImage release];
    [_titleLabel release];
     [_netData release];
    [super dealloc];
    
}


- (void)imageDownloaderDidFilishLoading:(UIImage*)imge{
    
    self.lefeImage.image = imge;
    
    BOOL hasCache = [CacheManger fileExistInImageCacheFile:self.imageStr];
    if (!hasCache) {
        
        NSString *path = [CacheManger pathForCache:self.imageStr];
        NSMutableData *data = [NSMutableData data];
        NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
        [archive encodeObject:imge forKey:@"img"];
        [archive finishEncoding];
        [data writeToFile:path atomically:YES];
    }
    
    
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)size reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        mineSize = size;
                
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100, 80)];
        self.lefeImage = imageV;
        [self.contentView addSubview:imageV];
        [imageV release];
              
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 5, mineSize.width - 115 , 50)];
        titLabel.numberOfLines = 0;
         self.titleLabel = titLabel;
        //titLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:titLabel];
        [titLabel release];
        
        
        self.deleCBtn = [[UIButton alloc]init ];
        self.deleCBtn.frame = CGRectMake(mineSize.width-35, 60, 20, 30);
        [self.deleCBtn setBackgroundImage:[UIImage imageNamed:@"tb_lit_collected.png"] forState:UIControlStateNormal];
        [self.deleCBtn addTarget:self action:@selector(delelTBtn:) forControlEvents:UIControlEventTouchDown];
                [self addSubview:self.deleCBtn];
        [self.deleCBtn release];
        
        
    }
    return self;
    
}


- (void)delelTBtn:(UIButton*)sender{
    
    DBManager *dbM = [DBManager shareDBManager];
    
    BOOL resust = [dbM isFavorite:self.netData.title];
    
    if (resust) {
        [self.deleCBtn setBackgroundImage:[UIImage imageNamed:@"tb_lit_collect.png"] forState:UIControlStateNormal];        [dbM deleteNetDataByTitle:self.netData.title];
        
    }else{
        
        [self.deleCBtn setBackgroundImage:[UIImage imageNamed:@"tb_lit_collected.png"] forState:UIControlStateNormal];        [dbM instertNetData:self.netData];
        
    }

    
    
}





- (void)setNetData:(NetData *)netData {
    if (_netData != netData) {
        [_netData release];
        _netData = [netData retain];
        
    }
    
    self.titleLabel.text = netData.title;
    self.imageStr = netData.thumbnail;
    
    BOOL hasCache = [CacheManger fileExistInImageCacheFile:netData.thumbnail];
    if (!hasCache) {
        
        [ImageDownloading imageDownloaderWithUrlStr:netData.thumbnail delegate:self];
        
    }else{
        
        NSString *path = [CacheManger pathForCache:netData.thumbnail];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSKeyedUnarchiver *unAcher = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        self.lefeImage.image = [unAcher decodeObjectForKey:@"img"];
        
        
    }
    

    

    
    
    
}

@end
