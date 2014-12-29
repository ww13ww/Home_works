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

//бывший лейбл инфо - удален
//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

//текст таска
@property (weak, nonatomic) IBOutlet UITextField *infoTaskEdit;
- (IBAction) changeTextTask:(id)sender;

//переключатель - сделано/не сделано
@property (weak, nonatomic) IBOutlet UISegmentedControl *checkTask;

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