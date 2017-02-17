//
//  SecondViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "SecondViewController.h"
#import "Routable.h"

@interface SecondViewController () <ReverseValueProtocol>

/** button */
@property (strong, nonatomic) UIButton *button;

@end

@implementation SecondViewController

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        NSLog(@"%s, %@", __FUNCTION__, params[@"title"]);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"clike me" forState:UIControlStateNormal];
    [_button setFrame:CGRectMake(100, 50, 100, 50)];
    [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

#pragma mark - Target Action

- (void)buttonClick {
    // 需要逆向传递数据
    if ([self.delegate respondsToSelector:@selector(reverseValue:)]) {
        [self.delegate reverseValue:@"come from SecondViewController"];
    }
}

@end
