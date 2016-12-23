//
//  SuspendItem.m
//  KeyboardProblem
//
//  Created by trq on 16/12/19.
//  Copyright © 2016年 Jean. All rights reserved.
//

#import "SuspendItem.h"

@implementation SuspendItem

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
        [self addSubview:self.imgView];
        [self addSubview:self.labelTitle];
    }
    return self;
}

- (void)layoutSubviews {
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        
        make.height.mas_equalTo(self.labelTitle.mas_height).multipliedBy(2);
    }];
    
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.imgView.mas_bottom).offset(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        make.height.equalTo(self.imgView.mas_height).multipliedBy(0.5);
        
    }];
    
    
}

#pragma mark - 视图初始化
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        
        _imgView.backgroundColor = [UIColor cyanColor];
        
//        _imgView.image = [UIImage imageNamed:@"head.png"];
        
    }
    return _imgView;
}

- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc] init];
        
        _labelTitle.backgroundColor = [UIColor yellowColor];
//        _labelTitle.text = @"你好啊！";
        _labelTitle.textAlignment = NSTextAlignmentCenter;
        _labelTitle.font = [UIFont systemFontOfSize:11];
        
    }
    return _labelTitle;
}

#pragma mark - setter and getter 
- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.labelTitle.text = title;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    
    self.imgView.image = [UIImage imageNamed:imageName];
}

@end
