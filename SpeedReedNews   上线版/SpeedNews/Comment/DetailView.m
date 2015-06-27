//
//  DetailView.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (void)dealloc{
    [_contentLabel release];
    [_titLabel release];
   
    [super dealloc];

}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentSize = CGSizeMake(frame.size.width, 1000);
        self.backgroundColor = [UIColor greenColor];
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5,frame.size.width - 10 , 60)];
        self.titLabel = titLabel;
        titLabel.numberOfLines = 0;
        titLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:titLabel];
        [titLabel release];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 70, frame.size.width -10, 200)];
        contentLabel.numberOfLines = 0;
        contentLabel.backgroundColor = [UIColor cyanColor];
        self.contentLabel = contentLabel;
        [self addSubview:contentLabel];
        [contentLabel release];
        
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(5, 280, frame.size.width -10, 200)];
        webView.backgroundColor = [UIColor cyanColor];
        webView.scalesPageToFit = YES;
        NSURLRequest *resqust = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.iclient.ifeng.com/ipadtestdoc?aid=98664454"]];
        
        [webView loadRequest:resqust];
        [self addSubview:webView];
              [webView release];

        
        
        
        
        
        
    }
    
    return self;


}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
