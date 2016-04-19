//
//  LHDynamicTableViewCellModel.m
//  LHCustomDynamicCellDemos
//
//  Created by 李辉 on 16/4/19.
//  Copyright © 2016年 木仓科技. All rights reserved.
//

#import "LHDynamicTableViewCellModel.h"

#import "LHLabelSizeHelper.h"

@implementation LHDynamicTableViewCellModel

- (instancetype)init
{
    static int count = 0;
    if (self = [super init]) {
        self.title = [self randomTitle];
        self.content = [self randomContent];
        self.imageNames = [self randomImageArray];
        if ((!self.title) && (!self.content)) {
            if (count % 2) {
                self.title = @"天苍苍野茫茫，风吹草低见牛羊";
            } else {
                self.content = @"一个馒头引发的血案：老梁不得不说的故事";
            }
            count ++;
        }
        self.imageContainerViewHeight = [self imageContainerViewHeightWithImageCount:self.imageNames.count];
        self.contentLabelHeight = 0;
        if (self.content && self.content.length > 0) {
            self.contentLabelHeight = [LHLabelSizeHelper heightForString:self.content fontSize:13 prefredWidth:[self contentLabelWidth] numberOfLines:3];
        }
        self.cellHeight = [self caculatelHeight];
    }
    return self;
}

- (NSString *)randomTitle
{
    static int countTitle = 17;
    NSString *temp = nil;
    switch (countTitle % 3) {
        case 0:
            temp = nil;
            break;
        case 1:
            temp = @"这下这两幅图是测量项目详情";
            break;
        case 2:
            temp = @"这下这两幅图是测量项目详情页的半透明的 layer 的情况。可以看到详情页这里半透明的 layer 还是比较多的.";
            break;
            
        default:
            break;
    }
    countTitle ++;
    return temp;
}

- (NSString *)randomContent
{
    static int countContent = 7;
    NSString *temp = nil;
    switch (countContent % 8) {
        case 0:
            temp = nil;
            break;
        case 1:
            temp = @"当使用";
            break;
        case 2:
            temp = @"当使用 layer 的 shouldRasterize ";
            break;
        case 3:
            temp = @"当使用 layer 的 shouldRasterize 的时候（记得设置适当的 laye r的";
            break;
        case 4:
            temp = @"当使用 layer 的 shouldRasterize 的时候（记得设置适当的 laye r的 rasterizationScale），";
            break;
        case 5:
            temp = @"当使用 layer 的 shouldRasterize 的时候（记得设置适当的 laye r的 rasterizationScale），layer 会被强制绘制到一个 offscreen image 上，";
            break;
        case 6:
            temp = @"当使用 layer 的 shouldRasterize 的时候（记得设置适当的 laye r的 rasterizationScale），layer 会被强制绘制到一个 offscreen image 上，并且会被缓存起来。这种方法可以用来缓存绘制耗时";
            break;
        case 7:
            temp = @"当使用 layer 的 shouldRasterize 的时候（记得设置适当的 laye r的 rasterizationScale），layer 会被强制绘制到一个 offscreen image 上，并且会被缓存起来。这种方法可以用来缓存绘制耗时（比如有比较绚的效果）但是不经常改的 layer，如果 layer 经常变，就不适合用。";
            break;
            
        default:
            break;
    }
    countContent ++;
    return temp;
}

- (NSArray <NSString *>*)randomImageArray
{
    static int countImage = 0;
    NSArray *result = nil;
    if (countImage > 0) {
        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:countImage];
        for (int i = 0; i < countImage; i ++) {
            [temp addObject:@"hot_dog"];
        }
        result = [NSArray arrayWithArray:temp];
    }
    countImage ++;
    return result;
}

- (CGFloat)imageContainerViewHeightWithImageCount:(NSInteger)imageCount
{
    CGFloat imageViewWidth = [self imageViewWidth];
    CGFloat imageViewGap = [self imageViewGap];
    CGFloat height = 0;
    if (imageCount > 0 && imageCount <= 3) {
        height = imageViewWidth;
    } else if (imageCount > 3 && imageCount <=6) {
        height = 2 * imageViewWidth + imageViewGap;
    } else if (imageCount > 6) {
        height = 3 * imageViewWidth + 2 * imageViewGap;
    }
    return height;
}

- (CGFloat)imageViewGap
{
    return 8;
}

- (CGFloat)imageViewWidth
{
    return ([UIScreen mainScreen].bounds.size.width - 25 - ([self imageViewGap] * 2)) / 3.0;
}

- (CGFloat)contentLabelWidth
{
    return [UIScreen mainScreen].bounds.size.width - 25;
}

- (CGFloat)caculatelHeight
{
    static CGFloat gap = 30;
    CGFloat height = gap;
    if (self.title) {
        height += 17;
    }
    if (self.content) {
        height += self.contentLabelHeight;
    }
    height += self.imageContainerViewHeight;
    return height;
}

@end
