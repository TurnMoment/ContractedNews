//
//  HeadCell.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/7.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HeadCell.h"

static CGSize winSize = {0,0};

@interface HeadCell()

@property (nonatomic,assign)CGFloat height;

@end




@implementation HeadCell

- (void)dealloc{

    [_titleImage release];
    [_descripLabel release];
    [_commentLabel release];
    [_commentview release];
    [super dealloc];

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)windowSize reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selected  = NO;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
           
        winSize = windowSize;
        
        UIImageView *titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,windowSize.width, 60)];
        self.titleImage = titleImage;
        [self addSubview:titleImage];
        [titleImage release];
        
        
        UILabel *decripLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 60, windowSize.width - 10, 90)];
        self.descripLabel = decripLabel;
        decripLabel.font = [UIFont systemFontOfSize:15];
        decripLabel.numberOfLines = 0;
        [self addSubview:decripLabel];
        [decripLabel release];
        
        
        UILabel *comentabel = [[UILabel alloc]init];
        comentabel.numberOfLines = 0;
        comentabel.font = [UIFont systemFontOfSize:15];
        comentabel.textAlignment = NSTextAlignmentCenter;
        self.commentLabel = comentabel;
        comentabel.backgroundColor = [UIColor redColor];
        [self addSubview:comentabel];
        [comentabel release];
        
        
        UIImageView *comentView = [[UIImageView alloc]init ];
        comentView.backgroundColor = [UIColor redColor];
        self.commentview = comentView;
        [self addSubview:comentView];
        
        
        
    }

    return self;

}


- (void)setTitleImStr:(NSString *)titleImStr{

    if (_titleImStr != titleImStr) {
        [_titleImStr release];
        _titleImStr = [titleImStr retain];
    }
    
    [self getImage:_titleImStr];
    
    CGRect rectde = [self.descripLabel.text boundingRectWithSize:CGSizeMake(winSize.width - 10, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil ];
    CGRect fram = self.descripLabel.frame ;
    fram.size.height = rectde.size.height + 10;
    self.descripLabel.frame = fram;
    
    self.commentLabel.frame = CGRectMake(winSize.width - 80, self.descripLabel.frame.size.height + self.descripLabel.frame.origin.y, 40 , 20);
    self.commentview.frame  = CGRectMake(winSize.width - 40, self.descripLabel.frame.size.height + self.descripLabel.frame.origin.y, 40 , 20);
    
    CGFloat height = self.commentview.frame.origin.y + 30;
    self.height = height;
}












- (void)getImage:(NSString*)str{
    
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        UIImage *image =[UIImage imageWithData:data];
        self.titleImage.image = image;
        
    }];
    
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
