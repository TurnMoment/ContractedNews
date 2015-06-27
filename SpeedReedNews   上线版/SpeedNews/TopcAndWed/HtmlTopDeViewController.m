//
//  HtmlTopDeViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HtmlTopDeViewController.h"

@interface HtmlTopDeViewController ()

@property (nonatomic,assign)NSData *data;

@property (nonatomic,retain)UIWebView*web;

@end

@implementation HtmlTopDeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%@",self.inface);
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self getHtmlData:self.inface];
    //NSURL *url = [NSURL URLWithString:self.inface];
    

    self.web = web;
    [self.view addSubview:web];
    [web release];
    
    
}

- (void)getHtmlData:(NSString*)str{

 NSURL *url = [NSURL URLWithString:str];
  NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
[NSURLConnection sendAsynchronousRequest:resqust queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
    
    NSString *str = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
   [self.web loadHTMLString:str baseURL:url];
  
}];


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
