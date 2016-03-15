//
//  XHPageControl.m
//  XHTwitterPaggingViewerExample
//
//  Created by dw_iOS on 14-8-14.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHPageControl.h"

@implementation XHPageControl

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self setup];
	}
	return self;
}

- (void)setup {
	[self setBackgroundColor:[UIColor clearColor]];
	
	_strokeWidth = 2;
	_gapWidth = 1.5;
	_diameter = 12;
	
	UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapped:)];
	[self addGestureRecognizer:tapGestureRecognizer];
}

- (void)onTapped:(UITapGestureRecognizer*)gesture {
    CGPoint touchPoint = [gesture locationInView:[gesture view]];
    
    if (touchPoint.x < self.frame.size.width / 2.0) {
        // move left
        if (self.currentPage > 0) {
            if (touchPoint.x <= 22) {
                self.currentPage = 0;
            } else {
                self.currentPage -= 1;
            }
        }
        
    } else {
        // move right
        if (self.currentPage < self.numberOfPages - 1) {
            if (touchPoint.x >= (CGRectGetWidth(self.bounds) - 22)) {
                self.currentPage = self.numberOfPages-1;
            } else {
                self.currentPage += 1;
            }
        }
    }
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.hidesForSinglePage && self.numberOfPages==1)
	{
		return;
	}
	
    NSInteger gap = self.gapWidth;
    float diameter = self.diameter - 2*self.strokeWidth;
    
        if (self.thumbImage && self.selectedThumbImage)
        {
            diameter = self.thumbImage.size.width;
        }
	
	int total_width = self.numberOfPages*diameter + (self.numberOfPages-1)*gap;
	
	if (total_width>self.frame.size.width)
	{
		while (total_width>self.frame.size.width)
		{
			diameter -= 2;
			gap = diameter + 2;
			while (total_width>self.frame.size.width)
			{
				gap -= 1;
				total_width = self.numberOfPages*diameter + (self.numberOfPages-1)*gap;
				
				if (gap==2)
				{
					break;
					total_width = self.numberOfPages*diameter + (self.numberOfPages-1)*gap;
				}
			}
			
			if (diameter==2)
			{
				break;
				total_width = self.numberOfPages*diameter + (self.numberOfPages-1)*gap;
			}
		}
		
		
	}
	
	int i;
	for (i=0; i<self.numberOfPages; i++)
	{
		int x = (self.frame.size.width-total_width)/2 + i*(diameter+gap);
        UIImage* thumbImage = [self thumbImageForIndex:i];
        UIImage* selectedThumbImage = [self selectedThumbImageForIndex:i];
        
        if (thumbImage && selectedThumbImage)
        {
            if (i==self.currentPage)
            {
                [selectedThumbImage drawInRect:CGRectMake(x,(self.frame.size.height-selectedThumbImage.size.height)/2,selectedThumbImage.size.width,selectedThumbImage.size.height)];
            }
            else
            {
                [thumbImage drawInRect:CGRectMake(x,(self.frame.size.height-thumbImage.size.height)/2,thumbImage.size.width,thumbImage.size.height)];
            }
        }
    }
}

- (void)setCurrentPage:(NSInteger)page
{
    _currentPage = page;
    [self setNeedsDisplay];
}

- (void)setNumberOfPages:(NSInteger)numOfPages
{
    _numberOfPages = numOfPages;
    [self setNeedsDisplay];
}

- (void)setThumbImage:(UIImage *)aThumbImage forIndex:(NSInteger)index {
    if (self.thumbImageForIndex == nil) {
        [self setThumbImageForIndex:[NSMutableDictionary dictionary]];
    }
    
    if ((aThumbImage != nil))
        [self.thumbImageForIndex setObject:aThumbImage forKey:@(index)];
    else
        [self.thumbImageForIndex removeObjectForKey:@(index)];
    
    [self setNeedsDisplay];
}

- (UIImage *)thumbImageForIndex:(NSInteger)index {
    UIImage* aThumbImage = [self.thumbImageForIndex objectForKey:@(index)];
    if (aThumbImage == nil)
        aThumbImage = self.thumbImage;
    
    return aThumbImage;
}

- (void)setSelectedThumbImage:(UIImage *)aSelectedThumbImage forIndex:(NSInteger)index {
    if (self.selectedThumbImageForIndex == nil) {
        [self setSelectedThumbImageForIndex:[NSMutableDictionary dictionary]];
    }
    
    if ((aSelectedThumbImage != nil))
        [self.selectedThumbImageForIndex setObject:aSelectedThumbImage forKey:@(index)];
    else
        [self.selectedThumbImageForIndex removeObjectForKey:@(index)];
    
    [self setNeedsDisplay];
}

- (UIImage *)selectedThumbImageForIndex:(NSInteger)index {
    UIImage* aSelectedThumbImage = [self.selectedThumbImageForIndex objectForKey:@(index)];
    if (aSelectedThumbImage == nil)
        aSelectedThumbImage = self.selectedThumbImage;
    
    return aSelectedThumbImage;
}

@end
