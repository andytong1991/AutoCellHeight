//
//  UITableView+YTCacheHeight.m
//  YTAutoCellHeight
//
//  Created by yangtong on 2017/9/15.
//  Copyright © 2017年 saiwill. All rights reserved.
//

#import "UITableView+YTCacheHeight.h"
#import <objc/runtime.h>

static const void *YTCacheCellHeightDictKey = @"YTCacheCellHeightDictKey";
static const void *YTReuseCellsKey = @"YTReuseCellsKey";

@implementation UITableView (YTCacheHeight)

-(NSMutableDictionary *)YTCacheCellHeightDict{
    NSMutableDictionary *dict = objc_getAssociatedObject(self, YTCacheCellHeightDictKey);
    if (dict == nil) {
        dict = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, YTCacheCellHeightDictKey, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

-(NSMutableDictionary *)YTReuseCells{
    NSMutableDictionary *cells = objc_getAssociatedObject(self, YTReuseCellsKey);
    if (cells == nil) {
        cells = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, YTReuseCellsKey, cells, OBJC_ASSOCIATION_RETAIN);
    }
    return cells;
}

@end
