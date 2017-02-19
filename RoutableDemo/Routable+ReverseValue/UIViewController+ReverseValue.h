//
//  UIViewController+ReverseValue.h
//  Routable
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReverseValueProtocol.h"

@interface UIViewController (ReverseValue) <ReverseValueProtocol>

/** ReverseValueProtocol */
@property (weak, nonatomic) id<ReverseValueProtocol> delegate;

@end
