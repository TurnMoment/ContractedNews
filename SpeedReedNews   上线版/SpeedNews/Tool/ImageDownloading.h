//
//  ImageDownloading.h
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageDownloaderDelegate <NSObject>

- (void)imageDownloaderDidFilishLoading:(UIImage*)imge;

@end


@interface ImageDownloading : NSObject

@property(nonatomic,copy)NSString *urlStr;

@property (nonatomic,assign)id<ImageDownloaderDelegate>delegate;


- (id)initWithUrlString:(NSString*)urlStr;
- (id)initWithUrlString:(NSString *)urlStr delegate:(id<ImageDownloaderDelegate>)delegate;

+ (ImageDownloading*)imageDownloaderWithUrlStr:(NSString*)urlStr delegate:(id<ImageDownloaderDelegate>)delegate;


- (void)startDownload;


@end
