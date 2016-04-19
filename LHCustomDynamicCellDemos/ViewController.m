//
//  ViewController.m
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import "ViewController.h"

#import "LHDynamicTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray <NSString *> *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[@"iOS",
                  @"iOS上不同app",
                  @"iOS上不同app注册相同的scheme",
                  @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app",
                  @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app，可以认为是随机打开一个app。",
                  @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app，可以认为是随机打开一个app。 基于这点",
                  @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app，可以认为是随机打开一个app。 基于这点，每个app应该有自己独有的scheme.",
                  @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app，可以认为是随机打开一个app。 基于这点，每个app应该有自己独有的scheme，避免造成用户困惑。",
                  @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app，可以认为是随机打开一个app。 基于这点，每个app应该有自己独有的scheme，避免造成用户困惑。（注：ios可以在代码里拒绝打开，所以问题不大，但是还是会调用每一个相同scheme的代码）"];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 500;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LHDynamicTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LHDynamicTableViewCell"];
    [cell configCellWithContent:self.data[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

@end
