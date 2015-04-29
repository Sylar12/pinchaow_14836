//
//  Grid.h
//  RainbowTiles
//
//  Created by PinchaoWang on 15/4/28.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

#import "CCNodeColor.h"

@interface Grid : CCNodeColor

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, assign) NSInteger tileValue;

@property (nonatomic, assign) NSInteger imerge;

@property (nonatomic, assign) NSInteger eraserNum;

@property (nonatomic, assign) NSInteger tilesNum;

@property (nonatomic, assign) BOOL continueTemp;


- (void)updateValueDisplay;
@end
