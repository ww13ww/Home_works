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
    NSString *switchTask;
    
    
//    NSString *completeTask;
    switchTask = [self.infoTask valueForKey:@"switch"];
    if ([switchTask isEqualToString:@"1"]) {
//        [checkDoneTask setOn:YES animated:YES];
        checkDoneTask.selectedSegmentIndex = 1;
    }
    else if ([switchTask isEqualToString:@"0"]){
//        [checkDoneTask setOn:NO animated:YES];
        checkDoneTask.selectedSegmentIndex = 0;
    }

    if(self.infoTask)
    {
        [self.infoTaskEdit setText:[self.infoTask valueForKey:@"name"]];
        changeText = [self.infoTask valueForKey:@"name"];
    }
}
    //--------------------
//    switchTask = [self.infoTask valueForKey:@"switch"];
//        if([switchTask isEqualToString:@"1"])
    
//            UISegmentedControl *segmentedControl;  // add this to your (.h) file
//    
//    segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
//    [segmentedControl insertSegmentWithTitle:@"Red" atIndex:0 animated:YES];
//    [segmentedControl insertSegmentWithTitle:@"Green" atIndex:1 animated:YES];
//    [segmentedControl insertSegmentWithTitle:@"Blue" atIndex:2 animated:YES];
//    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBezeled;
//    segmentedControl.frame = CGRectMake(0, 0, 320, 40);
//    segmentedControl.selectedSegmentIndex = 0;
//    segmentedControl.tintColor = [UIColor blackColor];
//    segmentedControl.backgroundColor = [UIColor blackColor];
//    [segmentedControl setMomentary:NO];   // imp property (change it & see magic)
//    
//    [segmentedControl addTarget:self action:@selector(segmentSwitch:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:segmentedControl];
            
//            undone.selectedSegmentIndex = 1;
//            [switchTask setSelectedSegmentIndex:0];
//        {}
//        else if ([switchTask isEqualToString:@"0"])
//        {}
//        if ([switchTask isEqualToString:@"1"]) {
//            [TaskSwitch setOn:YES animated:YES];
//        }
//        else if ([switchTask isEqualToString:@"0"]){
//            [TaskSwitch setOn:NO animated:YES];
//        }
//            segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
//            
//            segmentedControl.segmentedControlStyle = UISegmentedControlStyleBezeled;
//            segmentedControl.frame = CGRectMake(0, 6, 320, 40);
//            segmentedControl.selectedSegmentIndex = 0;
//            [segmentedControl addTarget:self action:@selector(segmentSwitch:) forControlEvents:UIControlEventValueChanged];
//            

    
    //    completeTask = [self.editedTask valueForKey:@"completed"];
//    if ([completeTask isEqualToString:@"1"]) {
//        [TaskSwitch setOn:YES animated:YES];
//    }
//    else if ([completeTask isEqualToString:@"0"]){
//        [TaskSwitch setOn:NO animated:YES];
//    }
//=========
    
    
//        }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//..............................................

- (IBAction)changeTextTask:(id)sender
{
}


