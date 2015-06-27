//
//  LTView.m
//  ifengDomo
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (instancetype)init
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, frame.size.width/3, frame.size.height)];
        label.backgroundColor = [UIColor cyanColor];
        label.textColor = [UIColor purpleColor];
        self.nameLabel = label;
        [self addSubview:label];
        [label release];
        
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(frame.size.width/3, 0, frame.size.width*2/3, frame.size.height)];
        
        textField.backgroundColor = [UIColor blueColor];
        textField.textColor = [UIColor purpleColor];
       
        
        self.nameTextField = textField;
        [self addSubview:textField];
        [textField release];
        
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame andLabeltext:(NSString *)labelText andPlaceholder:(NSString *)placeholder
{
    self = [self initWithFrame:frame];
    if (self) {
        self.nameLabel.text = labelText;
        self.nameTextField.placeholder = placeholder;
    }
    
    return self;
}






@end
