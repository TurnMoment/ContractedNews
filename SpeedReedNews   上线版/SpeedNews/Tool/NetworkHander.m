//
//  NetworkHander.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NetworkHander.h"
#import "NetData.h"
#import "DBManager.h"


@interface NetworkHander ()



@end



@implementation NetworkHander


- (void)dealloc {
    Block_release(_callBack);
    Block_release(_detailData);
    [super dealloc];

}

+ (NetworkHander*)currentNetworkHander{

    static NetworkHander *networkHander = nil;
    if (!networkHander) {
        networkHander = [[NetworkHander alloc]init];
        return networkHander;
    }

    return networkHander;

}




//列表页获取方法
- (void)getListWithURL:(NSURL*)url compent:(CallBack)callBack{
       
    self.callBack = callBack;
    __block NetworkHander *hander = self;
    NSMutableURLRequest *resqust = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue   mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data == nil) {
            return ;
        }
        
     NSMutableArray *allArray = [ NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *netDaArray1 = [[[NSMutableArray alloc]init]autorelease];
        
         NSDictionary *dic1 = [allArray objectAtIndex:0];
        
         NSString *pageNumber = [dic1 objectForKey:@"totalPage"];
       
            NSArray *itemArray1 = [dic1 objectForKey:@"item"];
            
            for (NSDictionary *dic in itemArray1) {
                
                NetData *netD = [[NetData alloc]init];
                netD.pageNumber = pageNumber;
                netD.thumbnail = [dic valueForKey:@"thumbnail"];
                netD.title = [dic valueForKey:@"title"];
                netD.Id = [dic valueForKey:@"id"];
                netD.comments = [dic valueForKey:@"comments"];
                netD.type = [dic valueForKey:@"type"];
                
                NSDictionary *styleDic = [dic valueForKey:@"style"];
                netD.images = [styleDic valueForKey:@"images"];
       
                [netDaArray1 addObject:netD];
                [netD release];
                
        }
        
        
            
            
        NSMutableArray *netDaArray2 = [[[NSMutableArray alloc]init]autorelease];
        if (allArray.count == 2) {
        
        NSDictionary *dic2 = [allArray objectAtIndex:1];
       
        NSArray *itemArray2 = [dic2 objectForKey:@"item"];
        
        for (NSDictionary *dic3 in itemArray2) {
            
            NetData *netD = [[NetData alloc]init];
            netD.thumbnail = [dic3 valueForKey:@"thumbnail"];
            
            netD.type = [dic3 valueForKey:@"type"];
            
            netD.title = [dic3 valueForKey:@"title"];
            netD.Id = [dic3 valueForKey:@"id"];
            netD.comments = [dic3 valueForKey:@"comments"];
            
            NSDictionary *styleDic = [dic3 valueForKey:@"style"];
            netD.images = [styleDic valueForKey:@"images"];
            
            
            [netDaArray2 addObject:netD];
            [netD release];
            
             }
        }
        
        hander.callBack(netDaArray1,netDaArray2);
             
    }];


}




- (NSString *)flattenHTML:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
    }
    
    return html;
}



//列详情页获取方法
- (void)getDetailPageWithURL:(NSURL*)url follow:(DetailData)detailData{
    
    if (!url) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    self.detailData = detailData;
    __block NetworkHander *hander = self;
        
    NSMutableURLRequest *resqust = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (!data) {
            return ;
        }
        
        NSDictionary *arrDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *bodyDic = [arrDic valueForKey:@"body"];
        
        NSArray *slidesArray = [bodyDic valueForKey:@"slides"];
         NetData *netData = [[NetData alloc]init];
         netData.images = [NSMutableArray array];
        netData.descripArr = [NSMutableArray array];
        for (NSDictionary *sliDic in slidesArray) {
            
        NSString *dedscrip = [sliDic valueForKey:@"description"];
            [netData.descripArr addObject:dedscrip];
            NSString *imageStr = [sliDic valueForKey:@"image"];
            [netData.images addObject:imageStr];
            netData.title = [sliDic valueForKey:@"title"];
                
        }
        
     
        netData.editTime = [bodyDic valueForKey:@"editTime"];
        netData.source = [bodyDic valueForKey:@"source"];
        NSString *allText = [bodyDic valueForKey:@"text"];
        netData.text = allText ;
        
        hander.detailData([netData autorelease]);
        
    }];
      
});

}


//专题的详情页方法
- (void)getTopicDetailPageWithURL:(NSURL*)url follow:(DetailData)detailData{

    if (!url) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        self.detailData = detailData;
        __block NetworkHander *hander = self;
        
        NSMutableURLRequest *resqust = [NSMutableURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            
            if (!data) {
                return ;
            }
            
            NSDictionary *arrDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary *bodyDic = [arrDic valueForKey:@"body"];
            NetData *netData = [[NetData alloc]init];
            
            netData.Id = [bodyDic valueForKey:@"videoSrc"];
            netData.title = [bodyDic valueForKey:@"title"];
            netData.editTime = [bodyDic valueForKey:@"editTime"];
            netData.source = [bodyDic valueForKey:@"source"];
            NSString *allText = [bodyDic valueForKey:@"text"];
            netData.text = allText ;
            
            hander.detailData([netData autorelease]);
            
        }];
        
    });
    
}




@end
