//
//  Currencys.h
//  HomeWork2_1
//
//  Created by Viktoria on 19.01.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currencys : NSObject

@property (nonatomic,strong) NSString *ccy;
@property (nonatomic,strong) NSString *base_ccy;
@property (nonatomic,strong) NSString *sale;
@property (nonatomic,strong) NSString *buy;

-(void) saveToUserDefaults;
@end
