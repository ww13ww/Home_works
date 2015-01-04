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

//текст таска
@property (weak, nonatomic) IBOutlet UITextField *infoTaskEdit;         //editTask
- (IBAction) changeTextTask:(id)sender;                                 //changingTask

//переключатель - сделано/не сделано
@property (strong, nonatomic) NSManagedObject *switchTask;
@property (weak, nonatomic) IBOutlet UISegmentedControl *checkDoneTask;
//UISegmentedControl *checkTask;
- (IBAction)DoneSwitchTask:(id)sender;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *DoneSwitchTask;
//- (IBAction)DoneSwitchTask:(id)sender;


//редактирование/сейв/кенсел - все понятно и без коментариев
@property (strong, nonatomic) NSManagedObject *infoTask;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;


@end



//
//NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
//NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];


//     detailController.infoTask = object ;