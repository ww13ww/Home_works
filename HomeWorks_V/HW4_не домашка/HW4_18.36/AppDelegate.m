//
//  AppDelegate.m
//  HW4_18.36
//
//  Created by admin on 16.11.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CustomTableViewController *custom = [[CustomTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *navCustom = [[UINavigationController alloc] initWithRootViewController:custom];
    self.window.rootViewController = navCustom;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
