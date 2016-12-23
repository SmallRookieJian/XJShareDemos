//
//  XJSuspendMenu.h
//  KeyboardProblem
//
//  Created by trq on 16/12/19.
//  Copyright © 2016年 Jean. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SuspendItem.h"
#import "XJMenuItem.h"
@class XJSuspendMenu;

@protocol XJSuspendMenuDatasource <NSObject>

- (NSInteger)numberOfMenu:(XJSuspendMenu *)menu;

- (XJMenuItem *)menu:(XJSuspendMenu *)menu itemAtIndex:(NSInteger)index;

@end

@protocol XJSuspendMenuDelegate <NSObject>

@optional
- (void)menu:(XJSuspendMenu *)menu didSelectItemAtIndex:(NSInteger)index;

@end

@interface XJSuspendMenu : UIView

/**
 *  datasource
 */
@property (nonatomic, assign) id <XJSuspendMenuDatasource> datasource;

/**
 *  delegate
 */
@property (nonatomic, assign) id <XJSuspendMenuDelegate> delegate;

/**
 *  菜单图片数组
 */
@property (nonatomic, strong) NSArray *arrayImages;

/**
 *  菜单标题数组
 */
@property (nonatomic, strong) NSArray *arrayTexts;

/**
 *  背景图片名称
 */
@property (nonatomic, copy) NSString *bgImgName;

/**
 *  背景图片视图
 */
@property (nonatomic, strong) UIImageView *imgViewBG;

- (void)showMenuInView:(UIView *)view withRect:(CGRect)rect;
- (void)showMenuInView:(UIView *)view withPoint:(CGPoint)point;

//- (void)showMenuWithBlock:(void (^)(UIView *superView,CGPoint point))localBlcok;

- (void)menuDismiss;

@end
