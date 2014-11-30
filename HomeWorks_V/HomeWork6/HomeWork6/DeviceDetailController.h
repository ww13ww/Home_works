//
//  DeviceDetailControllerViewController.h
//  HomeWork6
//
//  Created by admin on 30.11.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceDetailController : UIViewController
{

}

@property (weak, nonatomic) IBOutlet UILabel *label;

- (void) setDeviceName: (NSString *) string;
@end
