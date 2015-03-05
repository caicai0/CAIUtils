//
//  UIView+showBourder.m
//  epubDemo
//
//  Created by liyufeng on 15/1/20.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "UIView+showBorder.h"

@implementation UIView(showBorder)

- (void)showBorder{
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 0.5;
}

- (void)showSubViewBorder{
    [self showBorder];
    for (UIView * view in self.subviews) {
        [view showSubViewBorder];
    }
}

- (void)log:(NSMutableString *)str{
    printf("%s%s\n",[str cStringUsingEncoding:NSUTF8StringEncoding],[self.description cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void)logSubViewsWithString:(NSMutableString *)str{
    [self log:str];
    if (self.subviews && self.subviews.count) {
        [str appendString:@"-"];
        for (UIView * view in self.subviews) {
            [view logSubViewsWithString:str];
        }
        [str deleteCharactersInRange:NSMakeRange(str.length-1, 1)];
    }
}

- (void)logSubViews{
    NSMutableString * str = [NSMutableString stringWithString:@"-"];
    printf("%s",[@"\n\n=================logSubViews==================\n" cStringUsingEncoding:NSUTF8StringEncoding]);
    [self logSubViewsWithString:str];
    printf("%s",[@"=================logSubViews==================\n\n" cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
