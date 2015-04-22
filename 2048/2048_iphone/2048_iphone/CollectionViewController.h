//
//  CollectionViewController.h
//  2048_iphone
//
//  Created by admin on 06.04.15.
//  Copyright (c) 2015 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController

@property (strong, nonatomic) IBOutlet UILabel *swipeInfo;

//-(void) allCells;
/*
+ (instancetype)numberTileGameWithDimension:(NSUInteger)dimension
                               winThreshold:(NSUInteger)threshold
                            backgroundColor:(UIColor *)backgroundColor
                                scoreModule:(BOOL)scoreModuleEnabled
                             buttonControls:(BOOL)buttonControlsEnabled
                              swipeControls:(BOOL)swipeControlsEnabled;
*/
@end