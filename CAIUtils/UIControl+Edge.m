//
//  UIResponder+Edge.m
//  CAIUtils
//
//  Created by 李玉峰 on 15/3/5.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "UIControl+Edge.h"
#import <objc/runtime.h>

@implementation UIControl (Edge)

static char insetTop;
static char insetRight;
static char insetBottom;
static char insetLeft;

- (void)changeTouchAreaWithEdgeInsets:(UIEdgeInsets)edgeInsets{
    objc_setAssociatedObject(self, &insetTop, [NSNumber numberWithFloat:edgeInsets.top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &insetRight, [NSNumber numberWithFloat:edgeInsets.right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &insetBottom, [NSNumber numberWithFloat:edgeInsets.bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &insetLeft, [NSNumber numberWithFloat:edgeInsets.left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &insetTop);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &insetRight);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &insetBottom);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &insetLeft);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
