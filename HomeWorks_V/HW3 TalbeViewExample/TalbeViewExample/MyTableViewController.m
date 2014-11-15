//
//  MyTableViewController.m
//  TalbeViewExample
//
//  Created by Sergey Zalozniy on 11/10/14.
//  Copyright (c) 2014 Mozi Development. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = self.view.frame;
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    
    self.items = [[NSArray alloc] initWithObjects:@"Objective-C cookbook",
                  @"Swift",
                  @"Java",
                  @"Pascal", nil];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

@end
