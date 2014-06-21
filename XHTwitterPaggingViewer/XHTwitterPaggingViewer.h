//
//  XHTwitterPaggingViewer.h
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XHDidChangedPageBlock)(NSInteger currentPage);

@interface XHTwitterPaggingViewer : UIViewController

@property (nonatomic, copy) XHDidChangedPageBlock didChangedPageCompleted;

@property (nonatomic, strong) NSArray *viewControllers;

- (NSInteger)getCurrentPageIndex;

- (void)reloadData;

@end
