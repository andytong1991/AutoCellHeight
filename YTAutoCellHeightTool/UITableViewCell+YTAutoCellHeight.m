//
//  UITableViewCell+YTAutoCellHeight.m
//  YTAutoCellHeight
//
//  Created by yangtong on 2017/9/15.
//  Copyright © 2017年 saiwill. All rights reserved.
//

#import "UITableViewCell+YTAutoCellHeight.h"
#import <objc/runtime.h>

NSString *const kYTCacheUniqueKey = @"kYTCacheUniqueKey";
NSString *const kYTCacheStateKey = @"kYTCacheStateKey";
NSString *const kYTRecalculateForStateKey = @"kYTRecalculateForStateKey";
NSString *const kYTCacheForTableViewKey = @"kYTCacheForTableViewKey";

const void *YTBottomOffsetToCellKey = "YTBottomOffsetToCellKey";

@implementation UITableViewCell (YTAutoCellHeight)

+(CGFloat)YTHeightForTableView:(UITableView *)tableView config:(YTCellBlock)config{
    
    UITableViewCell *cell = [tableView.YTReuseCells objectForKey:[[self class] description]];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault
                           reuseIdentifier:nil];
        [tableView.YTReuseCells setObject:cell forKey:[[self class] description]];
    }
    
    if (config) {
        config(cell);
    }
    
    return [cell YTHeightForTableView:tableView];
}

+(CGFloat)YTHeightForTableView:(UITableView *)tableView config:(YTCellBlock)config cache:(YTCacheHeight)cache{
    NSAssert(tableView, @"tableView is necessary param");
    if (cache) {
        NSDictionary *cacheKeys = cache();
        NSString *key = cacheKeys[kYTCacheUniqueKey];
        NSString *stateKey = cacheKeys[kYTCacheStateKey];
        NSString *shouldUpdate = cacheKeys[kYTRecalculateForStateKey];
        
        NSMutableDictionary *stateDict = tableView.YTCacheCellHeightDict[key];
        NSString *cacheHeight = stateDict[stateKey];
        
        if (tableView.YTCacheCellHeightDict.count == 0 || shouldUpdate.boolValue || cacheHeight == nil) {
            CGFloat height = [self YTHeightForTableView:tableView config:config];
            
            if (stateDict == nil) {
                stateDict = [[NSMutableDictionary alloc] init];
                tableView.YTCacheCellHeightDict[key] = stateDict;
            }
            
            [stateDict setObject:[NSString stringWithFormat:@"%lf", height] forKey:stateKey];
            
            return height;
        } else if (tableView.YTCacheCellHeightDict.count != 0 && cacheHeight != nil && cacheHeight.integerValue != 0) {
            return cacheHeight.floatValue;
        }
    }
    return [self YTHeightForTableView:tableView config:config];
}


-(CGFloat)YTHeightForTableView:(UITableView *)tableView{
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGFloat rowHeight = 0.0;
    for (UIView *bottomView in self.contentView.subviews) {
        if (rowHeight < CGRectGetMaxY(bottomView.frame)) {
            rowHeight = CGRectGetMaxY(bottomView.frame);
        }
    }
    rowHeight += self.YTBottomOffsetToCell;
    return rowHeight;
}

-(CGFloat)YTBottomOffsetToCell{
    NSNumber *valueObject = objc_getAssociatedObject(self, YTBottomOffsetToCellKey);
    if ([valueObject respondsToSelector:@selector(floatValue)]) {
        return valueObject.floatValue;
    }
    return 0.0;
}

-(void)setYTBottomOffsetToCell:(CGFloat)YTBottomOffsetToCell{
    objc_setAssociatedObject(self, YTBottomOffsetToCellKey, @(YTBottomOffsetToCell), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
