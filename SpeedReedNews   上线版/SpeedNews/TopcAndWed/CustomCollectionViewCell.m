//
//  CustomCollectionViewCell.m
//  实验01
//
//  Created by lanou3g on 15/6/6.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (void)dealloc{
    [_imgeStr release];
    [_imageView release];
    [_titleLabel release];
    [super dealloc];

}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
              
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 20)];
        [self addSubview:_imageView];
        [_imageView release];
        
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height - 20, frame.size.width, 20)];
        _titleLabel.numberOfLines = 0 ;
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:_titleLabel];
        [_titleLabel release];
        
    }

    return self;

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
        self.imageView.image = image;
        
    }];
    
}









@end
