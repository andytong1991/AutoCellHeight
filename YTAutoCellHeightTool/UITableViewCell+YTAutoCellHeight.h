//
//  UITableViewCell+YTAutoCellHeight.h
//  YTAutoCellHeight
//
//  Created by yangtong on 2017/9/15.
//  Copyright © 2017年 saiwill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+YTCacheHeight.h"

@interface UITableViewCell (YTAutoCellHeight)

typedef void(^YTCellBlock)(UITableViewCell *sourceCell);
typedef NSDictionary *(^YTCacheHeight)();

@property (nonatomic, assign) CGFloat YTBottomOffsetToCell;


+ (CGFloat)YTHeightForTableView:(UITableView *)tableView config:(YTCellBlock)config;

@end
