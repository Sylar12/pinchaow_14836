//
//  GameEndWin.h
//  2048Tutorial
//
//  Created by PinchaoWang on 15/4/28.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface GameEndWin : CCNode

- (void)setMessage:(NSString *)message score:(NSInteger)score;
-(void) removeFromParentAndCleanup:(BOOL)cleanup;

@end
