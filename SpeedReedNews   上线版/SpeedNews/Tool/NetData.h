//
//  NetData.h
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetData : NSObject

//财经列表用属性
@property (nonatomic,copy)NSString*title;

@property (nonatomic,copy)NSString*pageNumber;

@property (nonatomic,copy)NSString*comments;

//一张图片cell图片地址，轮播图也是用的这个
@property (nonatomic,copy)NSString*thumbnail;

//三张并列图片用属性
@property (nonatomic,retain)NSMutableArray *images;

@property (nonatomic ,copy)NSString*type;


//财经详情页接口
@property (nonatomic,copy)NSString *Id;

//财经详情页属性
@property (nonatomic ,copy)NSString *editTime;

@property (nonatomic ,copy)NSString *source;

@property (nonatomic ,copy)NSString *text;


//三张并列图片详情页用属性
@property(nonatomic,retain)NSMutableArray*descripArr;


//标识活动是否被收藏过
@property (nonatomic, assign)BOOL isFavorite;


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;




@end
