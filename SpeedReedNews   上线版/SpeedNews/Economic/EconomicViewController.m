//
//  EconomicViewController.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "EconomicViewController.h"
#import "DetailEconViewController.h"
#import "ScrollImageCell.h"
#import "EconomicCell.h"
#import "ThreeCell.h"
#import "NetworkHander.h"
#import "HeadUrl.h"
#import "NetData.h"
#import "SetViewControll.h"
#import "MangImageViewController.h"
#import "MJRefresh.h"
#import "TopicViewController.h"
#import "HtmlTopDeViewController.h"


@interface EconomicViewController ()

@property (nonatomic,retain)NSMutableArray* secondNDArray;

@property (nonatomic,retain)NSMutableArray *secondNDArray2;

@property (nonatomic,assign)int pageNumber;

//用于为pageNumber替换的属性
@property(nonatomic ,retain)NetData *publicNetData;

@property(nonatomic ,retain)UISegmentedControl* seg;


@end


@implementation EconomicViewController


static int count = 2;


- (void)dealloc{
    
    [_secondNDArray release];
    [_secondNDArray2 release];
    [_seg release];
    [_publicNetData release];
    [_subjectStr release];
    [_netDataArray2 release];
    [_netDataArray release];
    [_mainDic release];
    [super dealloc];

}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self enterMainInterface];
    
}

- (void)enterMainInterface{

    self.secondNDArray = [NSMutableArray array];
    self.secondNDArray2 = [NSMutableArray array];
    
    [self defaultPage];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"三" style:UIBarButtonItemStylePlain target:self action:@selector(getsetVC:)];
    [leftBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    [leftBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateHighlighted];
    self.navigationItem.leftBarButtonItem = leftBtn;
    [leftBtn release];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width - 80, 40)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.tag = 100;
    
    self.navigationItem.titleView = scrollView;
    [scrollView release];
    
    
    NSMutableArray *segArray = [NSMutableArray arrayWithObjects:@"头条",@"娱乐",@"军事",@"经济",@"历史",@"科技",@"体育", nil];
    
    NSArray *infacArr = @[Headlines,Recreation,Military,Economic,History,Technology,Sports];
    self.mainDic = [NSMutableDictionary dictionaryWithObjects:infacArr forKeys:segArray];
   
    
    
    UISegmentedControl *seg = [[UISegmentedControl alloc ]initWithItems:segArray];
    [seg addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    CGRect rect = seg.frame;
    rect.origin.y  = 6;
    seg.frame = rect;
    
    self.seg = seg;
    seg.momentary = NO;
    seg.apportionsSegmentWidthsByContent = YES;
    [seg setTintColor:[UIColor clearColor]];
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    scrollView.contentSize = CGSizeMake(seg.frame.size.width+100, 40);
    [scrollView addSubview:seg];
    [seg release];


}




- (void)getsetVC:(UIBarButtonItem*)leftBtn{

    SetViewControll*setVC = [[SetViewControll alloc]init];
    
    CATransition* transition = [CATransition animation];
    
    transition.type = kCATransitionPush;//可更改为其他方式
    transition.subtype = kCATransitionFromLeft;//可更改为其他方式
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:setVC animated:NO];
    
    
}



- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
    
}



- (void)defaultPage{

    NSString *urlStr = Headlines;
    NSURL *url = [NSURL URLWithString:urlStr];
    NetworkHander *net = [NetworkHander currentNetworkHander];
    __block EconomicViewController *ecnoVC1 = self;
    [net getListWithURL:url compent:^(id list,id list2 ) {
        
        ecnoVC1.netDataArray = list;
        ecnoVC1.netDataArray2 = list2;
        
        ecnoVC1.publicNetData = [ecnoVC1.netDataArray objectAtIndex:0];
        ecnoVC1.pageNumber = [ecnoVC1.publicNetData.pageNumber intValue];
        
        [ecnoVC1.tableView reloadData];
        
        [ecnoVC1 dataFilishLoad];
    }];


}

//数据加载完成后才能刷新
- (void)dataFilishLoad{

    //上拉加载  下拉刷新
    [self addFooter];
    [self addHeader];

}





//下拉刷新
- (void)addHeader{

    __block EconomicViewController *ecoVC3 = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [ecoVC3 refreshData];
        [ecoVC3.tableView reloadData];
    }];
}


//刷新数据
- (void)refreshData{
    
      if (self.subjectStr == nil) {
         
       [self defaultPage];
       [self.tableView.header endRefreshing];
    }else{
        
    [self refreshSegValueChange:self.seg];
     [self.tableView.header endRefreshing];
    }
    
    
}



//上拉加载
- (void)addFooter{
    
    __block EconomicViewController *ecoVC = self;
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        
        if (self.subjectStr == nil) {
            self.subjectStr = @"头条";
            [ecoVC addData];
        }else{
        
        [ecoVC addData];
        
        }
        
        [ecoVC.tableView reloadData];
        
    }];



}

//加载数据
- (void)addData{
    
       NSRange range = {52,1};
        
        NSString *value = [self.mainDic valueForKey:self.subjectStr];
    
    NSString * fitStr = [value stringByReplacingCharactersInRange:range withString:@"&page=%d&"];
    
    if (count <= self.pageNumber)
    {
    NSString*  fullStr = [NSString stringWithFormat:fitStr,count];
       
    count++;
        
        NSURL *url = [NSURL URLWithString:fullStr];
        NetworkHander *net = [NetworkHander currentNetworkHander];
        EconomicViewController *ecnocVC3 = self;
        [net getListWithURL:url compent:^(id list,id list2 )
        {
            ecnocVC3.secondNDArray = list;
            ecnocVC3.secondNDArray2 = list2;
            [ecnocVC3 finshAddData];
        }];
    
    }
        [self.tableView.footer endRefreshing];
    
    


}

