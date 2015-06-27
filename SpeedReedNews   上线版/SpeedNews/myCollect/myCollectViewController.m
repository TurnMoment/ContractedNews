//
//  myCollectViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "myCollectViewController.h"
#import "NetData.h"
#import "DBManager.h"
#import "collectCell.h"
#import "DetailEconViewController.h"


@interface myCollectViewController ()

@property(nonatomic,retain)DBManager*dbma;

@end

CGFloat with = 0;
@implementation myCollectViewController

- (void)dealloc{
    [_netDataArr release];
    [_dbma release];
    [super dealloc];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    with = self.view.frame.size.width;
    
      
//    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tb_lit_collected.png"] style:UIBarButtonItemStylePlain target:self action:@selector(delegateAllCollect:)];
     UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(delegateAllCollect:)];
    
    
    DBManager *dbM = [DBManager shareDBManager];
    self.dbma = dbM;
    NSArray *arr = [dbM selectAllNetData];
    
    if (arr.count) {
        
       rightBtn.image = [[UIImage imageNamed:@"tb_lit_collected.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }else{
        
        rightBtn.image = [[UIImage imageNamed:@"tb_lit_collect.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }

        
        self.navigationItem.rightBarButtonItem = rightBtn;
    [rightBtn release];
    
    self.navigationItem.title = @"我的收藏";
}

- (void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden = NO;

}



- (void)delegateAllCollect:(UIBarButtonItem*)sender{

    NSArray *arr = [self.dbma selectAllNetData];
    if (arr.count) {
        
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"删除所有收藏" message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"确定", nil];
        [alerView show];
        
    }
    


}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
        
        //DBManager *dbma = [DBManager shareDBManager];
        [self.dbma deleteAllNetData];
        
        [self.netDataArr removeAllObjects];
        
        self.navigationItem.rightBarButtonItem.image = [[UIImage imageNamed:@"tb_lit_collect.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self.tableView reloadData];
        
    }



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"666666666%d",self.netDataArr.count);
    return self.netDataArr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    collectCell *collCell = [tableView dequeueReusableCellWithIdentifier:@"collectCell" ];
    if (!collCell) {
        collCell = [[collectCell alloc]initWithStyle:UITableViewCellStyleDefault withSize:CGSizeMake(with, 90) reuseIdentifier:@"collectCell"];
    }
    
    NetData *nedat = [self.netDataArr objectAtIndex:indexPath.row];
    
    collCell.netData = nedat;
         
    return collCell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 90;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

 NetData *netDa = [self.netDataArr objectAtIndex:indexPath.row];

    DetailEconViewController *detailVC = [[DetailEconViewController alloc]init];
    detailVC.netData = netDa;
       
    [self.navigationController pushViewController:detailVC animated:YES];
    [detailVC release];


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
