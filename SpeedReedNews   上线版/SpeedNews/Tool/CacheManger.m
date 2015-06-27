//
//  CacheManger.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CacheManger.h"

@implementation CacheManger

//获取cache路径
+ (NSString*)cachePath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    return path;
  
}

//获取cache路径下downloadImage文件夹
+ (NSString*)downloadImageFileInCache{
    NSString *cachePath = [self cachePath];
    NSString *imgCacheFile = [cachePath stringByAppendingPathComponent:@"DownloadImage"];
    NSFileManager *manger = [NSFileManager defaultManager];
    if (![manger fileExistsAtPath:imgCacheFile]) {
        [manger createDirectoryAtPath:imgCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
    }

    return imgCacheFile;

}


+ (void)clearCache{

    NSString *imageCachPath = [self downloadImageFileInCache];
    NSFileManager *manger = [NSFileManager defaultManager];
    [manger removeItemAtPath:imageCachPath error:nil];

}



+ (BOOL)fileExistInImageCacheFile:(NSString*)fileName{
   NSString *realPath =  [self pathForCache:fileName];
    NSFileManager *manger = [NSFileManager defaultManager];
    if ([manger fileExistsAtPath:realPath]) {
        return YES;
        
    }else{
    
     return NO;
    
    }

}

//传入一个url地址，返回在DownloadImage文件夹下的路径
+ (NSString *)pathForCache:(NSString*)urlStr{
    
    NSString *lastPath = [urlStr lastPathComponent];
    NSString *downloadImageFilePath = [self downloadImageFileInCache];
    NSString *fullPath = [downloadImageFilePath stringByAppendingPathComponent:lastPath];
    return fullPath;

}







@end
