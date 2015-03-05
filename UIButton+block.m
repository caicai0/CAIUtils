//
//  UIButton+block.m
//  CNHC
//
//  Created by liyufeng on 14/12/5.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "UIButton+block.h"
#import <objc/runtime.h>

@implementation UIButton(block)

static char overviewKey;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}

@end