- (IBAction)cancel:(id)sender
{
        [self.navigationController popToRootViewControllerAnimated:YES];
    //    [self dismissViewControllerAnimated:YES completion:nil];
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
    // Save
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//..............................................
//- (IBAction)segValChange:(id)sender
//{
//    
//    if(lblSegChange.selectedSegmentIndex==0)
//    {
//        viewcontroller1 *View=[[viewcontroller alloc]init];
//        [self.navigationController pushViewController:view animated:YES];
//    }
//    else if (lblSegChange.selectedSegmentIndex==1)
//    {
//        viewcontroller2 *View2=[[viewcontroller2 alloc]init];
//        [self.navigationController pushViewController:view2 animated:YES];
//    }
//}

- (IBAction)DoneSwitchTask:(id)sender {
//    NSInteger selectedSegment = sender.selectedSegmentIndex;
//        NSInteger selectedSegment = [self._DoneSwitchTask selectedSegmentIndex];
    NSInteger index = ((UISegmentedControl*)sender).selectedSegmentIndex;

//    NSInteger selectedSegment = [segmentControl setSelectedSegmentIndex:2];
//        switchTask = [self.infoTask valueForKey:@"switch"];
//    [self addTarget:self action:@selector(didValueChanged:) forControlEvents:UIControlEventValueChanged];
    if(index==0)
        {
        NSLog(@"You have clicked 0");
        [self.infoTask setValue:@"1" forKey:@"switch"];
            
//            [self.threadedView setSelectedSegmentIndex:0];
        }
    else if (index==1)
        {
            NSLog(@"You have clicked 1");
            [self.infoTask setValue:@"0" forKey:@"switch"];
            
        }
    //    NSString *completedValue;
//        completedValue = [self.infoTask valueForKey:@"switch"];
//    if ([switchTask isEqualToString:@"1"]) {
//        NSLog(@"You have clicked 1");
//        [self.infoTask setValue:@"0" forKey:@"switch"];
//        //            [mapUserPreferences setInteger:index forKey:@"mapViewKey"];
//    }
//    else if ([switchTask isEqualToString:@"0"]){
//        NSLog(@"You have clicked 0");
//        [self.infoTask setValue:@"1" forKey:@"switch"];
        //            [mapUserPreferences setInteger:index forKey:@"mapViewKey"];
    }

    ////======================
//        if ([switchTask isEqualToString:@"1"]) {
//            NSLog(@"You have clicked 1");
//            [self.infoTask setValue:@"0" forKey:@"switch"];
////            [mapUserPreferences setInteger:index forKey:@"mapViewKey"];
//        }
//        else if ([switchTask isEqualToString:@"0"]){
//            NSLog(@"You have clicked 0");
//            [self.infoTask setValue:@"1" forKey:@"switch"];
////            [mapUserPreferences setInteger:index forKey:@"mapViewKey"];
//                }

//}

//- (IBAction)changeMapType: (id)sender{
//    
//    
//    NSInteger index = ((UISegmentedControl*)sender).selectedSegmentIndex;
//    
//    // Get the shared defaults object.
//    NSUserDefaults *mapUserPreferences = [NSUserDefaults standardUserDefaults];
//    
//    if(segmentedControlMapType.selectedSegmentIndex == 0){
//        // Save the index.
//        [mapUserPreferences setInteger:index forKey:@"mapViewKey"];
//        
//    }
//    else if(segmentedControlMapType.selectedSegmentIndex == 1){
//        // Save the index.
//        [mapUserPreferences setInteger:index forKey:@"mapViewKey"];
//    }
//    else if(segmentedControlMapType.selectedSegmentIndex == 2){
//        // Save the index.
//        [mapUserPreferences setInteger:index forKey:@"mapViewKey"];
//        
//    }

    // Write them to disk
//    [mapUserPreferences synchronize];
//}




//------------
//- (IBAction)DoneSwitchTask:(UISegmentedControl *)sender
//{
//    NSInteger selectedSegment = sender.selectedSegmentIndex;
//    
//    switchTask = [self.infoTask valueForKey:@"switch"];
//    
//    if(selectedSegment==0)
//    {
//    NSLog(@"You have clicked 0");
//    }
//    else if (selectedSegment==1)
//    {
//        NSLog(@"You have clicked 0");
//
//    }
////    NSString *completedValue;
//    completedValue = [self.editedTask valueForKey:@"completed"];
//    
//    if ([completedValue isEqualToString:@"1"]) {
//        
//        [self.editedTask setValue:@"0" forKey:@"completed"];
//    }
//    else if ([completedValue isEqualToString:@"0"]){
//        
//        [self.editedTask setValue:@"1" forKey:@"completed"];
//    }
//}









@end
