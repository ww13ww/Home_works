//
//  main.m
//  HomeWork1
//
//  Created by admin on 23.10.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <Foundation/Foundation.h>


enum Months
{
    January = 1
    ,   February
    ,   March
    ,   April
    ,   May
    ,   June
    ,   July
    ,   August
    ,   September
    ,   October
    ,   November
    ,   December
};


int main(int argc, char * argv[]) {
    @autoreleasepool {
        srand ( time ( NULL ) );
        int randomNumber = rand () % 2;
        if ( randomNumber == 1 )
        {
            NSLog ( @"%i: if-else", randomNumber );
            
            for ( int month = 1; month <= 12; month++ )
            {
                if ( month == 1 ) { NSLog ( @"January" ); }
                else if ( month == 2 ) { NSLog ( @"February" ); }
                else if ( month == 3 ) { NSLog ( @"March" ); }
                else if ( month == 4 ) { NSLog ( @"April" ); }
                else if ( month == 5 ) { NSLog ( @"May" ); }
                else if ( month == 6 ) { NSLog ( @"June" ); }
                else if ( month == 7 ) { NSLog ( @"July" ); }
                else if ( month == 8 ) { NSLog ( @"August" ); }
                else if ( month == 9 ) { NSLog ( @"September" ); }
                else if ( month == 10 ) { NSLog ( @"October" ); }
                else if ( month == 11 ) { NSLog ( @"November" ); }
                else if ( month == 12 ) { NSLog ( @"December" ); }
            }
        }
        else
        {
            NSLog ( @"%i: enum", randomNumber );
            
            for ( int month = January; month <= December; month++ )
            {
                switch ( month )
                {
                    case January: { NSLog ( @"January" ); break; }
                    case February: { NSLog ( @"Fabruary" ); break; }
                    case March: { NSLog ( @"March" ); break; }
                    case April: { NSLog ( @"April" ); break; }
                    case May: { NSLog ( @"May" ); break; }
                    case June: { NSLog ( @"June" ); break; }
                    case July: { NSLog ( @"July" ); break; }
                    case August: { NSLog ( @"August" ); break; }
                    case September: { NSLog ( @"September" ); break; }
                    case October: { NSLog ( @"October" ); break; }
                    case November: { NSLog ( @"November" ); break; }
                    case December: { NSLog ( @"December" ); break; }
                    default: { NSLog ( @"Unknown" ); break; }
                }
            }
            
    }
    }
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }

