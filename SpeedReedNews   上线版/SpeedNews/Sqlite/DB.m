//
//  DB.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/1.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DB.h"

@implementation DB

static sqlite3 *db = NULL;
//打开数据库
+ (sqlite3*)openDB{

    if (db) {
        return db;
    }
    NSString *path = [[NSBundle mainBundle]pathForResource:@"mydatabase" ofType:@"sqlite"];
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
//       NSLog(@"______++++++%@",docPath);
    
    docPath = [docPath stringByAppendingPathComponent:@"mydatabase.sqlite"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:docPath]) {
        [manager copyItemAtPath:path toPath:docPath error:nil];
    }
    
    //打开数据库文件
    int result = sqlite3_open(docPath.UTF8String, &db);
    if (result ==SQLITE_OK) {
        
      //  NSLog(@"打开数据库成功");

    }else{
    
      //  NSLog(@"打开数据库失败");
    
    }
    
    return db;
    
}

//关闭数据库
+ (void)closeDB{

    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        db = NULL;
      //  NSLog(@"数据库关闭成功");
    }else{
    
     //   NSLog(@"数据库关闭失败");
    }



}








@end
