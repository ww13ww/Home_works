//
//  MasterViewController.h
//  HomeWork9_CoreData
//
//  Created by admin on 26.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

//@class DetailViewController;


@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

//@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

