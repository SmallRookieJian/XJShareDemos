//
//  XJSuspendMenu.m
//  KeyboardProblem
//
//  Created by trq on 16/12/19.
//  Copyright © 2016年 Jean. All rights reserved.
//

#import "XJSuspendMenu.h"



@interface XJSuspendMenu ()
{
    NSInteger _itemsCount;
}


@end

@implementation XJSuspendMenu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        
//        self.backgroundColor = [UIColor greenColor];
        
//        CGFloat itemWidth = self
        
        [self addSubview:self.imgViewBG];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [self.imgViewBG mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        
    }];
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    NSInteger count = [self itemsCount];
    [self addItems:count];
    
}

- (NSInteger)itemsCount {
    NSInteger itemNum = 0;
    
    if (self.datasource && [self.datasource respondsToSelector:@selector(numberOfMenu:)]) {
        itemNum = [self.datasource numberOfMenu:self];
    }
    _itemsCount = itemNum;
    return itemNum;
}

- (void)addItems:(NSInteger)itemsCount {
    
    UIView *lastView = nil;
    
    for (int i = 0; i < itemsCount; i++) {
        
        XJMenuItem *item = [[XJMenuItem alloc] init];
        
        CGFloat aa = arc4random()%255;
        
        item.backgroundColor = [UIColor colorWithWhite:aa/255.0 alpha:1];
        
        if (self.datasource && [self.datasource respondsToSelector:@selector(menu:itemAtIndex:)]) {
            
            item = [self.datasource menu:self itemAtIndex:i];
            
        }
        [self addSubview:item];
        if (lastView) {
            
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.bottom.mas_equalTo(0);
                make.left.equalTo(lastView.mas_right);
                make.width.mas_equalTo(lastView.mas_width);
                
            }];
            
        }
        else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.bottom.mas_equalTo(0);
                make.left.mas_equalTo(0);
                
            }];
        }
        
        [item addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        item.tag = i;
        lastView = item;
    }
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(0);
    }];
    
}

- (void)reloadSubviews {
    
    NSArray *array = [self subviews];
    for (UIView *vv in array) {
        
        [vv removeFromSuperview];
        
    }
    
    [self addSubview:self.imgViewBG];
    
    NSInteger count = [self itemsCount];
    [self addItems:count];
    
    
}

- (void)showMenuInView:(UIView *)view withRect:(CGRect)rect {
    
    //开始这里可以添加willAppear代理方法的调用
    
    self.frame = rect;
    
    [view addSubview:self];
    
    //结束这里可以添加didAppear代理方法的调用
}

- (void)showMenuInView:(UIView *)view withPoint:(CGPoint)point {
    
    //这里先默认 单个item的宽：80 高：60
    
    [self reloadSubviews];
    
    CGFloat width = [self itemsCount] * 80;
    CGFloat height = 60;
    
    self.center = CGPointMake(point.x, point.y-height/2);
    self.bounds = CGRectMake(0, 0, width, height);
    
    [view addSubview:self];
    
}


- (void)menuDismiss {
    //开始这里可以添加will disappear
    
    [self removeFromSuperview];
    
    //结束这里可以添加did disappear
}

#pragma mark - getter and setter
- (void)setBgImgName:(NSString *)bgImgName {
    
    _bgImgName = bgImgName;
    
    UIImage *image = [UIImage imageNamed:bgImgName];
    
    self.imgViewBG.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, image.size.height/2, image.size.width+20) resizingMode:UIImageResizingModeStretch];
    
}

#pragma mark - 视图初始化
- (UIImageView *)imgViewBG {
    
    if (!_imgViewBG) {
        _imgViewBG = [[UIImageView alloc] init];
        
        _imgViewBG.backgroundColor = [UIColor clearColor];
        
    }
    return _imgViewBG;
}

- (void)itemClicked:(XJMenuItem *)item {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(menu:didSelectItemAtIndex:)]) {
        
        [self.delegate menu:self didSelectItemAtIndex:item.tag];
        
    }
    
}

@end
