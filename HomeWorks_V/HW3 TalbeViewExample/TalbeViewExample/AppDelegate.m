//
//  AppDelegate.m
//  TalbeViewExample
//
//  Created by Sergey Zalozniy on 11/10/14.
//  Copyright (c) 2014 Mozi Development. All rights reserved.
//

#import "MyTableViewController.h"

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    self.window.frame = CGRectMake(0, 0, 320, 480); //[UIScreen mainScreen].bounds
    MyTableViewController *controller = [[MyTableViewController alloc] init];
    controller.view.backgroundColor = [UIColor greenColor];
    
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}


@end
