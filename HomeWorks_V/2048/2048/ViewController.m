//
//  ViewController.m
//  2048
//
//  Created by Viktoria on 22.03.15.
//  Copyright (c) 2015 Viktoriia. All rights reserved.
//
#import <SpriteKit/SpriteKit.h>
#import "ViewController.h"
#import "MyScene.h"
#import "FirstScene.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SKView * skView = (SKView *)self.view;
    skView.backgroundColor = [UIColor greenColor];
    FirstScene *menuScene = [FirstScene sceneWithSize:skView.frame.size ];
    
    [skView presentScene:menuScene];
    
/*    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];*/
}

- (BOOL)shouldAutorotate {
    return YES;
}

-(BOOL)prefersStatusBarHidden {
    return  YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
