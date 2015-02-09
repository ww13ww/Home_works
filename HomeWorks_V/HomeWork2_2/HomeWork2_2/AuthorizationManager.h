//
//  AuthorizationManager.h
//  HomeWork2_2
//
//  Created by Viktoria on 06.02.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthorizationManager : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign, readonly) BOOL isServerReachable;

+(instancetype) sharedManager;



@end

