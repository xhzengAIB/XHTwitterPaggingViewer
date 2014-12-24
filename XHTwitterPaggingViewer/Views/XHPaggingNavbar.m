//
//  XHPaggingNavbar.m
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "XHPaggingNavbar.h"

#import "XHPageControl.h"

#define kXHiPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define kXHLabelBaseTag 1000

@interface XHPaggingNavbar ()

/**
 *  分页指示器
 */
@property (nonatomic, strong) XHPageControl *pageControl;

/**
 *  title label 集合
 */
@property (nonatomic, strong) NSMutableArray *titleLabels;

@end

@implementation XHPaggingNavbar

#pragma mark - DataSource

- (void)reloadData {
    if (!self.titles.count) {
        return;
    }
    
    [self.titleLabels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        label.hidden = YES;
    }];
    
    [self.titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
        CGRect titleLabelFrame = CGRectMake((idx * (kXHiPad ? 240 : 100)), 8, CGRectGetWidth(self.bounds), 20);
        NSInteger tag = kXHLabelBaseTag + idx;
        UILabel *titleLabel = (UILabel *)[self viewWithTag: tag];
        if (!titleLabel) {
            titleLabel = [[UILabel alloc] init];
            titleLabel.tag = tag;
            [self addSubview:titleLabel];
            [self.titleLabels addObject:titleLabel];
        }
        titleLabel.hidden = NO;
        titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        titleLabel.font = [[UINavigationBar appearance].titleTextAttributes objectForKey:NSFontAttributeName];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UINavigationBar appearance].tintColor;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = title;
        titleLabel.frame = titleLabelFrame;
        if (self.currentPage == idx) {
            titleLabel.alpha = 1.0;
        } else {
            titleLabel.alpha = 0.0;
        }
    }];
    
    self.pageControl.numberOfPages = self.titles.count;
}

- (void)pageControlValueChanged:(XHPageControl *)pageControl {
    if (self.didChangedIndex) {
        self.didChangedIndex(pageControl.currentPage);
    }
}

#pragma mark - Propertys

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    self.pageControl.currentPage = currentPage;
}

- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat xOffset = contentOffset.x;
    
    CGFloat normalWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    
    [self.titleLabels enumerateObjectsUsingBlock:^(UILabel *titleLabel, NSUInteger idx, BOOL *stop) {
        if ([titleLabel isKindOfClass:[UILabel class]]) {
            
            // frame
            CGRect titleLabelFrame = titleLabel.frame;
            titleLabelFrame.origin.x = (idx * (kXHiPad ? 240 : 100)) - xOffset / 3.2;
            titleLabel.frame = titleLabelFrame;
            
            // alpha
            CGFloat alpha;
            if(xOffset < normalWidth * idx) {
                alpha = (xOffset - normalWidth * (idx - 1)) / normalWidth;
            }else{
                alpha = 1 - ((xOffset - normalWidth * idx) / normalWidth);
            }
            titleLabel.alpha = alpha;
        }
    }];
}

- (XHPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[XHPageControl alloc] init];
        _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _pageControl.frame = (CGRect){0, 25, CGRectGetWidth(self.bounds), 20};
        [_pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPage = self.currentPage;
        [_pageControl setThumbImage:[UIImage imageNamed:@"thumbnail_normal"]];
        [_pageControl setSelectedThumbImage:[UIImage imageNamed:@"thumbnail_selected"]];
    }
    return _pageControl;
}

- (NSMutableArray *)titleLabels {
    if (!_titleLabels) {
        _titleLabels = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _titleLabels;
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.pageControl];
    }
    return self;
}

- (void)dealloc {
    self.pageControl = nil;
    self.titleLabels = nil;
}

@end
