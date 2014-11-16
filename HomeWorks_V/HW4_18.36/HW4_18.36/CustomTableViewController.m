//
//  CustomTableViewController.m
//  HW4_18.36
//
//  Created by admin on 16.11.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "CustomTableViewController.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        self.title = @"UITableView";
        
        items = @{
                  @"1. Програмный метод": @[
                          @"Текст1", @"Текст2", @"Текст3", @"Текст4", @"Текст5"
                          ],
                  @"2. По идее это должен быть интерфейс билдер": @[
                          @"Другой текст 1", @"Другой текст 2", @"Другой текст 3"
                          ]
                  };
        
        // Заголовки секций, сортировка всех ключей словаря
        sections = [[items allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // колличество секций
//    return 2;
    return items.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // колличество строк в секции
    return [items[sections[section]] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // содержание
    return sections[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ReusableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSArray *elements = items[sections[indexPath.section]];
    NSString *item = elements[indexPath.row];
  
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = item;
    
    return cell;
}

@end
