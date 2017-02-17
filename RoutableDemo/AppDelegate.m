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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
 
    [[Routable sharedRouter] map:@"SecondViewController" toController:[SecondViewController class]];
    [[Routable sharedRouter] map:@"ViewController" toController:[ViewController class]];
    
    UINavigationController *nc = [[UINavigationController alloc] init];
    [[Routable sharedRouter] setNavigationController:nc];
    
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    [[Routable sharedRouter] open:@"ViewController"];
    
    return YES;
}

@end
