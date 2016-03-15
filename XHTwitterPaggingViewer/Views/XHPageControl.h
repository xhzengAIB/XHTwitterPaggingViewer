//
//  XHPageControl.h
//  XHTwitterPaggingViewerExample
//
//  Created by dw_iOS on 14-8-14.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHPageControl : UIControl

@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger numberOfPages;

@property (nonatomic, assign) BOOL hidesForSinglePage;

@property (nonatomic, assign) NSInteger gapWidth;
@property (nonatomic, assign) NSInteger strokeWidth;
@property (nonatomic, assign) NSInteger diameter;

@property (nonatomic) UIImage *thumbImage;

@property (nonatomic) UIImage *selectedThumbImage;

@property (nonatomic) NSMutableDictionary *thumbImageForIndex;

@property (nonatomic) NSMutableDictionary *selectedThumbImageForIndex;

- (void)setThumbImage:(UIImage *)aThumbImage
             forIndex:(NSInteger)index;

- (UIImage *)thumbImageForIndex:(NSInteger)index;

- (void)setSelectedThumbImage:(UIImage *)selectedThumbImage
                     forIndex:(NSInteger)index;

- (UIImage *)selectedThumbImageForIndex:(NSInteger)index;

@end
