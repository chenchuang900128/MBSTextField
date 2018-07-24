//
//  UITextField+Utils.m
//  MBSiPhone
//
//  Created by tianliang on 14-2-14.
//  Copyright (c) 2014年 China M-World Co.,Ltd. All rights reserved.
//

#import "UITextField+Utils.h"

@implementation UITextField (Utils)
//@"CNY 99.00"
-(void)styleWithMoneyFont:(UIFont *)bigFont{
    NSString *text = self.text;
    UIFont * smallFont = [UIFont systemFontOfSize:15];
    if ([bigFont isEqual:[UIFont systemFontOfSize:15]]) {
        smallFont =[UIFont systemFontOfSize:12];
    }else if ([bigFont isEqual:[UIFont systemFontOfSize:17]]){
        smallFont =[UIFont systemFontOfSize:15];
    }
    else if ([bigFont isEqual:[UIFont systemFontOfSize:12]]){
        smallFont = [UIFont systemFontOfSize:10];
    }
    NSMutableAttributedString *attributerdText = [[NSMutableAttributedString alloc]initWithString:text];
    if ([text rangeOfString:@"CNY"].location != NSNotFound) {
        [attributerdText setAttributes:@{NSFontAttributeName: smallFont} range:[[attributerdText string] rangeOfString:@"CNY"]];
    }
    
    if ([text rangeOfString:@"."].location != NSNotFound) {
        NSString *subtext = [[[attributerdText string] componentsSeparatedByString:@"."]lastObject];
        [attributerdText setAttributes:@{NSFontAttributeName: smallFont} range:[[attributerdText string] rangeOfString:[NSString stringWithFormat:@".%@",subtext]]];
    }
    self.attributedText = attributerdText;
}

@end
