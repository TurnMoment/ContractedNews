//
//  TopicViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/4.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "TopicViewController.h"
#import "EconomicCell.h"
#import "NetworkHander.h"
#import "NetData.h"
#import "TopicCell.h"
#import "HeadCell.h"
#import "TopicDetailViewController.h"
#import "NavView.h"



@interface TopicViewController ()


@property (nonatomic,assign)CGFloat TVColumnHeight;

@property (nonatomic,assign)int numberItem;

@property (nonatomic,retain)NSArray *TVArray;

@property (nonatomic ,retain)UITableView *listTaView;



@property (nonatomic,retain)UIView *navView;

@property (nonatomic,retain)UISegmentedControl*segment;

@property (nonatomic,retain)UIView*commentView;


@end


static CGSize windowSize = {0,0};

@implementation TopicViewController

-(void)dealloc {

    [_commentView release];
    [_mainDic release];
    [_TVArray release];
    [_listTaView release];
    [_navView release];
    [_segment release];
    [super dealloc];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *url = self.netData.Id;
    [self gettipicList:url];
    
     windowSize = self.view.frame.size;
    
    UIView *statuView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, windowSize.width, 20)];
    statuView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:statuView];
    [statuView release];
    
    
    NavView *nav = [[NavView alloc]initWithFrame:CGRectMake(0,windowSize.height - 44, windowSize.width, 44) controller:self netData:self.netData typeIstopic:YES];
    self.navView = nav;
    nav.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nav];
    [nav release];

     
      
    
    
}



- (void)addTabelView{
    
    
[self.array removeObjectsInArray:@[@"intro",@"customBanner",@"album",@"bgImage",@"slider"]];
    for (int i = 0; i < self.array.count; i++) {
        NSString *str = [self.array objectAtIndex:i];
        if ([str isEqualToString:@""]) {
            [self.array removeObject:str];
        }
        
    }
    
    NSArray *TVArr = [self.mainDic valueForKey:@"视频报道"];
    self.TVArray = TVArr;
    self.numberItem = (int)TVArr.count;
    CGFloat itemHeight = (windowSize.width - 10)/3 - 30;
    
    self.TVColumnHeight = ((self.numberItem + 2)/3 ) * (itemHeight + 10)+ 10 ;
    
    NSArray  *allKey =   [self.mainDic allKeys];
    
    if (allKey) {
        
    UITableView *listTaView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20,windowSize.width, windowSize.height - 20)];
    [self.view addSubview:listTaView];
    self.listTaView = listTaView;
    listTaView.delegate = self;
    listTaView.dataSource = self;
    [listTaView release];
        
  }

    [self.view addSubview:self.navView];
}






- (void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden = YES;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

      return self.array.count + 1;
   
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section != 0) {
         return [self.array objectAtIndex:section - 1];
    }else{
    
        return nil;
    
    }
   


}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    if (section == 0) {
        return 1;
    }else{
    
        NSString *key =  [self.array objectAtIndex:section - 1];

    if ([key isEqualToString:@"视频报道"]) {
        return 1;
    }else{
    
     NSMutableArray *arr =  [self.mainDic valueForKey:key];
      return arr.count;
    }
    
    }
        
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        HeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
        if (!headCell) {
            headCell = [[HeadCell alloc]initWithStyle:UITableViewCellStyleDefault withSize:windowSize reuseIdentifier:@"headCell"];
        }
       
        NSString *descriL = [self.mainDic valueForKey:@"intro"];
        
        headCell.commentview.image = [UIImage imageNamed:@"nav7_blueCommentCount.png"];
        headCell.commentLabel.text = self.comments;
        headCell.descripLabel.text = descriL;
        headCell.titleImStr = [self.mainDic valueForKey:@"bgImage"];
        
        return headCell;
        
    }else{
    
    NSString *key = [self.array objectAtIndex:indexPath.section - 1];
    NSString *lastKey = [self.array lastObject];
     NetData *netData = [[self.mainDic valueForKey:key]objectAtIndex:indexPath.row ];
    
    if (![key isEqualToString:@"视频报道"] && ![key  isEqualToString:lastKey ]) {
        
        
        EconomicCell *ecCell = [tableView dequeueReusableCellWithIdentifier:@"ecCell"];
        if (!ecCell) {
            ecCell = [[EconomicCell alloc]initWithStyle:UITableViewCellStyleDefault withSize:windowSize reuseIdentifier:@"ecCell"];
            
        }
        
        ecCell.netData = netData;
        return ecCell;

        
    }if ([key  isEqualToString:lastKey ]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
        }
        cell.textLabel.text = netData.title;
        cell.textLabel.numberOfLines = 0;

        CGRect rect = [netData.text boundingRectWithSize:CGSizeMake(windowSize.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        CGRect fram = cell.textLabel.frame;
        fram.size.height = rect.size.height ;
        cell.textLabel.frame = fram;
            
        return cell;

    }if ([key isEqualToString:@"视频报道"]) {
        
        NSString *ID = @"topicCell";
        TopicCell *topicCell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!topicCell) {
            topicCell = [[TopicCell alloc]initWithStyle:UITableViewCellStyleDefault withSize:CGSizeMake(windowSize.width, self.TVColumnHeight) reuseIdentifier:ID];
            
        }
        
        topicCell.TVarray = self.TVArray;
        topicCell.numberItem = self.numberItem;
        
        return topicCell;
        
    }
      
    
    }
    
    return nil;
    
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 190;
    }else{
    
    
     NSString *key =  [self.array objectAtIndex:indexPath.section - 1];
    
    if ([key isEqualToString:@"视频报道"]) {
        
       return  self.TVColumnHeight;
        
    }if ([key isEqualToString:[self.array lastObject]]) {
        
        return 60;
    }
    
    
    else{
        
       return 90;
    }

    }
    

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString*key =  [self.array objectAtIndex:indexPath.section - 1];
    NSArray *arr =  [self.mainDic valueForKey:key];
    NetData *netda = [arr objectAtIndexedSubscript:indexPath.row];
        
    TopicDetailViewController *top = [[TopicDetailViewController alloc]init];
    top.netData = netda;
    [self.navigationController pushViewController:top  animated:YES];
    [top release];

}


