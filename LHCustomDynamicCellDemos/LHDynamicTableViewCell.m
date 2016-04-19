//
//  LHDynamicTableViewCell.m
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import "LHDynamicTableViewCell.h"

@interface LHDynamicTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *imageViewGapConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContainerViewHeightConstraint;

@end

@implementation LHDynamicTableViewCell

+ (CGFloat)imageViewGap
{
    return 8;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    for (NSLayoutConstraint *constraint in self.imageViewGapConstraint) {
        constraint.constant = [LHDynamicTableViewCell imageViewGap];
    }
    self.imageContainerViewHeightConstraint.constant = [UIScreen mainScreen].bounds.size.width - 25;
}

-(void)prepareForReuse
{
    self.contentLabel.text = @"";
}

- (void)configCellWithContent:(NSString *)content
{
    self.contentLabel.text = content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
