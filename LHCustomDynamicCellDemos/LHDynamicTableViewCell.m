//
//  LHDynamicTableViewCell.m
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import "LHDynamicTableViewCell.h"

#import "LHDynamicTableViewCellModel.h"

#import <FRHyperLabel/FRHyperLabel.h>

@interface LHDynamicTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet FRHyperLabel *contentLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *imageViewGapConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContainerViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelTopConstraint;

@end

@implementation LHDynamicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    for (NSLayoutConstraint *constraint in self.imageViewGapConstraint) {
        constraint.constant = 8;
    }
    self.imageContainerViewHeightConstraint.constant = [UIScreen mainScreen].bounds.size.width - 25;
    [self layoutIfNeeded];
}

-(void)prepareForReuse
{
    self.titleLabel.text = @"";
    self.contentLabel.text = @"";
}

- (void)setCellModel:(LHDynamicTableViewCellModel *)cellModel
{
    if (cellModel) {
        NSLog(@"\n\n标题：%@,内容 %@,图片数目： %ld\n\n", cellModel.title, cellModel.content, cellModel.imageNames.count);
        self.titleLabel.text = cellModel.title;
        self.contentLabel.text = cellModel.content;
        if (cellModel.title && cellModel.title.length > 0) {
            self.titleLabel.hidden = NO;
            self.contentLabel.hidden = NO;
            self.contentLabelTopConstraint.constant = 40;
        } else {
            self.titleLabel.hidden = YES;
            self.contentLabel.hidden = NO;
            self.contentLabelTopConstraint.constant = 10;
        }
        if (cellModel.content) {
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]};
            self.contentLabel.attributedText = [[NSAttributedString alloc]initWithString:cellModel.content attributes:attributes];
            [self.contentLabel setLinksForSubstrings:@[@"layer", @"shouldRasterize", @"offscreen"] withLinkHandler:^(FRHyperLabel *label, NSString *substring) {
                NSLog(@"点击选中了子串%@", substring);
            }];
        }
        self.imageContainerViewHeightConstraint.constant = cellModel.imageContainerViewHeight;
        [self layoutIfNeeded];
    }
    _cellModel = cellModel;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
