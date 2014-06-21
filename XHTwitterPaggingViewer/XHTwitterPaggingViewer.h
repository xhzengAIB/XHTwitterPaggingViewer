//
//  XHTwitterPaggingViewer.h
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XHDidChangedPageBlock)(NSInteger currentPage, NSString *title);

@interface XHTwitterPaggingViewer : UIViewController

/**
 *  改变页码的回调
 */
@property (nonatomic, copy) XHDidChangedPageBlock didChangedPageCompleted;

/**
 *  对于iOS的Cocotouch的设计，UITabbarController，最做支持5个控制器，多余的会以more来代替，可以见的5个是比较正常的内存管理方案，所以这里提倡最大5个控制器的使用
 */
@property (nonatomic, strong) NSArray *viewControllers;

/**
 *  获取当前页码
 *
 *  @return 返回当前页码
 */
- (NSInteger)getCurrentPageIndex;

/**
 *  设置控制器数据源，进行reload的方法
 */
- (void)reloadData;

@end
