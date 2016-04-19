//
//  LHImageView.m
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import "LHImageView.h"

#import "LHDynamicTableViewCell.h"

@implementation LHImageView

- (void)awakeFromNib
{
    [super awakeFromNib];
    CGFloat width = [self imageViewWidth];
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstItem == self && (constraint.firstAttribute == NSLayoutAttributeWidth || constraint.firstAttribute == NSLayoutAttributeHeight)) {
            constraint.constant = width;
            NSLog(@"\n\n我勒个去：%@\n\n", constraint);
        }
    }
}

- (CGFloat)imageViewContainerViewWidth
{
    return [UIScreen mainScreen].bounds.size.width - 25;
}

- (CGFloat)imageViewGap
{
    return [LHDynamicTableViewCell imageViewGap];
}

- (CGFloat)imageViewWidth
{
    CGFloat imageViewContainerViewWidth = [UIScreen mainScreen].bounds.size.width - 25;
    CGFloat imageViewGap = 10;
    return (imageViewContainerViewWidth - (imageViewGap * 2)) / 3.0;
}

@end
