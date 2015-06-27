//
//  CacheManger.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManger : NSObject

+ (NSString*)cachePath;

+ (NSString*)downloadImageFileInCache;


+ (void)clearCache;


+ (BOOL)fileExistInImageCacheFile:(NSString*)fileName;

+ (NSString *)pathForCache:(NSString*)urlStr;



@end
