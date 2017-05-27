//
//  UIViewController+ReverseValue.m
//  Routable
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "UIViewController+ReverseValue.h"
#import <objc/runtime.h>

const static void *JCReverseValueDelegateKey = &JCReverseValueDelegateKey;

@implementation UIViewController (ReverseValue)

- (id<JCReverseValueProtocol>)JCReverseValueDelegate {
    return objc_getAssociatedObject(self, JCReverseValueDelegateKey);
}

- (void)setJCReverseValueDelegate:(id<JCReverseValueProtocol>)JCReverseValueDelegate {
    objc_setAssociatedObject(self, JCReverseValueDelegateKey, JCReverseValueDelegate, OBJC_ASSOCIATION_ASSIGN);
}

@end
