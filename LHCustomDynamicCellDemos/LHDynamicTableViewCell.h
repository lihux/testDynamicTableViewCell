//
//  LHDynamicTableViewCell.h
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHDynamicTableViewCell : UITableViewCell

- (void)configCellWithContent:(NSString *)content;

#pragma mark - convenience methods
+ (CGFloat)imageViewGap;

@end
