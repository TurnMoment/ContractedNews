//
//  NetworkHander.h
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CallBack)(id,id);

typedef void (^DetailData)(id);



@interface NetworkHander : NSObject

@property (nonatomic,copy)CallBack callBack;


@property (nonatomic,copy)DetailData detailData;


+ (NetworkHander*)currentNetworkHander;

//列表页数据获取
- (void)getListWithURL:(NSURL*)url compent:(CallBack)callBack;






//详情页数据获取

- (void)getDetailPageWithURL:(NSURL*)url follow:(DetailData)detailData;

//专题详情页获取方法;
- (void)getTopicDetailPageWithURL:(NSURL*)url follow:(DetailData)detailData;



@end
