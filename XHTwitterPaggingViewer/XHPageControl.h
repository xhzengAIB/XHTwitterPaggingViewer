//
//  XHPageControl.h
//  XHTwitterPaggingViewerExample
//
//  Created by dw_iOS on 14-8-14.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
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
