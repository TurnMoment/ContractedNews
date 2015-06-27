//
//  DB.h
//  SpeedNews
//
//  Created by lanou3g on 15/6/1.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DB : NSObject

//打开数据库
+ (sqlite3*)openDB;

//关闭数据库
+ (void)closeDB;





@end
