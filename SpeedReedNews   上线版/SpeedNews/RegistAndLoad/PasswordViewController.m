//
//  PasswordViewController.m
//  ifengDomo
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "PasswordViewController.h"
#import "LTView.h"
@implementation PasswordViewController
{
    LTView *_ltView;
    LTView *_ltView1;
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"找回密码";
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    scroll.contentSize = CGSizeMake(1000, 700);
    scroll.scrollEnabled = YES;
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.showsVerticalScrollIndicator = YES;
    
    scroll.backgroundColor = [UIColor blueColor];
    [self.view addSubview:scroll];
    [scroll release];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 80, 800, 450)];
    view.backgroundColor = [UIColor whiteColor];
        [scroll addSubview:view];
    [view release];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 30, 400, 50)];
    label.text = @"找回凤凰通行证密码";
    label.textColor  = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:24];
    [scroll addSubview:label];
    [label release];
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 200, 50)];
    label1.text = @"请填写您需要找回的账号：";
    label1.textColor  = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:15];
    [view addSubview:label1];
    [label1 release];
    
    
    _ltView = [[LTView alloc]initWithFrame:CGRectMake(30, 80, 400, 50) andLabeltext:@"账号" andPlaceholder:@"用户名/邮箱/手机号"];
    _ltView.backgroundColor = [UIColor cyanColor];
    [view addSubview:_ltView];
    [_ltView release];
    
    _ltView1 = [[LTView alloc]initWithFrame:CGRectMake(30, 140, 200, 50) andLabeltext:@"验证码" andPlaceholder:@""];
    _ltView1
    .backgroundColor = [UIColor cyanColor];
    [view addSubview:_ltView1];
    [_ltView1 release];
    
    
//     _ltView2=[[LTView alloc]initWithFrame:CGRectMake(240, 140, 200, 50) andLabeltext:@"iejc" andPlaceholder:@"换一张"];
//    _ltView2.backgroundColor = [UIColor redColor];
//
//    [view addSubview:_ltView2];
//    [_ltView2 release];
    
    UILabel *yanLabel = [[UILabel alloc]initWithFrame:CGRectMake(240,140, 100, 50)];
    yanLabel.backgroundColor = [UIColor redColor];
    yanLabel.text = @"ieinb";
    [view addSubview:yanLabel];
    [yanLabel release];
   
    UIButton *changeButton = [[UIButton alloc]initWithFrame:CGRectMake(340, 140, 100, 50)];
    changeButton.backgroundColor = [UIColor blueColor];
    [changeButton setTitle:@"换一张" forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changeButton) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:changeButton];
    
    
    
    
    
    
    
    UIButton *xiaButton = [[UIButton alloc]initWithFrame:CGRectMake(180, 220, 100, 50)];
    xiaButton.backgroundColor = [UIColor blueColor];
    [xiaButton setTitle:@"下一步" forState:UIControlStateNormal];
    [xiaButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [xiaButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:xiaButton];
    [xiaButton release];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyBoardBack)];
    [self.view addGestureRecognizer:tap];
    [tap release];
    
    
    

}
- (void)changeButton
{
    NSLog(@"jii");

}
- (void)keyBoardBack
{
    [_ltView.nameTextField resignFirstResponder];
    [_ltView1.nameTextField resignFirstResponder];
   
    

}
- (void)login
{

    NSLog(@"下一步");

}





@end
