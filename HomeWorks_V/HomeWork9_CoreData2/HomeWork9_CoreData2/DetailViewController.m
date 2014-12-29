//
//  DetailViewController.m
//  HomeWork9_CoreData2
//
//  Created by admin on 28.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize infoTaskEdit;
@synthesize infoTask;

NSString *changeText;

// лейбл
//.................................................
//#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//            
//        // Update the view.
//        [self configureView];
//    }
//}
//- (void)configureView {
//    // Update the user interface for the detail item.
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"name"] description];
//    }
//}
//.................................................
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    
    if(self.infoTask)
    {
        [self.infoTaskEdit setText:[self.infoTask valueForKey:@"name"]];
        changeText = [self.infoTask valueForKey:@"name"];
    }
//    else if (self.infoTask == nil)
//    {
//            NSLog(@"You have clicked Ok");
//    }
 }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//..............................................

- (IBAction)changeTextTask:(id)sender
{
    [infoTaskEdit addTarget:self action:@selector(textFieldShouldEndEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    changeText = [self.infoTaskEdit valueForKey:@"name"];
    changeText = infoTaskEdit.text;
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    if(self.infoTaskEdit)
    {
        [self.infoTaskEdit setValue:changeText forKey:@"name"];
    }
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//..............................................











@end
