//
//  Task.h
//  HomeWork9_CoreData
//
//  Created by admin on 26.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * finished;

@end
