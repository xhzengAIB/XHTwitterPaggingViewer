//
//  XHPaggingNavbar.m
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "XHPaggingNavbar.h"

#define kXHLabelBaseTag 100

@interface XHPaggingNavbar ()

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray *titleLabels;

@end

@implementation XHPaggingNavbar

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    self.pageControl.currentPage = currentPage;
}

- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat xOffset = contentOffset.x;
    
    CGFloat norWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    for (int i = 0; i < self.titleLabels.count; i ++) {
        UILabel *titleLabel = self.titleLabels[i];
        if ([titleLabel isKindOfClass:[UILabel class]]) {
            CGRect titleLabelFrame = titleLabel.frame;
            titleLabelFrame.origin.x = (i * 100) - xOffset / 3.2;
            titleLabel.frame = titleLabelFrame;
            
            CGFloat alpha;
            
            switch (i) {
                case 0:
                    alpha = 1 - xOffset / norWidth;
                    break;
                case 1:
                    if (xOffset < norWidth) {
                        alpha = xOffset / norWidth;
                    } else {
                        alpha = 1 - (xOffset - norWidth) / norWidth;
                    }
                    break;
                case 2:
                    alpha = (xOffset - norWidth) / norWidth;
                    break;
                default:
                    alpha = (xOffset - norWidth * 2) / norWidth;
                    break;
            }
            titleLabel.alpha = alpha;
        }
    }
}

- (void)reloadData {
    if (!self.titles.count) {
        return;
    }
    
    for (NSString *title in self.titles) {
        NSInteger index = [self.titles indexOfObject:title];
        CGRect titleLabelFrame = CGRectMake((index * 100), 8, CGRectGetWidth(self.bounds), 20);
        UILabel *titleLabel = (UILabel *)[self viewWithTag:kXHLabelBaseTag + index];
        if (!titleLabel) {
            titleLabel = [[UILabel alloc] init];
            [self addSubview:titleLabel];
            [self.titleLabels addObject:titleLabel];
        }
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor blackColor];
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

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _pageControl.frame = (CGRect){0, 35, CGRectGetWidth(self.bounds), 0};
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPage = self.currentPage;
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.400 alpha:1.000];
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
        [self addSubview:self.pageControl];
    }
    return self;
}

@end
