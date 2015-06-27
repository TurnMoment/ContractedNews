//
//  RegistAndLoadViewController.m
//  SpeedNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegistAndLoadViewController.h"
#import "EconomicViewController.h"
#import "RegisterViewController.h"
#import "PasswordViewController.h"
#import <UIKit/UIKit.h>


@interface RegistAndLoadViewController ()

@end




@implementation RegistAndLoadViewController

#pragma 登录/注册页面

- (void)viewDidLoad
{
    
    
    self.title = @"登陆/注册";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"微信",@"QQ",@"新浪微博", nil];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:arr];
    //[segment setTitle:@"微信" forSegmentAtIndex:0];
    
    [segment setImage:[[UIImage imageNamed:@"6.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forSegmentAtIndex:0];
    [segment setImage:[[UIImage imageNamed:@"7.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forSegmentAtIndex:1];
    [segment setImage:[[UIImage imageNamed:@"8.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forSegmentAtIndex:2];
    
    segment.backgroundColor = [UIColor whiteColor];
    segment.tintColor = [UIColor whiteColor];
    segment.frame = CGRectMake(20, 80, 280, 60);
    
    
    [segment addTarget:self action:@selector(segemtChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
    [segment release];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 185, 100, 0.2)];
    label.backgroundColor = [UIColor redColor];
    
    //label.alpha = 0;
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    [label release];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(155, 160, 50, 50)];
    label1.backgroundColor = [UIColor whiteColor];
    label1.text = @"或";
    //label1.alpha = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor purpleColor];
    [self.view addSubview:label1];
    [label1 release];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(210, 185, 100, 0.2)];
    label2.backgroundColor = [UIColor redColor];
    
    //label2.alpha = 0;
    [self.view addSubview:label2];
    [label2 release];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 250, 320, 300)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view release];
    
    UILabel *xianLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 320, 0.2)];
    xianLabel.backgroundColor = [UIColor purpleColor];
    
    //label.alpha = 0;
    xianLabel.textColor = [UIColor redColor];
    [view addSubview:xianLabel];
    [xianLabel release];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    img.backgroundColor = [UIColor whiteColor];
    img.image = [UIImage imageNamed:@"2.png"];
    [view addSubview:img];
    [img release];
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(60, 20, 250, 40)];
    text.placeholder = @"手机号/邮箱";
    text.backgroundColor = [UIColor whiteColor];
    text.borderStyle = UITextBorderStyleNone;
    text.delegate = self;
    [view addSubview:text];
    [text release];
    
    UILabel *xianLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 320, 0.2)];
    xianLabel1.backgroundColor = [UIColor purpleColor];
    
    //label.alpha = 0;
    xianLabel1.textColor = [UIColor redColor];
    [view addSubview:xianLabel1];
    [xianLabel1 release];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, 60, 40, 40)];
    image.backgroundColor = [UIColor whiteColor];
    image.image = [UIImage imageNamed:@"3.png"];
    [view addSubview:image];
    [image release];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(60, 60, 250, 40)];
    textField.placeholder = @"密码";
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleNone;
    textField.delegate = self;
    [view addSubview:textField];
    [textField release];
    
    UILabel *xianLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 320, 0.2)];
    xianLabel2.backgroundColor = [UIColor purpleColor];
    
    //label.alpha = 0;
    xianLabel2.textColor = [UIColor redColor];
    [view addSubview:xianLabel2];
    [xianLabel2 release];
    
    UITextField *textField1 = [[UITextField alloc]initWithFrame:CGRectMake(60, 100, 100, 40)];
    textField1.backgroundColor = [UIColor whiteColor];
    textField1.placeholder = @"验证码";
    textField1.delegate = self;
    textField1.borderStyle = UITextBorderStyleNone;
    [view addSubview:textField1];
    [textField1 release];
    
    UILabel *liuLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 100, 0.2, 40)];
    liuLabel.backgroundColor = [UIColor purpleColor];
    [view addSubview:liuLabel];
    [liuLabel release];
    
    
    UILabel *ziLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, 100, 60, 40)];
    ziLabel.backgroundColor = [UIColor whiteColor];
    ziLabel.text = @"ienvx";
    ziLabel.textAlignment = NSTextAlignmentCenter;
    ziLabel.font = [UIFont systemFontOfSize:20];
    [view addSubview:ziLabel];
    [ziLabel release];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(240, 100, 60, 40)];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"换一张" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    
    
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 150, 280, 40)];
    loginButton.backgroundColor = [UIColor cyanColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    //loginButton.alpha = 0.5;
    [loginButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButton) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:loginButton];
    
    
    UIButton *loginButton1 = [[UIButton alloc]initWithFrame:CGRectMake(60, 200, 100, 40)];
    loginButton1.backgroundColor = [UIColor cyanColor];
    loginButton1.alpha = 0.5;
    [loginButton1 setTitle:@"忘记密码" forState:UIControlStateNormal];
    [loginButton1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [loginButton1 addTarget:self action:@selector(loginButton1) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:loginButton1];
    
    UILabel *wangLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 200, 0.2, 40)];
    wangLabel.backgroundColor = [UIColor redColor];
    [view addSubview:wangLabel];
    [wangLabel release];
    
    
    UIButton *loginButton2 = [[UIButton alloc]initWithFrame:CGRectMake(180, 200, 100, 40)];
    loginButton2.backgroundColor = [UIColor cyanColor];
    //loginButton2.alpha = 0.5;
    [loginButton2 setTitle:@"立即注册" forState:UIControlStateNormal];
    [loginButton2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [loginButton2 addTarget:self action:@selector(loginButton2) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:loginButton2];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGPoint point = self.view.center;
    point.y -= 100;
    self.view.center = point;
    
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    CGPoint point = self.view.center;
    point.y += 100;
    self.view.center = point;
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
- (void)loginButton2
{
    RegisterViewController *RVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:RVC animated:YES];
    [RVC release];
    
    
}
- (void)loginButton1
{
    PasswordViewController *PVC =[[PasswordViewController alloc]init];
    [self.navigationController pushViewController:PVC animated:YES];
    [PVC release];
    
    
}
- (void)loginButton
{
    NSLog(@"iii");
    
}
- (void)changeValue
{
    NSLog(@"iei");
    
}
- (void)segemtChange:(UISegmentedControl *)sender
{
    NSLog(@"ii");
    
}


@end
