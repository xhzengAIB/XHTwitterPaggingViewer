//
//  XHPaggingNavbar.m
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "XHPaggingNavbar.h"

#define kXHiPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define kXHLabelBaseTag 1000

@interface XHPaggingNavbar ()

/**
 *  分页指示器
 */
@property (nonatomic, strong) UIPageControl *pageControl;

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
    
    for (NSString *title in self.titles) {
        NSInteger index = [self.titles indexOfObject:title];
        CGRect titleLabelFrame = CGRectMake((index * (kXHiPad ? 240 : 100)), 8, CGRectGetWidth(self.bounds), 20);
        UILabel *titleLabel = (UILabel *)[self viewWithTag:kXHLabelBaseTag + index];
        if (!titleLabel) {
            titleLabel = [[UILabel alloc] init];
            [self addSubview:titleLabel];
            [self.titleLabels addObject:titleLabel];
        }
        titleLabel.hidden = NO;
        titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        titleLabel.font = [UIFont boldSystemFontOfSize:17];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = title;
        titleLabel.frame = titleLabelFrame;
        if (self.currentPage == index) {
            titleLabel.alpha = 1.0;
        } else {
            titleLabel.alpha = 0.0;
        }
    }
    
    self.pageControl.numberOfPages = self.titles.count;
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
    for (int i = 0; i < self.titleLabels.count; i ++) {
        UILabel *titleLabel = self.titleLabels[i];
        if ([titleLabel isKindOfClass:[UILabel class]]) {
            CGRect titleLabelFrame = titleLabel.frame;
            titleLabelFrame.origin.x = (i * (kXHiPad ? 240 : 100)) - xOffset / 3.2;
            titleLabel.frame = titleLabelFrame;
            
            CGFloat alpha;
            
            switch (i) {
                case 0:
                    alpha = 1 - (xOffset / normalWidth);
                    break;
                case 1:
                    if (xOffset < normalWidth) {
                        alpha = xOffset / normalWidth;
                    } else {
                        alpha = 1 - (xOffset - normalWidth) / normalWidth;
                    }
                    break;
                case 2:
                    if (xOffset < normalWidth * 2) {
                        alpha = (xOffset - normalWidth) / normalWidth;
                    } else {
                        alpha = 1 - ((xOffset - normalWidth * 2) / normalWidth);
                    }
                    break;
                case 3:
                    if (xOffset < normalWidth * 3) {
                        alpha = (xOffset - normalWidth * 2) / normalWidth;
                    } else {
                        alpha = 1 - ((xOffset - normalWidth * 3) / normalWidth);
                    }
                    break;
                case 4:
                    if (xOffset < normalWidth * 4) {
                        alpha = (xOffset - normalWidth * 3) / normalWidth;
                    } else {
                        alpha = 1 - ((xOffset - normalWidth * 4) / normalWidth);
                    }
                    break;
                default:
                    break;
            }
            titleLabel.alpha = alpha;
        }
    }
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _pageControl.frame = (CGRect){0, 35, CGRectGetWidth(self.bounds), 0};
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPage = self.currentPage;
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.799 alpha:1.000];
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

@end
