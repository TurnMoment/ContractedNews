//
//  RegisterViewController.m
//  ifengDomo
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegisterViewController.h"

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册";
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 80, 40)];
    label.text = @"手机注册";
    label.textColor = [UIColor purpleColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:label];
    [label release];
    
    UITextField *text1 = [[UITextField alloc]initWithFrame:CGRectMake(20, 130, 280, 40)];
    text1.backgroundColor = [UIColor whiteColor];
    text1.borderStyle = UITextBorderStyleLine;
    text1.placeholder = @"仅限中国大陆地区手机号码";
    [self.view addSubview:text1];
    [text1 release];
    
    UITextField *text2 = [[UITextField alloc]initWithFrame:CGRectMake(20, 170, 140, 40)];
    text2.placeholder = @"验证码";
    text2.textAlignment = NSTextAlignmentLeft;
    text2.backgroundColor = [UIColor whiteColor];
    text2.borderStyle = UITextBorderStyleBezel;
    text2.tintColor = [UIColor purpleColor];
    [self.view addSubview:text2];
    [text2 release];
    
    UITextField *text3 = [[UITextField alloc]initWithFrame:CGRectMake(160, 170, 80, 40)];
    text3.backgroundColor = [UIColor cyanColor];
    text3.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:text3];
    [text3 release];
    
    UILabel *yanLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 40, 40)];
    yanLabel.text =@"xooe";
    [text3 addSubview:yanLabel];
    [yanLabel release];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(240, 170, 60, 40)];
    [button setTitle:@"换一张" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    //对勾图片
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 230, 20, 20)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview: view];
    
    UILabel *agreeLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 230, 200, 20)];
    agreeLabel.text = @"我同意服务条款";
    agreeLabel.textAlignment = NSTextAlignmentLeft;
    agreeLabel.backgroundColor = [UIColor whiteColor];
    agreeLabel.textColor = [UIColor blackColor];
    [self.view addSubview:agreeLabel];
    [agreeLabel release];
    
    UIButton *clickButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 260, 280, 50)];
    clickButton.backgroundColor = [UIColor blueColor];
    [clickButton setTitle:@"点击获取短信验证码" forState:UIControlStateNormal];
    [clickButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickButton];
    
    UILabel *mailboxLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 320, 200, 40)];
    mailboxLabel.backgroundColor = [UIColor whiteColor];
    mailboxLabel.text = @"或 邮箱注册 >>";
    mailboxLabel.textColor = [UIColor blackColor];
    [self.view addSubview:mailboxLabel];
    [mailboxLabel release];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(keyboardBack:)];
    [self.view addGestureRecognizer:tap];
    [tap release];
    
    
    
}
- (void)clickButton
{
    NSLog(@"点击获取");

}

- (void)login
{
    NSLog(@"换一张");

}

- (void)keyboardBack:(UITapGestureRecognizer*)tap{

    [self.view endEditing:YES];

}









@end
