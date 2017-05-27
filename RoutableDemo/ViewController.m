//
//  ViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "ViewController.h"
#import "Routable.h"
#import "JCView.h"

@interface ViewController ()

/** button */
@property (strong, nonatomic) UIButton *button;
/** JCView */
@property (strong, nonatomic) JCView *jcView;

@end

@implementation ViewController

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"clike me" forState:UIControlStateNormal];
    [_button setFrame:CGRectMake(50, 50, 100, 50)];
    [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_button];
    [self.view addSubview:self.jcView];
    self.jcView.frame = CGRectMake(50, 50, 100, 50);
}

- (JCView *)jcView {
    if (_jcView == nil) {
        _jcView = [[JCView alloc] init];
    }
    return _jcView;
}

#pragma mark - Target Action

- (void)buttonClick {
    [[Routable sharedRouter] open:@"SecondViewController"
                         animated:YES
                      extraParams:@{@"title" : @"come from ViewController"}
                   delegateObject:self];
}

#pragma mark - ReverseValueProtocol

- (void)jc_reverseValue:(id)value {
    NSLog(@"%s:%@", __FUNCTION__, value);
}

@end
