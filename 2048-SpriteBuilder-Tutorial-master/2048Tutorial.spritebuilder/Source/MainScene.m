//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Benjamin Encz on 10/10/13.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
  Grid *_grid;
  CCLabelTTF *_scoreLabel;
  CCLabelTTF *_highscoreLabel;
    
    CCLabelTTF *_valueLabelNext;
    CCNodeColor *_backgroundNodeNext;
    
    int temp;
}


- (void)dealloc {
  [_grid removeObserver:self forKeyPath:@"score"];
}

- (void)didLoadFromCCB {
  [_grid addObserver:self forKeyPath:@"score" options:0 context:NULL];

  [[NSUserDefaults standardUserDefaults]addObserver:self
  forKeyPath:@"highscore"
  options:0
  context:NULL];

  // load highscore
  [self updateHighscore];
}

- (void)updateHighscore {
  NSNumber *newHighscore = [[NSUserDefaults standardUserDefaults]objectForKey:@"highscore"];

  if (newHighscore) {
    _highscoreLabel.string = [NSString stringWithFormat:@"%d", [newHighscore intValue]];
  }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
  ofObject:(id)object
  change:(NSDictionary *)change
  context:(void *)context {

  if ([keyPath isEqualToString:@"score"]) {
    _scoreLabel.string = [NSString stringWithFormat:@"%d", _grid.score];
      
  } else if ([keyPath isEqualToString:@"highscore"]) {
    [self updateHighscore];
  }
    [self updateValueDisplay];

}

- (void)newGame {
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:mainScene];
}

- (void)updateValueDisplay {
    
    CCColor *backgroundColor = nil;
/*
    if (temp >= _grid.tileValue) {
        _grid.tileValue = temp;
    }
    else {
        temp = _grid.tileValue;
    }
 */
    _valueLabelNext.string = [NSString stringWithFormat:@"%d", _grid.tileValue];

    
    switch (_grid.tileValue) {
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
    
    _backgroundNodeNext.color = backgroundColor;
}

@end