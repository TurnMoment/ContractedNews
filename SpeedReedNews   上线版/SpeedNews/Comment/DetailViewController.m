//
//  DetailViewController.m
//  快读新闻
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailView.h"
#import "NetworkHander.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)dealloc{


    [_netData release];

    [super dealloc];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DetailView *detaiVC = [[DetailView alloc]initWithFrame:self.view.frame];
    [self.view addSubview: detaiVC];
    detaiVC.titLabel.text = self.netData.title;
    [detaiVC release];
    
   //NSLog(@"$$$$$$$$$$$$$$$$$$%@",self.netData.Id);
    
       
    
    
    
    
    
}


-(void)setNetData:(NetData *)netData{

    if (_netData != netData) {
        [_netData release];
        _netData = [netData retain];
    }








}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
