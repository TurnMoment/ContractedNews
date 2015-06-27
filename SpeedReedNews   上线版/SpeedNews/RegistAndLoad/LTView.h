//
//  LTView.h
//  ifengDomo
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTView : UIView<UITextFieldDelegate>
@property (nonatomic,retain)UILabel *nameLabel;
@property (nonatomic,retain)UITextField *nameTextField;

- (instancetype)initWithFrame:(CGRect)frame andLabeltext:(NSString *)labelText andPlaceholder:(NSString *)placeholder;



@end
