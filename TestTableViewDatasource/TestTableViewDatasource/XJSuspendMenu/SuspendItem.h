//
//  SuspendItem.h
//  KeyboardProblem
//
//  Created by trq on 16/12/19.
//  Copyright © 2016年 Jean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuspendItem : UIControl

/**
 *  img view
 */
@property (nonatomic, strong) UIImageView *imgView;

/**
 *  title label
 */
@property (nonatomic, strong) UILabel *labelTitle;

//- (instancetype)initWithSuspendItem:(SuspendItem *)item;

/**
 *  title
 */
@property (nonatomic, copy) NSString *title;

/**
 *  imgae name
 */
@property (nonatomic, copy) NSString *imageName;

@end
