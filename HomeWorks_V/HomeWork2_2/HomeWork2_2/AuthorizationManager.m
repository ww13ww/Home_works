//
//  AuthorizationManager.m
//  HomeWork2_2
//
//  Created by Viktoria on 06.02.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//
#import <Reachability/Reachability.h>
#import "AuthorizationManager.h"

static AuthorizationManager *manager = nil;


@interface AuthorizationManager ()

@property (nonatomic, strong) Reachability *rechability;
@property (nonatomic, assign, readwrite) BOOL isServerReachable;

@end


@implementation AuthorizationManager

+(instancetype) sharedManager {
    static dispatch_once_t onceToken;
    
//    NSLog(@"%li", onceToken);
    dispatch_once(&onceToken, ^{
        manager = [[AuthorizationManager alloc] init];
    });

    return manager;
}

-(instancetype) init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.rechability = [Reachability reachabilityWithHostName:@"www.flickr.com"];
    [self.rechability startNotifier];
    self.rechability.reachableBlock = ^void (Reachability * rechability) {
        // инет есть
    };

    self.rechability.unreachableBlock = ^void (Reachability * rechability) {
        // инета нет
    };
    
    
    
    NSAssert ( manager ==nil, @"Use sharedManager f-n please");
    
    return self;
}

-(BOOL) isServerReachable {
    return self.rechability.isReachable;
}

@end


