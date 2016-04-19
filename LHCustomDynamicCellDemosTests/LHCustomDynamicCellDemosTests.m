//
//  LHCustomDynamicCellDemosTests.m
//  LHCustomDynamicCellDemosTests
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface LHCustomDynamicCellDemosTests : XCTestCase

@end

@implementation LHCustomDynamicCellDemosTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 0)];
        label.font = [UIFont systemFontOfSize:13];
        label.preferredMaxLayoutWidth = 400;
        label.text = @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app，可以认为是随机打开一个app。 基于这点，每个app应该有自己独有的scheme，避免造成用户困惑。";
        label.numberOfLines = 3;
        CGSize labelSize = [label intrinsicContentSize];
        NSLog(@"label的尺寸是：%f, %f", labelSize.width , labelSize.height);
        
//        NSString *text = @"iOS上不同app注册相同的scheme，打开时系统会挑选先注册的app，可以认为是随机打开一个app。 基于这点，每个app应该有自己独有的scheme，避免造成用户困惑。";
//        CGRect rect = [text boundingRectWithSize:CGSizeMake(400, 80) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil];
//        NSLog(@"另一个种计算方式获得的结果：%f, %f", rect.size.width, rect.size.height);
    }];
}
@end
