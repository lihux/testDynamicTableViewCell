//
//  LHDynamicTableViewCellModel.h
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface LHDynamicTableViewCellModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, assign) CGFloat contentLabelHeight;
@property (nonatomic, assign) CGFloat imageContainerViewHeight;
@property (nonatomic, assign) CGFloat cellHeight;

@end
