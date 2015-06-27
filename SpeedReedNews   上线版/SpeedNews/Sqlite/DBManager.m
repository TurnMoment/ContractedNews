//
//  DBManager.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/3.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DBManager.h"
#import "DB.h"



@implementation DBManager


+ (DBManager*)shareDBManager{
    
static DBManager *shareDBManager = nil;
    
    if (shareDBManager == nil) {
        shareDBManager = [[DBManager alloc]init];
        
    }

    return shareDBManager;

}


//增
- (BOOL)instertNetData:(NetData *)netData{

    sqlite3 *db = [DB openDB];
    
    NSString *sql = [NSString stringWithFormat:@"insert into name values('%@','%@','%@','%@','%@','%@')",netData.title,netData.pageNumber,netData.comments,netData.thumbnail,netData.type,netData.Id];
    //NSLog(@"1111111%@",netData);
    
    
    //3、执行sql语句
    int resulte = sqlite3_exec(db, sql.UTF8String, nil, nil, nil);
    [DB closeDB];
   
    if (resulte == SQLITE_OK) {
        return YES;
    }else {
    
        return NO;
    
    
    }
    
}

//删
- (BOOL)deleteAllNetData{
    //1、打开数据库
    sqlite3 *db = [DB openDB];
    //2、准备sql语句
    NSString *sql = [NSString stringWithFormat:@"delete from name"];
    //3、执行sql语句
    int result = sqlite3_exec(db , sql.UTF8String, nil, nil, nil);
    //4、关闭数据库
    [DB closeDB];
    if (result == SQLITE_OK) {
        return  YES;
        
    }else {
    
        return NO;
    }


}

- (BOOL)deleteNetDataByTitle:(NSString *)title{

//    NSLog(@"%@",title);
    sqlite3 *db = [DB openDB];
    NSString *sql = [NSString stringWithFormat:@"delete from name where title = '%@'",title];
    int result = sqlite3_exec(db, sql.UTF8String, nil, nil, nil);
    [DB closeDB];
    if (result == SQLITE_OK) {
        return YES;
    }else{
    
        return NO;
    }
    
}

- (NetData *)selectNetDataByTitle:(NSString*)title{
    //1、打开数据库
    sqlite3 *db = [DB openDB];
     //2、准备sql
    NSString *sql = @"select *from name where title = ?";
    //3、创建跟随指针
    sqlite3_stmt *stmt = nil;
    //4、判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
    if (result == SQLITE_OK) {
        //sql语句正确
        //绑定‘？’处的值
    sqlite3_bind_text(stmt,1, title.UTF8String, -1, nil);
        
        //5、获取返回结果
    int stepResult = sqlite3_step(stmt);
        
    NetData *netData = [[NetData alloc]init];
    if (stepResult == SQLITE_ROW) {
        
        //成功取出数据
        netData.title = [self getStringFromStmt:stmt withColumIndex:1];
        netData.pageNumber = [self getStringFromStmt:stmt withColumIndex:2];
        netData.comments = [self getStringFromStmt:stmt withColumIndex:3];
       netData.thumbnail = [self getStringFromStmt:stmt withColumIndex:4];
        netData.type = [self getStringFromStmt:stmt withColumIndex:5];
       netData.Id = [self getStringFromStmt:stmt withColumIndex:6];
        netData.isFavorite = YES;
        
    }
        sqlite3_finalize(stmt);
        return [netData autorelease];
        
    }else{
    
        sqlite3_finalize(stmt);
         //sql语句不正确
    
    }
    
    
      return nil;
}

- (NSArray *)selectAllNetData{
    
    //1、打开数据库
    sqlite3* db = [DB openDB];
    NSString *sql = @"select *from name";
    
    //3、创建跟对指针
    sqlite3_stmt *stmt = nil;
    //4、判断sql是否正确
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
    
    if (result == SQLITE_OK) {
        //如果sql正确
        
        //5、创建数组用于存放数据对象
        NSMutableArray *netDataArray = [NSMutableArray array];
        
        //6、单步执行，获取每一个结果
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            NetData *netData = [[NetData alloc]init];
            
            netData.title = [self getStringFromStmt:stmt withColumIndex:0];
            netData.pageNumber = [self getStringFromStmt:stmt withColumIndex:1];
            netData.comments = [self getStringFromStmt:stmt withColumIndex:2];
            netData.thumbnail = [self getStringFromStmt:stmt withColumIndex:3];
            netData.type = [self getStringFromStmt:stmt withColumIndex:4];
            netData.Id = [self getStringFromStmt:stmt withColumIndex:5];
                     
            //从数据库搜索出来的活动肯定是被收藏过的
            netData.isFavorite = YES;
            [netDataArray addObject:netData];
            [netData release];
            
            
        }
        
        sqlite3_finalize(stmt);
        
        return netDataArray;
        
    }
    sqlite3_finalize(stmt);
    return nil;
    
}



- (NSString*)getStringFromStmt:(sqlite3_stmt*)stmt withColumIndex:(int)coloum{

    const char *str = (const char*)sqlite3_column_text(stmt,coloum);
    if (str) {
        NSString *reStr = [NSString stringWithUTF8String:str];
        return reStr;
    }else{
    
        return nil;
    
    }


}



//判断活动是否已经被收藏
- (BOOL)isFavorite:(NSString *)title{
    NetData *netData1 = [self selectNetDataByTitle:title];
    //NSLog(@"title = %@",netData1.title);
    if (!netData1.title) {
        return NO;
    }else{
    
     return YES;
    }

   

}


@end
