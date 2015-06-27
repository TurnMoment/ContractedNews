//
//  NetData.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NetData.h"

@implementation NetData

- (void)dealloc {
    
    [_descripArr release];
    [_pageNumber release];
    [_images release];
    [_Id release];
    [_title release];
    [_thumbnail release];
    [_comments release];
    [_editTime release];
    [_source release];
    [_text release];
    [super dealloc];

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}



@end
