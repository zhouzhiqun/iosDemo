//
//  UIScrollView+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "UIScrollView+SSToolkitAdditions.h"

@implementation UIScrollView (SSToolkitAdditions)


- (void)ss_defaultConfig
{
    self.scrollEnabled   = YES;
    self.bounces         = NO;
    self.pagingEnabled   = YES;
    self.scrollsToTop    = NO;
    self.showsHorizontalScrollIndicator  = NO;
    self.showsVerticalScrollIndicator    = NO;
}


- (CGFloat)contentWidth {
    return self.contentSize.width;
}

- (void)setContentWidth:(CGFloat)width {
    self.contentSize = CGSizeMake(width, self.frame.size.height);
}

- (CGFloat)contentHeight {
    return self.contentSize.height;
}

- (void)setContentHeight:(CGFloat)height {
    self.contentSize = CGSizeMake(self.frame.size.width, height);
}

- (CGFloat)contentOffsetX {
    return self.contentOffset.x;
}

- (void)setContentOffsetX:(CGFloat)x {
    self.contentOffset = CGPointMake(x, self.contentOffset.y);
}

- (CGFloat)contentOffsetY {
    return self.contentOffset.y;
}

- (void)setContentOffsetY:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x, y);
}




#pragma mark -

- (CGPoint)ss_topContentOffset {
    return CGPointMake(0.0f, -self.contentInset.top);
}

- (CGPoint)ss_bottomContentOffset {
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}

- (CGPoint)ss_leftContentOffset {
    return CGPointMake(-self.contentInset.left, 0.0f);
}

- (CGPoint)ss_rightContentOffset {
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}


#pragma mark -

- (BOOL)ss_isScrolledToTop {
    return self.contentOffset.y <= [self ss_topContentOffset].y;
}

- (BOOL)ss_isScrolledToBottom {
    return self.contentOffset.y >= [self ss_bottomContentOffset].y;
}
- (BOOL)ss_isScrolledToLeft {
    return self.contentOffset.x <= [self ss_leftContentOffset].x;
}

- (BOOL)ss_isScrolledToRight {
    return self.contentOffset.x >= [self ss_rightContentOffset].x;
}


#pragma mark -

- (void)ss_scrollToTopAnimated:(BOOL)animated {
    [self setContentOffset:[self ss_topContentOffset] animated:animated];
}

- (void)ss_scrollToBottomAnimated:(BOOL)animated {
    [self setContentOffset:[self ss_bottomContentOffset] animated:animated];
}

- (void)ss_scrollToLeftAnimated:(BOOL)animated {
    [self setContentOffset:[self ss_leftContentOffset] animated:animated];
}

- (void)ss_scrollToRightAnimated:(BOOL)animated {
    [self setContentOffset:[self ss_rightContentOffset] animated:animated];
}


#pragma mark -

- (NSUInteger)ss_verticalPageIndex {
    return (self.contentOffset.y + (self.frame.size.height * 0.5f)) / self.frame.size.height;
}

- (NSUInteger)ss_horizontalPageIndex {
    return (self.contentOffset.x + (self.frame.size.width * 0.5f)) / self.frame.size.width;
}


- (void)ss_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * pageIndex) animated:animated];
}

- (void)ss_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(self.frame.size.width * pageIndex, 0.0f) animated:animated];
}



#pragma mark - Pages

- (CGFloat) ss_pagesY {
    CGFloat pageHeight = self.frame.size.height;
    CGFloat contentHeight = self.contentSize.height;
    return contentHeight/pageHeight;
}

- (CGFloat) ss_pagesX {
    CGFloat pageWidth = self.frame.size.width;
    CGFloat contentWidth = self.contentSize.width;
    return contentWidth/pageWidth;
}

- (CGFloat) ss_currentPageY {
    CGFloat pageHeight = self.frame.size.height;
    CGFloat offsetY = self.contentOffset.y;
    return offsetY / pageHeight;
}

- (CGFloat) ss_currentPageX {
    CGFloat pageWidth = self.frame.size.width;
    CGFloat offsetX = self.contentOffset.x;
    return offsetX / pageWidth;
}

- (void) ss_setPageY:(CGFloat)page {
    [self ss_setPageY:page animated:NO];
}

- (void) ss_setPageX:(CGFloat)page {
    [self ss_setPageX:page animated:NO];
}

- (void) ss_setPageY:(CGFloat)page animated:(BOOL)animated {
    CGFloat pageHeight = self.frame.size.height;
    CGFloat offsetY = page * pageHeight;
    CGFloat offsetX = self.contentOffset.x;
    CGPoint offset = CGPointMake(offsetX,offsetY);
    [self setContentOffset:offset];
}

- (void) ss_setPageX:(CGFloat)page animated:(BOOL)animated {
    CGFloat pageWidth = self.frame.size.width;
    CGFloat offsetY = self.contentOffset.y;
    CGFloat offsetX = page * pageWidth;
    CGPoint offset = CGPointMake(offsetX,offsetY);
    [self setContentOffset:offset animated:animated];
}


@end
