//
//  XHPageItem.m
//  TwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "XHPageItem.h"

@implementation XHPageItem

- (id)init {
    self = [super init];
    if (self) {
        _navTitle = [[NSString alloc] init];
    }
    return self;
}

- (void)dealloc {
    self.navTitle = nil;
}

@end
