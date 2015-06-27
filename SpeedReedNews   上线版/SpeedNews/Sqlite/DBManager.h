//
//  DBManager.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/3.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetData.h"


@interface DBManager : NSObject


+ (DBManager*)shareDBManager;


//增
- (BOOL)instertNetData:(NetData *)netData;

//删
- (BOOL)deleteAllNetData;

- (BOOL)deleteNetDataByTitle:(NSString *)title;

- (NetData *)selectNetDataByTitle:(NSString*)title;

- (NSArray *)selectAllNetData;

//判断活动是否已经被收藏
- (BOOL)isFavorite:(NSString *)title;


@end
