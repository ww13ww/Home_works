//
//  ViewController.m
//  2048_iphone
//
//  Created by admin on 06.04.15.
//  Copyright (c) 2015 Vika Vovk. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"

//#import "F3HNumberTileGameViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (IBAction)playGameButtonTapped:(id)sender {
    /*
    F3HNumberTileGameViewController *c = [F3HNumberTileGameViewController numberTileGameWithDimension:4
                                                                                         winThreshold:2048
                                                                                      backgroundColor:[UIColor whiteColor]
                                                                                          scoreModule:YES
                                                                                       buttonControls:NO
                                                                                        swipeControls:YES];
    [self presentViewController:c animated:YES completion:nil];
     */
    
    
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    NSString * className = NSStringFromClass( [CollectionViewController class]);
    CollectionViewController * collectionController = [s instantiateViewControllerWithIdentifier:className];
    
    //[collectionController setDeviceName:device];
    
    [self presentViewController:collectionController animated:YES completion:nil];
}

@end
