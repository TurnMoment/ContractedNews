//
//  SetViewControll.m
//  SpeedNews
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SetViewControll.h"
#import "setFirstCell.h"
#import "SetHeadCell.h"

@interface SetViewControll ()

@end


static CGSize windowSize = {0,0};
@implementation SetViewControll
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad{

    
    windowSize = self.view.frame.size;
    self.tableView.scrollEnabled = NO;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:nil];
    [leftBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18]} forState:UIControlStateNormal];
   
    leftBtn.enabled = NO;
    self.navigationItem.leftBarButtonItem = leftBtn;
    [leftBtn release];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"三" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
    [rightBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    [rightBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [rightBtn release];
    
    UIView *weatherV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.navigationItem.titleView = weatherV;
    [weatherV release];
    
    UIButton *weatherBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [weatherBtn setBackgroundImage:[UIImage imageNamed:@"night_rain_mini@2x.png"] forState:UIControlStateNormal];
    [weatherBtn addTarget:self action:@selector(weatherClick:) forControlEvents:UIControlEventTouchDown];
    [weatherV addSubview:weatherBtn];
    [weatherBtn release];
    
  
}

- (void)weatherClick:(UIButton*)sender{


    NSLog(@"jinrutianqi");

}






- (void)goBack:(UIBarButtonItem*)sender{
    
    CATransition* transition = [CATransition animation];
    
    transition.type = kCATransitionPush;//可更改为其他方式
    transition.subtype = kCATransitionFromRight;//可更改为其他方式
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController popViewControllerAnimated:YES];

    
}

//cell不能选中
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        return 90;
    }
    return 50;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        SetHeadCell *setHCell = [tableView dequeueReusableCellWithIdentifier:@"setHCell"];
        
        if (!setHCell) {
           setHCell = [[SetHeadCell alloc]initWithSize:CGSizeMake(windowSize.width, 90) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"setHCell"];
        }
        
        return setHCell;
        
    }
        
    if (indexPath.row == 1) {
        setFirstCell *lockAccountcell = [tableView dequeueReusableCellWithIdentifier:@"lockAccount" ];
        
        if (!lockAccountcell) {
            
            lockAccountcell = [[setFirstCell alloc]initWithSize:CGSizeMake(self.tableView.frame.size.width, self.tableView.rowHeight) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"lockAccount" statuImage:[UIImage imageNamed:@"login_user.png"] subjectLabelName:@"账号绑定"EableShowArrowButton:YES EableShowThreeButton:NO EableShowRightSwith:NO cacheButtonStatu:nil EableShowCacheButton:NO];
            
        }
        
        return lockAccountcell;

    }
    if (indexPath.row == 2) {
        
        setFirstCell *newsPublicCell= [tableView dequeueReusableCellWithIdentifier:@"newsPublicCell"];
        if (!newsPublicCell) {
            newsPublicCell = [[setFirstCell alloc]initWithSize:CGSizeMake(self.tableView.frame.size.width, self.tableView.rowHeight) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsPublicCell" statuImage:[UIImage imageNamed:@"setting_pushSetting_night.png"] subjectLabelName:@"新闻推送" EableShowArrowButton:NO EableShowThreeButton:NO EableShowRightSwith:YES cacheButtonStatu:nil EableShowCacheButton:NO];
        }
        
        return newsPublicCell;
        
        
    }if (indexPath.row == 3) {
        
        setFirstCell *nightStatuCell= [tableView dequeueReusableCellWithIdentifier:@"nightStatu"];
        if (!nightStatuCell) {
            nightStatuCell = [[setFirstCell alloc]initWithSize:CGSizeMake(self.tableView.frame.size.width, self.tableView.rowHeight) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"nightStatuCell" statuImage:nil subjectLabelName:@"夜间免打扰" EableShowArrowButton:NO EableShowThreeButton:NO EableShowRightSwith:YES cacheButtonStatu:nil EableShowCacheButton:NO];
        }
        
        return nightStatuCell;
    }if (indexPath.row == 4) {
        
        setFirstCell *netKindCell= [tableView dequeueReusableCellWithIdentifier:@"nightStatu"];
        if (!netKindCell) {
            netKindCell = [[setFirstCell alloc]initWithSize:CGSizeMake(self.tableView.frame.size.width, self.tableView.rowHeight) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"netKindCell" statuImage:nil subjectLabelName:@"2G/3G无图模式" EableShowArrowButton:NO EableShowThreeButton:NO EableShowRightSwith:YES cacheButtonStatu:nil EableShowCacheButton:NO];
        }
        
        return netKindCell;

    }
    
        if (indexPath.row == 5) {
            setFirstCell *cacheCell = [tableView dequeueReusableCellWithIdentifier:@"cacheCell" ];
            
            if (!cacheCell) {
                
                
                cacheCell = [[setFirstCell alloc]initWithSize:CGSizeMake(self.tableView.frame.size.width, self.tableView.rowHeight) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"setFirst" statuImage:[UIImage imageNamed:@"trash.png"] subjectLabelName:@"清除缓存"EableShowArrowButton:NO EableShowThreeButton:NO EableShowRightSwith:NO cacheButtonStatu:@"123M" EableShowCacheButton:YES];
                
            }
            
            return cacheCell;
        
    }
    
    if
        (indexPath.row == 6) {
        setFirstCell *fountCell = [tableView dequeueReusableCellWithIdentifier:@"fountCell" ];
        
        if (!fountCell) {
            
            
            fountCell = [[setFirstCell alloc]initWithSize:CGSizeMake(self.tableView.frame.size.width, self.tableView.rowHeight) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"fountCell" statuImage:[UIImage imageNamed:@"font.png"] subjectLabelName:@"正文字体" EableShowArrowButton:NO EableShowThreeButton:YES EableShowRightSwith:NO cacheButtonStatu:nil EableShowCacheButton:NO];
            
        }
        
        return fountCell;
        
        }if
            (indexPath.row == 7) {
                setFirstCell *adviceCell = [tableView dequeueReusableCellWithIdentifier:@"adviceCell" ];
                
                if (!adviceCell) {
                    
            adviceCell = [[setFirstCell alloc]initWithSize:CGSizeMake(self.tableView.frame.size.width, self.tableView.rowHeight) withStyle:UITableViewCellStyleDefault reuseIdentifier:@"fountCell" statuImage:[UIImage imageNamed:@"1.jpg"] subjectLabelName:@"意见反馈" EableShowArrowButton:NO EableShowThreeButton:NO EableShowRightSwith:NO cacheButtonStatu:nil EableShowCacheButton:NO];
                    
                }
                
                return adviceCell;
            }
    
    return nil;
    
    
   }
    


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
