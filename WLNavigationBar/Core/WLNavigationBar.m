//
//  WLNavigationBar.m
//  WLCustomNavigationBar
//
//  Created by weil on 2019/7/3.
//  Copyright © 2019 AllYoga. All rights reserved.
//

#import "WLNavigationBar.h"

#define WL_STATUS_BAR_H [[UIApplication sharedApplication] statusBarFrame].size.height
@interface WLNavigationBar ()
@property (nonatomic, strong) NSMutableArray<UIView *> *leftItemArr;
@property (nonatomic, strong) NSMutableArray<UIView *> *rightItemArr;
@property (nonatomic, strong) UIView *titleItem;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) CGFloat itemSpacing;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation WLNavigationBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}
- (void) _init
{
    self.leftItemArr = @[].mutableCopy;
    self.rightItemArr = @[].mutableCopy;
    self.lineView = [UIView new];
    [self addSubview:self.lineView];
}
- (void)wl_addLeftItem:(UIView *)item
{
    [self addSubview:item];
    [self.leftItemArr addObject:item];
}
- (void)wl_insertLeftItem:(UIView *)item atIndex:(int)index
{
    [self addSubview:item];
    [self.leftItemArr insertObject:item atIndex:index];
}
- (void)wl_addRightItem:(UIView *)item
{
    [self addSubview:item];
    [self.rightItemArr addObject:item];
}
- (void)wl_insertRightItem:(UIView *)item atIndex:(int)index
{
    [self addSubview:item];
    [self.rightItemArr insertObject:item atIndex:index];
}
- (void)wl_setTitleItem:(UIView *)item
{
    [self addSubview:item];
    self.titleItem = item;
}
- (void)wl_removeLeftItem:(UIView *)item
{
    [self.leftItemArr removeObject:item];
    [item removeFromSuperview];
    item = nil;
}
- (void)wl_removeLeftItemAtIndex:(int)index
{
    UIView *item = [self.leftItemArr objectAtIndex:index];
    [self wl_removeLeftItem:item];
}
- (void)wl_removeRightItem:(UIView *)item
{
    [self.rightItemArr removeObject:item];
    [item removeFromSuperview];
    item = nil;
}
- (void)wl_removeRightItemAtIndex:(int)index
{
    UIView *item = [self.rightItemArr objectAtIndex:index];
    [self wl_removeRightItem:item];
}
- (void)wl_updateLeftItem:(UIView *)item atIndex:(int)index
{
    UIView *oldItem = [self.leftItemArr objectAtIndex:index];
    [self.leftItemArr replaceObjectAtIndex:index withObject:item];
    [oldItem removeFromSuperview];
    oldItem = nil;
    [self addSubview:item];
}
- (void)wl_updateLeftAlpha:(CGFloat)alpha
{
    [self.leftItemArr enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self wl_updateLeftItemAlpha:alpha atIndex:(int)idx];
    }];
}
- (void)wl_updateLeftItemAlpha:(CGFloat)alpha atIndex:(int)index
{
    self.leftItemArr[index].alpha = alpha;
}
- (void)wl_updateLeftBackgroundColor:(UIColor *)color
{
    [self.leftItemArr enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self wl_updateLeftItemBackgroundColor:color atIndex:(int)idx];
    }];
}
- (void)wl_updateLeftItemBackgroundColor:(UIColor *)color atIndex:(int)index
{
    self.leftItemArr[index].backgroundColor = color;
}
- (void)wl_updateRightItem:(UIView *)item atIndex:(int)index
{
    UIView *oldItem = [self.rightItemArr objectAtIndex:index];
    [self.rightItemArr replaceObjectAtIndex:index withObject:item];
    [oldItem removeFromSuperview];
    oldItem = nil;
    [self addSubview:item];
}
- (void)wl_updateRightAlpha:(CGFloat)alpha
{
    [self.rightItemArr enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self wl_updateRighItemAlpha:alpha atIndex:(int)idx];
    }];
}
- (void)wl_updateRighItemAlpha:(CGFloat)alpha atIndex:(int)index
{
    self.rightItemArr[index].alpha = alpha;
}
- (void)wl_updateRightBackgroundColor:(UIColor *)color
{
    [self.rightItemArr enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self wl_updateRightItemBackgroundColor:color atIndex:(int)idx];
    }];
}
- (void)wl_updateRightItemBackgroundColor:(UIColor *)color atIndex:(int)index
{
    self.rightItemArr[index].backgroundColor = color;
}
- (void)wl_updateTitleItem:(UIView *)item
{
    [self.titleItem removeFromSuperview];
    self.titleItem = item;
    [self addSubview:self.titleItem];
}
- (void)wl_updateTitleAlpha:(CGFloat)alpha
{
    self.titleItem.alpha = alpha;
}
- (void)wl_updateTitleColor:(UIColor *)color
{
    if ([self.titleItem isKindOfClass:[UILabel class]]) {
        ((UILabel *)self.titleItem).textColor = color;
    }
}
- (void)wl_setBackgroundColor:(UIColor *)backgroundColor
{
    self.backgroundColor = backgroundColor;
}
- (void)wl_setAlpha:(CGFloat)alpha
{
    UIColor *color = self.backgroundColor;
    self.backgroundColor = [color colorWithAlphaComponent:alpha];
}
- (void)wl_setMargin:(CGFloat)margin
{
    self.margin = margin;
}
- (void)wl_setItemSpace:(CGFloat)space
{
    self.itemSpacing = space;
}
- (void)wl_setLineViewColor:(UIColor *)color
{
    self.lineView.backgroundColor = color;
}
- (void)wl_setLineAlpha:(CGFloat)alpha
{
    self.lineView.alpha = alpha;
}
- (void)wl_reload
{
    CGFloat x = 0, y = 0, w = 0, h = 0, leftMaxX = 0, rightMinX = self.frame.size.width - self.margin;
    x = self.margin;
    for (int i = 0; i < self.leftItemArr.count; ++i) {
        UIView *item = self.leftItemArr[i];
        [item sizeToFit];
        w = item.frame.size.width;
        h = item.frame.size.height;
        y = WL_STATUS_BAR_H + (self.frame.size.height - WL_STATUS_BAR_H - h) / 2.0;
        item.frame = CGRectMake(x, y, w, h);
        x = CGRectGetMaxX(item.frame) + self.itemSpacing;
        leftMaxX = x;
    }
    x = self.frame.size.width - self.margin;
    for (int i = (int)self.rightItemArr.count - 1; i >= 0; --i) {
        UIView *item = self.rightItemArr[i];
        [item sizeToFit];
        w = item.frame.size.width;
        h = item.frame.size.height;
        x -= w;
        y = WL_STATUS_BAR_H + (self.frame.size.height - WL_STATUS_BAR_H - h) / 2.0;
        item.frame = CGRectMake(x, y, w, h);
        x = CGRectGetMinX(item.frame) - self.itemSpacing;
        rightMinX = x;
    }
    if (leftMaxX > self.frame.size.width - rightMinX) {
        rightMinX = self.frame.size.width - leftMaxX;
    }
    if (self.frame.size.width - rightMinX > leftMaxX) {
        leftMaxX = self.frame.size.width - rightMinX;
    }
    [self.titleItem sizeToFit];
    w = MIN(self.titleItem.frame.size.width, rightMinX - leftMaxX - self.itemSpacing * 2);
    h = self.titleItem.frame.size.height;
    y = WL_STATUS_BAR_H + (self.frame.size.height - WL_STATUS_BAR_H - h) / 2.0;
    x = leftMaxX + (rightMinX - leftMaxX - w) / 2.0;
    self.titleItem.frame = CGRectMake(x, y, w, h);
    self.titleItem.center = CGPointMake(self.frame.size.width * 0.5, self.titleItem.center.y);
    
    x = 0;
    y = self.frame.size.height - 0.5;
    w = self.frame.size.width;
    h = 0.5;
    self.lineView.frame = CGRectMake(x, y, w, h);
}
@end
