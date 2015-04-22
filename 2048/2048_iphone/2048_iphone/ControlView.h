//
//  ControlView.h
//  2048_iphone
//
//  Created by admin on 13.04.15.
//  Copyright (c) 2015 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ControlViewProtocol

- (void)upButtonTapped;
- (void)downButtonTapped;
- (void)leftButtonTapped;
- (void)rightButtonTapped;
- (void)resetButtonTapped;
- (void)exitButtonTapped;

@end

@interface ControlView : UIView

+ (instancetype)controlViewWithCornerRadius:(CGFloat)radius
                            backgroundColor:(UIColor *)color
                            movementButtons:(BOOL)moveButtonsEnabled
                                 exitButton:(BOOL)exitButtonEnabled
                                   delegate:(id<ControlViewProtocol>)delegate;

@end
