//
//  AppDelegate.m
//  HomeWork9_CoreData2
//
//  Created by admin on 28.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "MasterViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    // Override point for customization after application launch.
//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    
//    MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
//    controller.managedObjectContext = self.managedObjectContext;
    
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
    MasterViewController *controller = (MasterViewController *)masterNavigationController.topViewController;
    controller.managedObjectContext = self.managedObjectContext;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    if ([secondaryViewController isKindOfClass:[UINavigationController class]]
        && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]]
        && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - Core Data stack

@synthesize managedObjectContext        = _managedObjectContext;
@synthesize managedObjectModel          = _managedObjectModel;
@synthesize persistentStoreCoordinator  = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    
    NSURL *modelURL     = [[NSBundle mainBundle] URLForResource:@"HomeWork9_CoreData2" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL             = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"HomeWork9_CoreData2.sqlite"];
    NSError *error              = nil;
    NSString *failureReason     = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        // Report any error we got.
        NSMutableDictionary *dict               = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey]         = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey]  = failureReason;
        dict[NSUnderlyingErrorKey]              = error;
        error                                   = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator)
    {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
