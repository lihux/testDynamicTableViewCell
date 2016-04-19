//
//  LHLabelSizeHelper.m
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import "LHLabelSizeHelper.h"

@implementation LHLabelSizeHelper

+ (CGFloat)heightForString:(NSString *)string fontSize:(NSInteger)size prefredWidth:(CGFloat)width
{
    CGSize labeSize = [self sizeForString:string fontSize:size prefredWidth:width];
    return labeSize.height;
}

+ (CGFloat)heightForString:(NSString *)string fontSize:(NSInteger)size prefredWidth:(CGFloat)width numberOfLines:(NSInteger)count
{
    return [self sizeForString:string font:[UIFont systemFontOfSize:size] prefredWidth:width numberOfLines:count].height;
}

+ (CGSize)sizeForString:(NSString *)string font:(UIFont *)font prefredWidth:(CGFloat)width
{
    return [self sizeForString:string font:font prefredWidth:width numberOfLines:0];
}

+ (CGSize)sizeForString:(NSString *)string fontSize:(NSInteger)size prefredWidth:(CGFloat)width
{
    return [self sizeForString:string font:[UIFont systemFontOfSize:size] prefredWidth:width numberOfLines:0];
}

+ (CGSize)sizeForString:(NSString *)string font:(UIFont *)font prefredWidth:(CGFloat)width numberOfLines:(NSInteger)count
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.preferredMaxLayoutWidth = width;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]};
    label.attributedText = [[NSAttributedString alloc]initWithString:string attributes:attributes];
//    label.text = string;
    label.numberOfLines = count;
    CGSize labelSize = [label intrinsicContentSize];
//    NSLog(@"label的尺寸是：%f, %f", labelSize.width , labelSize.height);
    return labelSize;
}


@end
