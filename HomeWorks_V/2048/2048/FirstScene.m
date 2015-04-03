//
//  FirstScene.m
//  2048
//
//  Created by Viktoria on 02.04.15.
//  Copyright (c) 2015 Viktoriia. All rights reserved.
//

#import "FirstScene.h"

@interface FirstScene ()

@property (nonatomic, strong) SKSpriteNode *playButton;

@end


@implementation FirstScene

-(void) didMoveToView:(SKView *)view {
    self.playButton = [SKSpriteNode spriteNodeWithImageNamed:@"32"];
    [self addChild:self.playButton];
    self.playButton.position = self.view.center;


}
@end
