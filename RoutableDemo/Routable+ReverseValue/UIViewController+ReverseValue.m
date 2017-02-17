//
//  UIViewController+ReverseValue.m
//  Routable
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "UIViewController+ReverseValue.h"
#import <objc/runtime.h>

@implementation UIViewController (ReverseValue)

- (id<ReverseValueProtocol>)delegate {
    return objc_getAssociatedObject(self, @selector(delegate));
}

- (void)setDelegate:(id<ReverseValueProtocol>)delegate {
    objc_setAssociatedObject(self, @selector(delegate), delegate, OBJC_ASSOCIATION_ASSIGN);
}

@end
