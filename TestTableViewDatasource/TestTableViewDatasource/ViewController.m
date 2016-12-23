//
//  ViewController.m
//  TestTableViewDatasource
//
//  Created by trq on 16/12/23.
//  Copyright © 2016年 Jean. All rights reserved.
//

#import "ViewController.h"

#import "XJSuspendMenu.h"

@interface ViewController ()<XJSuspendMenuDelegate
,XJSuspendMenuDatasource
>

/**
 *  suspend menu
 */
@property (nonatomic, strong) XJSuspendMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (XJSuspendMenu *)menu {
    if (!_menu) {
        _menu = [[XJSuspendMenu alloc] init];
        _menu.datasource = self;
        _menu.delegate = self;
        _menu.bgImgName = @"menu";
    }
    return _menu;
}

#pragma mark - XJSuspendMenuDelegate
- (NSInteger)numberOfMenu:(XJSuspendMenu *)menu {
    return 2;
}

- (XJMenuItem *)menu:(XJSuspendMenu *)menu itemAtIndex:(NSInteger)index {
    
    XJMenuItem *item = [[XJMenuItem alloc] init];
    
    item.title = @"撤回";
    //    item.imageName = @"1.jpg";
    
    return item;
}

- (void)menu:(XJSuspendMenu *)menu didSelectItemAtIndex:(NSInteger)index {
    
    [menu menuDismiss];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches allObjects][0];
    CGPoint point = [touch locationInView:self.view];
    
    [self.menu showMenuInView:self.view withPoint:point];
}

@end
