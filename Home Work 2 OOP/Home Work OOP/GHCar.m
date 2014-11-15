//
//  GHCar.m
//  Home Work OOP
//
//  Created by Sergey Zalozniy on 10/31/14.
//  Copyright (c) 2014 Sergey Zalozniy. All rights reserved.
//

#include "GHCar.h"

@implementation GHCar

-(GHCar *) initWithEngineCapacity:(float)capacity andHorsePower:(int)horsePower
    {
        
    GHEngine *engine = [[ GHEngine alloc ] init];
    [ engine setCapacity: capacity ];
    [ engine setHorsePower:horsePower ];

    GHCar *car0 = [[ GHCar alloc ] init];
    [car0 setEngine: engine];
    return car0;
        
    }

-(void) printCarIformation
    {

    NSLog(@"%@: ( %.1f ), - %i h/p, max. speed - %.0f", self.mark, self.engine.capacity, self.engine.horsePower, self.topSpeed);
    
    }

-(Boolean)isFasterThanCar:(GHCar *)carToCompare
    {

    return self.topSpeed > carToCompare.topSpeed;
    
    }

@end
