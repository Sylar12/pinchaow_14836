//
//  Tile.m
//  2048Tutorial
//
//  Created by Benjamin Encz on 07/04/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "Tile.h"

@implementation Tile {
  CCLabelTTF *_valueLabel;
  CCNodeColor *_backgroundNode;
}


- (id)init {
  self = [super init];

  if (self) {
    self.value = (arc4random()%2)+1;
  }

  return self;
}


- (void)didLoadFromCCB {
  [self updateValueDisplay];
}

- (void)updateValueDisplay {
  _valueLabel.string = [NSString stringWithFormat:@"%d", self.value];

  CCColor *backgroundColor = nil;
    
  switch (self.value) {
      case 0:
          backgroundColor = [CCColor whiteColor];
          break;
    case 1:
          backgroundColor = [CCColor colorWithRed:255.f/255.f green:0.f/255.f blue:0.f/255.f];
          break;
      case 2:
          backgroundColor = [CCColor colorWithRed:255.f/255.f green:165.f/255.f blue:0.f/255.f];
          break;
  case 3:
          backgroundColor = [CCColor colorWithRed:255.f/255.f green:255.f/255.f blue:0.f/255.f];
    break;
  case 6:
    backgroundColor = [CCColor colorWithRed:0.f/255.f green:255.f/255.f blue:0.f/255.f];
    break;
  case 12:
    backgroundColor = [CCColor colorWithRed:0.f/255.f green:127.f/255.f blue:255.f/255.f];
    break;
  case 24:
    backgroundColor = [CCColor colorWithRed:0.f/255.f green:0.f/255.f blue:255.f/255.f];
    break;
  case 48:
    backgroundColor = [CCColor colorWithRed:139.f/255.f green:0.f/255.f blue:255.f/255.f];
    break;
  case 96:
    backgroundColor = [CCColor colorWithRed:0.f/255.f green:0.f/255.f blue:0.f/255.f];
    break;
//  default:
 //   backgroundColor = [CCColor greenColor];
  //  break;
  }

  _backgroundNode.color = backgroundColor;
}

@end
