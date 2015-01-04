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
@synthesize checkDoneTask;

NSString *changeText;
NSString *switchTask;

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *switchTask;
    
    switchTask = [self.infoTask valueForKey:@"switch"];
    if ([switchTask isEqualToString:@"1"])
    {
        NSLog(@"You have 1");
        checkDoneTask.selectedSegmentIndex = 1;
    }
    else if ([switchTask isEqualToString:@"0"])
    {
        NSLog(@"You have 0");
        checkDoneTask.selectedSegmentIndex = 0;
    }

    if(self.infoTask)
    {
        [self.infoTaskEdit setText:[self.infoTask valueForKey:@"name"]];
        changeText = [self.infoTask valueForKey:@"name"];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//..............................................
- (IBAction)changeTextTask:(id)sender
{
}

- (IBAction)DoneSwitchTask:(id)sender
{
    NSInteger index = ((UISegmentedControl*)sender).selectedSegmentIndex;
    
    if(index==0)
    {
        NSLog(@"You have clicked 0");
        [self.infoTask setValue:@"0" forKey:@"switch"];
    }
    else if (index==1)
    {
        NSLog(@"You have clicked 1");
        [self.infoTask setValue:@"1" forKey:@"switch"];
    }
}

- (IBAction)cancel:(id)sender
{
        [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    if(self.infoTask)
    {
        [infoTaskEdit addTarget:self action:@selector(textFieldShouldEndEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        changeText = infoTaskEdit.text;
        
        if (![changeText isEqualToString:@""])
        {
            [self.infoTask setValue:changeText forKey:@"name"];
        }
    }
    
    NSError *error = nil;
    if (![context save:&error])
    {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