- (void)gettipicList:(NSString*)str {

      NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (!data) {
            return ;
        }
        
       NSDictionary *allDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
            
       NSDictionary *bodyDic = [allDic valueForKey:@"body"];
       NSArray *subjectsArr= [bodyDic valueForKey:@"subjects"];
        
        
        self.mainDic  = [NSMutableDictionary dictionary];
        self.array = [NSMutableArray array];
        
        for (int i = 0; i < subjectsArr.count; i++) {
            NSDictionary* suChDic = [subjectsArr objectAtIndex:i];
            
            NSString *view = [suChDic valueForKey:@"view"];
            NSString *itemTitle = [suChDic valueForKey:@"title"];
            NSArray *poditemArr =  [suChDic valueForKey:@"podItems"];

            if (itemTitle) {
                
                NSMutableArray * itemArr = [[NSMutableArray alloc]init];
                
                for (NSDictionary * podchDic in poditemArr) {
                    NetData  *netdata = [[NetData alloc]init];
                    
                    NSArray *linksArr = [podchDic valueForKey:@"links"];
                    for (NSDictionary *likChDic in linksArr) {
                        
                     netdata.Id = [likChDic valueForKey:@"url"];
                        
                    }
                    
                    
                    netdata.title =   [podchDic valueForKey:@"title"];
                    netdata.editTime = [podchDic valueForKey:@"updateTime"];
                    netdata.comments = [podchDic valueForKey:@"commentCount"];
                    netdata.thumbnail = [podchDic valueForKey:@"thumbnail"];
                    netdata.type = [podchDic valueForKey:@"style"];
                    netdata.source = [podchDic valueForKey:@"source"];
                    [itemArr addObject:netdata];
                    [netdata release];
                    
                }
                [self.array addObject:itemTitle];
                [self.mainDic setValue:itemArr forKey:itemTitle];
                [itemArr release];
                
            }if (!itemTitle &&[view isEqualToString:@"multiTitle"]) {
                NSDictionary *contDic =  [suChDic valueForKey:@"content"];
                NSString *bgImage  = [contDic valueForKey:@"bgImage"];
                NSString *customBanner = [contDic valueForKey:@"customBanner"];
                
                [self.array addObject:@"bgImage"];
                [self.array addObject:@"customBanner"];
                [self.mainDic setValue:bgImage forKey:@"bgImage"];
                [self.mainDic setValue:customBanner forKey:@"customBanner"];
                
            }if ([itemTitle isEqualToString:@""] && [view isEqualToString:@"text"] ) {
                

                NSDictionary *contentDic =  [suChDic valueForKey:@"content"];
               
                NSString *intro = [contentDic valueForKey:@"intro"];
                
                [self.mainDic setValue:intro forKey:@"intro"];
                [self.array addObject:@"intro"];
                
            }if ([itemTitle isEqualToString:@""] &&[view isEqualToString:@"slider"]) {
                
                NSMutableArray * itemArr = [[NSMutableArray alloc]init];
                for (NSDictionary * podchDic in poditemArr) {
                    NetData *netdata = [[NetData alloc]init];
                    
                    netdata.title =   [podchDic valueForKey:@"title"];
                    netdata.editTime = [podchDic valueForKey:@"updateTime"];
                    netdata.comments = [podchDic valueForKey:@"commentCount"];
                    [itemArr addObject:netdata];
                    [netdata release];
                    
                }
                [self.array addObject:@"slider"];
                [self.mainDic setValue:itemArr forKey:@"slider"];
                [itemArr release];
        }
            
            
         if ([view isEqualToString:@"album"]&& itemTitle) {
             
             NSMutableArray * itemArr = [[NSMutableArray alloc]init];

                for (NSDictionary * podchDic in poditemArr) {
                    NetData *netdata = [[NetData alloc]init];
                    
                    netdata.title =   [podchDic valueForKey:@"title"];
                    netdata.editTime = [podchDic valueForKey:@"updateTime"];
                    netdata.comments = [podchDic valueForKey:@"commentCount"];
                    netdata.thumbnail = [podchDic valueForKey:@"thumbnail"];
                    netdata.type = [podchDic valueForKey:@"style"];
                    netdata.source = [podchDic valueForKey:@"source"];
                    
                    [itemArr addObject:netdata];
                    [netdata release];
                }
             
             [self.array addObject:@"album"];
             [self.mainDic setValue:itemArr forKey:@"album"];
             [itemArr release];
             
            }
            
            
        }
        
        [self addTabelView];
        
 
            
            
       }];



}



- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGPoint offSet = *targetContentOffset;
    
    if (offSet.y>0) {
        
         self.navView.frame = CGRectMake(0, windowSize.height, windowSize.width, 44);
        
    }else{
        
         self.navView.frame = CGRectMake(0, windowSize.height - 44,windowSize.width , 44);
        
    }
    
    
}







@end
