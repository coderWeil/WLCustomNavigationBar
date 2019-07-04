//
//  WLNavigationBar.h
//  WLCustomNavigationBar
//
//  Created by weil on 2019/7/3.
//  Copyright © 2019 AllYoga. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNavigationBar : UIView
//左边新增item
- (void) wl_addLeftItem:(UIView *)item;
- (void) wl_insertLeftItem:(UIView *)item atIndex:(int)index;
//右边新增或者插入item
- (void) wl_addRightItem:(UIView *)item;
- (void) wl_insertRightItem:(UIView *)item atIndex:(int)index;
//设置标题item
- (void) wl_setTitleItem:(UIView *)item;
//左边删除item
- (void) wl_removeLeftItem:(UIView *)item;
- (void) wl_removeLeftItemAtIndex:(int)index;
//右边删除item
- (void) wl_removeRightItem:(UIView *)item;
- (void) wl_removeRightItemAtIndex:(int)index;
//更新左侧item
- (void) wl_updateLeftItem:(UIView *)item atIndex:(int)index;
//更新所有左侧item的透明度
- (void) wl_updateLeftAlpha:(CGFloat)alpha;
//更新左侧某一个item的透明度
- (void) wl_updateLeftItemAlpha:(CGFloat)alpha atIndex:(int)index;
//更新左侧所有item的背景色
- (void) wl_updateLeftBackgroundColor:(UIColor *)color;
//更新左右某一个item的背景色
- (void) wl_updateLeftItemBackgroundColor:(UIColor *)color atIndex:(int)index;
//更新右侧item
- (void) wl_updateRightItem:(UIView *)item atIndex:(int)index;
//更新所有右侧item的透明度
- (void) wl_updateRightAlpha:(CGFloat)alpha;
//更新右侧某一个item的透明度
- (void) wl_updateRighItemAlpha:(CGFloat)alpha atIndex:(int)index;
//更新右侧所有item的背景色
- (void) wl_updateRightBackgroundColor:(UIColor *)color;
//更新右侧某一个item的背景色
- (void) wl_updateRightItemBackgroundColor:(UIColor *)color atIndex:(int)index;
//更新标题item
- (void) wl_updateTitleItem:(UIView *)item;
//更新标题的透明度
- (void) wl_updateTitleAlpha:(CGFloat)alpha;
//更新标题的颜色
- (void) wl_updateTitleColor:(UIColor *)color;
//设置背景色,可以通过颜色的colorWithAlphaComponent设置透明度
- (void) wl_setBackgroundColor:(UIColor *)backgroundColor;
//设置透明度，背景颜色采用上述设置的
- (void) wl_setAlpha:(CGFloat)alpha;
//布局子视图
- (void) wl_reload;
//设置总体内容的左右边距,主要针对左右，默认是0
- (void) wl_setMargin:(CGFloat)margin;
//设置左或者右每两个item之间的间距,默认是0
- (void) wl_setItemSpace:(CGFloat)space;
//设置底部细线的颜色
- (void) wl_setLineViewColor:(UIColor *)color;
//设置底部细线的透明度
- (void) wl_setLineAlpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
