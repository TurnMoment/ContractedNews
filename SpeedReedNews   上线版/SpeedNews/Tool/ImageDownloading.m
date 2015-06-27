//
//  ImageDownloading.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ImageDownloading.h"

@implementation ImageDownloading

- (void)dealloc {

    [_urlStr release];
    [super dealloc];

}

- (id)initWithUrlString:(NSString*)urlStr{

    self = [super init];
    if (self) {
        _urlStr = [urlStr copy];
    }

    return self;


}
- (id)initWithUrlString:(NSString *)urlStr delegate:(id<ImageDownloaderDelegate>)delegate{

    self = [self initWithUrlString:urlStr ];
    if (self) {
        _delegate = delegate;
    }
    return self;

}

+ (ImageDownloading*)imageDownloaderWithUrlStr:(NSString*)urlStr delegate:(id<ImageDownloaderDelegate>)delegate{

    
    ImageDownloading *downloader = [[ImageDownloading alloc]initWithUrlString:urlStr delegate:delegate];

    [downloader startDownload];
    return [downloader autorelease];
}


- (void)startDownload{

    NSString *urlStr = _urlStr;
    NSURL *url = [NSURL URLWithString:urlStr];

    NSMutableURLRequest *resqust = [NSMutableURLRequest requestWithURL:url];
    [resqust setHTTPMethod:@"GET"];
    [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue  mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        UIImage *img = [[UIImage alloc]initWithData:data];
      
        
        if (_delegate != nil && [_delegate respondsToSelector:@selector(imageDownloaderDidFilishLoading:)]) {
            [_delegate imageDownloaderDidFilishLoading:img];
            [img release];
        }
       
        
    }];


}









@end
