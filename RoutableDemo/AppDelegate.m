//
//  AppDelegate.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "AppDelegate.h"
#import "Routable.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "TabBarController.h"
#import "ThirdViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
 
    // 1
    [[Routable sharedRouter] map:@"SecondViewController" toController:[SecondViewController class]];
    [[Routable sharedRouter] map:@"ViewController" toController:[ViewController class]];
    [[Routable sharedRouter] map:@"ThirdViewController" toController:[ThirdViewController class]];
    
    // 2
    self.window.rootViewController = [[TabBarController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
