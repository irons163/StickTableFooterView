//
//  ViewWithOutboundsButtons.m
//  StickTableFooterView
//
//  Created by Phil on 2021/5/7.
//

#import "ViewWithOutboundsButtons.h"

@implementation ViewWithOutboundsButtons

- (UIView * _Nullable)hitTestOutbounds:(const CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *subview in self.subviews) {
        if (CGRectContainsPoint(subview.frame, point)) {
            if ([subview isKindOfClass:ViewWithOutboundsButtons.class]) {
                CGPoint convertPoint = [self convertPoint:point toView:subview];
                return [subview hitTest:convertPoint withEvent:event];
            } else if ([subview isKindOfClass:UIControl.class]) {
                return subview;
            }
        }
    }
    
    return nil;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [self hitTestOutbounds:point withEvent:event];
    
    if (view) {
        return view;
    }
    
    return [super hitTest:point withEvent:event];
}

@end
