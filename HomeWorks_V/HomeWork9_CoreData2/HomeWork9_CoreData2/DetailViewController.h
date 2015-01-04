//
//  DetailViewController.h
//  HomeWork9_CoreData2
//
//  Created by admin on 28.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MasterViewController.h"

@interface DetailViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) id detailItem;

//task text field
@property (weak, nonatomic) IBOutlet UITextField *infoTaskEdit;
- (IBAction) changeTextTask:(id)sender;

//segment control DONE/UNDONE
@property (strong, nonatomic) NSManagedObject *switchTask;
@property (weak, nonatomic) IBOutlet UISegmentedControl *checkDoneTask;
- (IBAction)DoneSwitchTask:(id)sender;

// edit/cancel/save
@property (strong, nonatomic) NSManagedObject *infoTask;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
