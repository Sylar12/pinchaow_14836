//
//  Tutorial.m
//  RainbowTiles
//
//  Created by PinchaoWang on 15/5/1.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

#import "Tutorial.h"


@implementation Tutorial

- (void) skip {
    [self removeFromParentAndCleanup:YES];
    secondTime = true;
}

@end
