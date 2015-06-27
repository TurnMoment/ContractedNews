//
//  OpenViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "OpenViewController.h"

@interface OpenViewController ()

@end

@implementation OpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"速览新闻";
    page1.desc = @"欢迎关注速览新闻客户端,最新时事现在开始";
    page1.bgImage = [UIImage imageNamed:@"1.jpg"];
    page1.titleImage = [UIImage imageNamed:@"2.jpg"];
    
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"速览新闻概要";
    page2.desc = @"速览新闻持续跟新社会关注度最高的七大板块,是你掌握实时动态";
    page2.bgImage = [UIImage imageNamed:@"3.jpg"];
    page2.titleImage = [UIImage imageNamed:@"4.jpg"];
    
    
    EAIntroView *intro = [[EAIntroView alloc]initWithFrame:[UIScreen mainScreen].bounds andPages:@[page1,page2]];
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
    

    
    
    
    
    
    
    
    
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
