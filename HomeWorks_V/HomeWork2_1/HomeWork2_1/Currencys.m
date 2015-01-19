//
//  Currencys.m
//  HomeWork2_1
//
//  Created by Viktoria on 19.01.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//

#import "Currencys.h"

@implementation Currencys


-(void) saveToUserDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    // 57.38
    info [@"ccy"] = self.ccy;
    info [@"base_ccy"] = self.base_ccy;
    info [@"sale"] = self.sale;
    info [@"buy"] = self.buy;
    
    [defaults setObject:info forKey:self.ccy];
    [defaults synchronize];
}
@end
