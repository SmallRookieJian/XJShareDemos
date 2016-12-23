//
//  XJMenuItem.m
//  wuya
//
//  Created by trq on 16/12/20.
//  Copyright © 2016年 chengcheng. All rights reserved.
//

#import "XJMenuItem.h"

@implementation XJMenuItem

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
        
        [self addSubview:self.labelTitle];
        
    }
    return self;
}

- (void)layoutSubviews {
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
}

- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc] init];
        
        _labelTitle.textColor = [UIColor whiteColor];
        _labelTitle.font = [UIFont systemFontOfSize:15];
        _labelTitle.textAlignment = NSTextAlignmentCenter;
//        _labelTitle.backgroundColor = [UIColor greenColor];
    }
    return _labelTitle;
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.labelTitle.text = title;
    
}

@end
