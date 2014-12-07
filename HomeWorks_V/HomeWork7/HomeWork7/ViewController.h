//
//  ViewController.h
//  HomeWork7
//
//  Created by admin on 06.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
// tap
- (IBAction)tapButton:(UIButton *)sender;
// 1-2
- (IBAction)tapFirstSecond:(UISegmentedControl *)sender;

//// imputText
////=====???======

// sound scroll
- (IBAction)onSliderChanged:(UISlider *)sender;

// switch
- (IBAction)showSwitch:(UISwitch *)sender;

// start indicator
- (IBAction)showProgress:(UIButton *)sender;

// stepper
- (IBAction)stepperChanged:(UIStepper *)sender;

//// icon
- (IBAction)onImageButtonTapped:(UIButton *)sender;

@end
