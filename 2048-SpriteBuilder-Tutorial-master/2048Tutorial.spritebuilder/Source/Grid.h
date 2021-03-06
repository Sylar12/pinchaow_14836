//
//  Grid.h
//  2048Tutorial
//
//  Created by Benjamin Encz on 07/04/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
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
