//
//  UIButton+block.h
//  CNHC
//
//  Created by liyufeng on 14/12/5.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)();
@interface UIButton(block)

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
