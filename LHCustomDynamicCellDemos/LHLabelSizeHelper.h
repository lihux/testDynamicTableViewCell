//
//  LHLabelSizeHelper.h
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface LHLabelSizeHelper : NSObject

+ (CGFloat)heightForString:(NSString *)string fontSize:(NSInteger)size prefredWidth:(CGFloat)width;

+ (CGFloat)heightForString:(NSString *)string fontSize:(NSInteger)size prefredWidth:(CGFloat)width numberOfLines:(NSInteger)count;

+ (CGSize)sizeForString:(NSString *)string fontSize:(NSInteger)size prefredWidth:(CGFloat)width;

+ (CGSize)sizeForString:(NSString *)string font:(UIFont *)font prefredWidth:(CGFloat)width;

+ (CGSize)sizeForString:(NSString *)string font:(UIFont *)font prefredWidth:(CGFloat)width numberOfLines:(NSInteger)count;


@end
