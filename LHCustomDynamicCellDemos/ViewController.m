//
//  ViewController.m
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import "ViewController.h"

#import "LHDynamicTableViewCell.h"
#import "LHDynamicTableViewCellModel.h"

static const NSInteger KDefaultDataCount = 100;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray <LHDynamicTableViewCellModel *> *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LHDynamicTableViewCellModel *cellModel = self.data[indexPath.row];
    NSLog(@"\n\n我勒个去的cell高度是：%f\n\n", cellModel.cellHeight);
    return cellModel.cellHeight;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LHDynamicTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LHDynamicTableViewCell"];
    cell.cellModel = self.data[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

#pragma mark - lazy load
- (NSArray<LHDynamicTableViewCellModel *> *)data
{
    if (!_data) {
        NSMutableArray *temp = [NSMutableArray array];
        for (int i = 0; i < KDefaultDataCount; i ++) {
            [temp addObject:[[LHDynamicTableViewCellModel alloc] init]];
        }
        _data = [NSArray arrayWithArray:temp];
    }
    return _data;
}

@end
