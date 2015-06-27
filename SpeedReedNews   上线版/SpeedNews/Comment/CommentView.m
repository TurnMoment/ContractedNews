//
//  CommentView.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CommentView.h"
#import "RegistAndLoadViewController.h"


static CGSize winSize = {0,0};

@implementation CommentView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        winSize = frame.size;
 
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *comentView =[[UIView alloc]initWithFrame:CGRectMake(0,winSize.height - 240, winSize.width, 240)];
        comentView.backgroundColor = [UIColor whiteColor];
        //self.commentView = comentView;
        [self addSubview:comentView];
        [comentView release];
        
        UIButton *closebutton = [UIButton buttonWithType:UIButtonTypeCustom];
        closebutton.frame = CGRectMake(0, 0, 20, 20);
        [closebutton setTitle:@"X" forState:UIControlStateNormal];
        [closebutton addTarget:self action:@selector(closeCommentsView:) forControlEvents:UIControlEventTouchDown];
        [closebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [closebutton addTarget:self action:@selector(closeCommentsView:) forControlEvents:UIControlEventTouchUpInside];
        [comentView addSubview: closebutton];
        
        UILabel*closeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 25, 20)];
        closeLabel.text = @"关闭";
        closeLabel.font = [UIFont systemFontOfSize:12];
        closeLabel.textAlignment = NSTextAlignmentLeft;
        [comentView addSubview:closeLabel];
        
        
        
        UILabel* publicLabel = [[UILabel alloc]initWithFrame:CGRectMake(comentView.frame.size.width - 45, 0, 45, 20)];
        publicLabel.textAlignment = NSTextAlignmentLeft;
        publicLabel.text= @"发布";
        publicLabel.font = [UIFont systemFontOfSize:12];
        [comentView addSubview:publicLabel];
        [publicLabel release];
        
        UIButton *publicButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        publicButton.frame = CGRectMake(winSize.width - 20,0, 20, 20);
        [publicButton addTarget:self action:@selector(publicComment:) forControlEvents:UIControlEventTouchUpInside];
        [publicButton setTitle:@"V" forState:UIControlStateNormal];
        [publicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [comentView addSubview: publicButton];
        
        
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 40, winSize.width - 40, 50)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        
        textField.clearsOnBeginEditing = YES;
        textField.clearButtonMode = YES;
        [comentView addSubview:textField];
        textField.delegate = self;
        [textField release];
        
        
        
        
    }

    return self;

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    CGPoint point = self.center;
    point.y -= 200;
    self.center = point;
    return YES;
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    CGPoint point = self.center;
    point.y += 200;
    self.center = point;
    return YES;
}


- (void)closeCommentsView:(UIButton*)closeBtn{
   
    [self removeFromSuperview];
    
}


- (void)publicComment:(UIButton*)pulicBtn{
  
    UIViewController *VC =[self viewController];
    RegistAndLoadViewController *regLoadVC = [[RegistAndLoadViewController alloc]init];
    [VC.navigationController pushViewController:regLoadVC animated:YES];
    [regLoadVC release];
    
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
