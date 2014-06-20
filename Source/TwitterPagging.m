//
//  TwitterPagging.m
//  TwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "TwitterPagging.h"

@interface TwitterPagging ()

@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation TwitterPagging

#pragma DataSource

- (NSInteger)getCurrentPageIndex {
    return self.currentPage;
}

- (void)reloadData {
    
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        [self reloadData];
    }
}

@end
