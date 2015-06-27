//
//  EconomicCell.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "EconomicCell.h"
#import "CacheManger.h"



static CGSize mineSize = {0,0};

@interface EconomicCell();

@property (nonatomic,copy)NSString *imageStr;


@end

@implementation EconomicCell

-(void)dealloc {
    
    [_markLabel release];
    [_commentView release];
    [_lefeImage release];
    [_titleLabel release];
    [_commentLabel release];
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
        
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100, 80)];
        self.lefeImage = imageV;
        [self.contentView addSubview:imageV];
        [imageV release];
        
      
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 5, size.width - 110 , 60)];
        titLabel.numberOfLines = 0;
        self.titleLabel = titLabel;
        [self.contentView addSubview:titLabel];
        [titLabel release];
        
        
        UILabel *comentabel = [[UILabel alloc]initWithFrame:CGRectMake(size.width - 80, 60, 40 , 20)];
        comentabel.numberOfLines = 0;
        comentabel.font = [UIFont systemFontOfSize:13];
        comentabel.textAlignment = NSTextAlignmentCenter;
        self.commentLabel = comentabel;
        [self.contentView addSubview:comentabel];
        [comentabel release];
        
        
        UIImageView *comentView = [[UIImageView alloc]initWithFrame:CGRectMake(size.width - 45, 60, 30, 20)];
        self.commentView = comentView;
        [self.contentView addSubview:comentView];
        [comentView release];
        
        
        UILabel *markLabel = [[UILabel alloc]init ];
        markLabel.frame = CGRectMake(mineSize.width-15, 60, 15, 30);
        self.markLabel = markLabel;
        markLabel.numberOfLines = 0;
        markLabel.font = [UIFont systemFontOfSize:12];
        markLabel.textColor = [UIColor blackColor];
        [self addSubview:markLabel];
        [markLabel release];
        
        
    }
    return self;

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
    
    
    
    if ([netData.type isEqualToString:@"doc"]) {
        
        self.markLabel.text = nil;
        self.markLabel.backgroundColor = [UIColor clearColor];
        NSString *comem = [NSString stringWithFormat:@"%@",netData.comments];
        
        if ([comem isEqualToString:@"0"])
        {
            self.commentLabel.text = nil;
            self.commentView.image = nil;
            
        }if (![comem isEqualToString:@"0"]&&comem ) {
            
            self.commentLabel.text = comem;
            self.commentView.image = [UIImage imageNamed:@"nav7_blueCommentCount.png"];
            
        }

        
    }
    
    if ([netData.type isEqualToString:@"topic2"]) {
        
        self.markLabel.text = @"专题";
        self.markLabel.backgroundColor = [UIColor redColor];
        
    }
        if ([netData.type isEqualToString:@"text_live"]) {
        self.markLabel.text = @"直播";
        self.markLabel.backgroundColor = [UIColor redColor];
        
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