//下拉加载后存数组
- (void)finshAddData{

    [self.netDataArray addObjectsFromArray:self.secondNDArray];
    [self.netDataArray2 addObjectsFromArray:self.secondNDArray2];

}



- (void)dataURLRequestBy:(NSString*)urlStr{

    
    NSURL *url = [NSURL URLWithString:urlStr];
    NetworkHander *net = [NetworkHander currentNetworkHander];
    EconomicViewController *econoVC2 = self;
    [net getListWithURL:url compent:^(id list,id list2 ) {
        
        econoVC2.netDataArray = list;
        econoVC2.netDataArray2 = list2;
        
        econoVC2.publicNetData = [econoVC2.netDataArray objectAtIndex:0];
        econoVC2.pageNumber = [econoVC2.publicNetData.pageNumber intValue];
        
        [econoVC2.tableView reloadData];
        
    }];
        
        
    


}


- (void)refreshSegValueChange:(UISegmentedControl*)seg{

    NSString *urlStr = [self.mainDic valueForKey:self.subjectStr];
    
    [self dataURLRequestBy:urlStr];
    
    
}


- (void)valueChange:(UISegmentedControl*)seg{
    
    NSString *subjectStr  = [seg titleForSegmentAtIndex:[seg selectedSegmentIndex]];
    
    self.subjectStr = subjectStr;
    
   NSString *urlStr = [self.mainDic valueForKey:subjectStr];
    
    [self dataURLRequestBy:urlStr];
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.netDataArray.count == 0) {
        return 0;
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.netDataArray.count +1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
   
    if (indexPath.row == 0) {
        
        
        ScrollImageCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:@"ScrollImageCell"];
        
        if (!scrollCell) {
            scrollCell = [[ScrollImageCell alloc]initWithStyle:UITableViewCellStyleDefault withSize:self.tableView.frame.size reuseIdentifier:@"ScrollImageCell"];
            
        }
        
        scrollCell.netDataArray = self.netDataArray2;
        
        
        return scrollCell;
        
    }else {
        
        NetData *netData = [self.netDataArray objectAtIndex:indexPath.row - 1];
        NSArray * imagesArray = netData.images;
        
        if (!imagesArray)
        {
            EconomicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EconomicCell"];
            
            
            if (!cell) {
                cell = [[EconomicCell alloc]initWithStyle:UITableViewCellStyleSubtitle withSize:self.tableView.frame.size reuseIdentifier:@"EconomicCell"];
            }
            
            
            cell.netData = [self.netDataArray objectAtIndex:indexPath.row -1];
            
            return cell;
            
            
        }
        
        
        ThreeCell *threeCell = [tableView dequeueReusableCellWithIdentifier:@"threeCell"];
        
        if (!threeCell) {
            threeCell = [[ThreeCell alloc]initWithStyle:UITableViewCellStyleDefault withSize:self.tableView.frame.size reuseIdentifier:@"threeCell"];
        }
        
        threeCell.netData = netData;
        
        return threeCell;
    
    }
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0) {
        return 175;
    }else{
        
        NetData *netData = [self.netDataArray objectAtIndex:indexPath.row -1 ];
        NSArray * imagesArray = netData.images ;
        
        if (imagesArray) {
            
            return 120;
        }
        
        return 90;
        
    }
     

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NetData *netData = [self.netDataArray objectAtIndex:indexPath.row - 1];
    
       
    if ([netData.type isEqualToString:@"slide"]) {
        
        MangImageViewController *mangIVC = [[MangImageViewController alloc]init];
        mangIVC.netData = netData;
        [self.navigationController pushViewController:mangIVC animated:YES];
        [mangIVC release];
    }
    
    if ([netData.type isEqualToString:@"doc"]) {
        
        DetailEconViewController *detailEconVC = [[DetailEconViewController alloc]init];
        detailEconVC.netData = netData;
        [self.navigationController pushViewController:detailEconVC animated:YES];
        [detailEconVC release];
    
    }if ([netData.type isEqualToString:@"topic2"]) {
        
        [self pushTipicPageInface:netData.Id currentNetData:netData comments:netData.comments];
        
          
    }
    

}



- (void)pushTipicPageInface:(NSString*)inface currentNetData:(NetData *)netData comments:(NSString*)comments  {
    
   
    NSURL *url = [NSURL URLWithString:inface];
    NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (!data) {
            return ;
        }
        
        NSDictionary *allDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        if ([allDic valueForKey:@"body"] == nil) {
            HtmlTopDeViewController *htmlVC = [[HtmlTopDeViewController alloc]init];
            [self.navigationController pushViewController:htmlVC animated:YES];
            htmlVC.inface = netData.Id;
            
        }else{
            
            TopicViewController *tocVC = [[TopicViewController alloc]init];
            [self.navigationController pushViewController:tocVC animated:YES];
            tocVC.netData = netData;
            tocVC.comments = netData.comments;
            [tocVC release];

        }
            
    }];

     }







@end
