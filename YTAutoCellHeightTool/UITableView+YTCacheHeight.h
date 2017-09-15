//
//  UITableView+YTCacheHeight.h
//  YTAutoCellHeight
//
//  Created by yangtong on 2017/9/15.
//  Copyright © 2017年 saiwill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (YTCacheHeight)

@property(nonatomic,strong,readonly)NSMutableDictionary *YTCacheCellHeightDict;

@property(nonatomic,strong,readonly)NSMutableDictionary *YTReuseCells;

@end
