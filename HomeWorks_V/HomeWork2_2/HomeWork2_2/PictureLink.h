//
//  PictureLink.h
//  HomeWork2_2
//
//  Created by Viktoria on 11.02.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PictureLink : NSManagedObject

@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * published;

@end
