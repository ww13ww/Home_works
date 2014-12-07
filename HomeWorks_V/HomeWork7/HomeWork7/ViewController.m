//
//  ViewController.m
//  HomeWork7
//
//  Created by admin on 06.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// tap
@property (weak, nonatomic) IBOutlet UIButton *tapButton;
@property (weak, nonatomic) IBOutlet UILabel *tapButtonText;

// 1-2
@property (weak, nonatomic) IBOutlet UISegmentedControl *tapFirstSecond;
@property (weak, nonatomic) IBOutlet UILabel *tapFirstSecondText;

// imputText
@property (weak, nonatomic) IBOutlet UITextField *imputTextPlace;
@property (weak, nonatomic) IBOutlet UILabel *textPlace;

// sound scroll
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderText;

// switch
@property (weak, nonatomic) IBOutlet UISwitch *switchG;

// start indicator
@property (weak, nonatomic) IBOutlet UIButton *tapStartIndicator;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

// stepper
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *stepNumber;

// icon
@property (weak, nonatomic) IBOutlet UIButton *tapIcon;
@property (weak, nonatomic) IBOutlet UIImageView *viewImage;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//1// tap
- (IBAction)tapButton:(UIButton *)sender {
    _tapButtonText.text = @"Button pressed";
}
//2// 1-2
- (IBAction)tapFirstSecond:(UISegmentedControl *)sender {
    _tapFirstSecondText.text = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
}
//3// imputText
- (BOOL)imputTextPlace:(UITextField *)textField {
    _textPlace.text = textField.text;
    return YES;
}
//4// sound scroll
- (IBAction)onSliderChanged:(UISlider *)sender {
    _sliderText.text = [NSString stringWithFormat:@"%d%%", (int) (sender.value * 100)];
}
//5// switch
- (IBAction)showSwitch:(UISwitch *)sender {
    UIAlertView *switchView = [[UIAlertView alloc]
                              initWithTitle:@"Switch"
                              message:[NSString stringWithFormat: sender.isOn ? @"ON" : @"OFF"]
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [switchView show];
}
//6// start indicator
- (IBAction)showProgress:(UIButton *)sender {
    if ([_indicator isAnimating]) {
        [_indicator stopAnimating];
    }
    else {
        [_indicator startAnimating];
    }
}
//7// stepper
- (IBAction)stepperChanged:(UIStepper *)sender {
    _stepNumber.text = [NSString stringWithFormat:@"%d", (int) sender.value];
}
//8// icon
- (IBAction)onImageButtonTapped:(UIButton *)sender {
    _viewImage.image = [UIImage imageNamed:@"images.jpeg"];
}

@end
