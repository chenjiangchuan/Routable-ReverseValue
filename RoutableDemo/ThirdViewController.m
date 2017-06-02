//
//  ThirdViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/6/2.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "ThirdViewController.h"
#import "Routable.h"

@interface ThirdViewController ()

/** button */
@property (strong, nonatomic) UIButton *button;

@end

@implementation ThirdViewController

#pragma mark - Routable Init

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        NSLog(@"%s, params = %@", __FUNCTION__, params);
    }
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"clike me" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button setFrame:CGRectMake(100, 100, 100, 50)];
    [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}


#pragma mark - Target Action

- (void)buttonClick {
    // 需要逆向传递数据
    if ([self.JCReverseValueDelegate respondsToSelector:@selector(jc_reverseValue:)]) {
        [self.JCReverseValueDelegate jc_reverseValue:@"come from ThirdViewController"];
    }
}

@end
