//
//  XHPaggingNavbar.h
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHPaggingNavbar : UIView

/**
 *  显示在导航条上的title集合
 */
@property (nonatomic, strong) NSArray *titles;

/**
 *  当前页码
 */
@property (nonatomic, assign) NSInteger currentPage;

/**
 *  外部设置滑动页面的距离
 */
@property (nonatomic, assign) CGPoint contentOffset;

@property (nonatomic, copy) void (^didChangedIndex)(NSInteger index);

/**
 *  设置title集合数据源后，进行reload的方法
 */
- (void)reloadData;

@end
