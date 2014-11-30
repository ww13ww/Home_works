//
//  ViewController.m
//  HomeWork6
//
//  Created by admin on 27.11.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "ViewController.h"
#import "DeviceDetailController.h"

@interface ViewController () < UITableViewDataSource, UITableViewDelegate >
{
    NSDictionary * devices;
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.deviceTable.dataSource = self;
    self.deviceTable.delegate = self;
    
    NSArray * iPhones = @[@"IPhone_3GS", @"IPhone_4", @"IPhone_4s", @"IPhone_5", @"IPhone_6"];
    NSArray * iPads   = @[@"IPad_2", @"IPad_3", @"IPad_Air_2", @"IPad_Mini_3", @"IPad_Mini_2"];
    
    devices = [[NSDictionary alloc] initWithObjectsAndKeys:
                            iPhones, @"keyPhone",
                            iPads, @"keyPad",
                            nil];

    NSLog(@"Device log = %@", [devices objectForKey: @"keyPhone"]);
}



// рукописание
-(NSArray *) sections {
    return  [devices allKeys];
}
- (NSString *) keyForSection: (int) section {
    return [self.sections objectAtIndex:section ];
}



// DATASOURCE
//все что спрашивает тейбл вью ----------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * key = [ self keyForSection:(int)section];
    NSArray * arrayForSection = [devices objectForKey:key];

    return [arrayForSection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSString * key = [ self keyForSection:(int)indexPath.section];
    NSArray * arrayForSection = [devices objectForKey:key];
    
    cell.textLabel.text = [arrayForSection objectAtIndex: indexPath.row];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self sections] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self keyForSection:(int)section];
}



// DELEGATE
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"SECTION: %i ROW: %i", (int)indexPath.section, (int)indexPath.row);

    NSString * key = [ self keyForSection:(int)indexPath.section];
    NSArray * arrayForSection = [devices objectForKey:key];
    NSString * device = [arrayForSection objectAtIndex: indexPath.row];

    UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
//    s = [s instantiateViewControllerWithIdentifier:@"details"];
    
    NSString * className = NSStringFromClass( [DeviceDetailController class]);
    DeviceDetailController * deviceController = [s instantiateViewControllerWithIdentifier:className];
    
    [deviceController setDeviceName:device];
//    [deviceController view];
//    deviceController.label.text = device;
    
    [self presentViewController:deviceController animated:YES completion:nil];

}


@end
