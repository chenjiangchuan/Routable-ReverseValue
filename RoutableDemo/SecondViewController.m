//
//  SecondViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () 

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
    
    self.navigationItem.title = @"第二个控制器";
}

@end
