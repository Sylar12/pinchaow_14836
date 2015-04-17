//
//  Cover.m
//  2048Tutorial
//
//  Created by PinchaoWang on 15/4/17.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

#import "Cover.h"

@implementation Cover


- playMusic {
    // access audio object
    OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
    // play sound effect
    [audio playEffect:@"a todo color.mp3"];
}

- (void)newGame {
    [self playMusic];
    
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:mainScene];
}




@end
