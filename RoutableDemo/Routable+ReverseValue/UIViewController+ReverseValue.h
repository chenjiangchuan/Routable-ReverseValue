//
//  UIViewController+ReverseValue.h
//  Routable
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCReverseValueProtocol.h"

@interface UIViewController (ReverseValue) <JCReverseValueProtocol>

/** ReverseValueProtocol */
@property (weak, nonatomic) id<JCReverseValueProtocol> JCReverseValueDelegate;

@end
