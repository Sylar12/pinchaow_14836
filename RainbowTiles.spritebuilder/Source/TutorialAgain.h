//
//  TutorialAgain.h
//  RainbowTiles
//
//  Created by PinchaoWang on 15/5/1.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

#import "CCNode.h"

extern BOOL *firstTime;
extern BOOL *secondTime;

@interface TutorialAgain : CCNode
- (void)removeFromParentAndCleanup:(BOOL)cleanup;

@end
