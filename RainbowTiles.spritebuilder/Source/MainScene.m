

#import "MainScene.h"
#import "Grid.h"
#import "Cover.h"
#import "Tutorial.h"
#import "TutorialAgain.h"



@implementation MainScene {
    Grid *_grid;
    CCLabelTTF *_scoreLabel;
    CCLabelTTF *_highscoreLabel;
    
    CCLabelTTF *_valueLabelNext;
    CCNodeColor *_backgroundNodeNext;
    
    Cover *_cover;
    CCNode *_tutorial;
    CCNode *_tutorialAgain;

}


- (void)dealloc {
    [_grid removeObserver:self forKeyPath:@"score"];
}

- (void)didLoadFromCCB {
    [self updateValueDisplay];
    
    [_grid addObserver:self forKeyPath:@"score" options:0 context:NULL];
    
    /*
    [[NSUserDefaults standardUserDefaults]addObserver:self
                                           forKeyPath:@"highscore"
                                              options:0
                                              context:NULL];
     */
    
    // load highscore
    [self updateHighscore];
    
    //add step to update nextTile status
    [self schedule:@selector(step) interval:0.5f];
    
    self.level = 2;
    highScoreUpdate = false;
    
    
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
    
}

- (void)newGame {
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:mainScene];
    }


- (void)updateValueDisplay {
    
    CCColor *backgroundColor = nil;
    
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


//used to update status of the nextTile in time
- (void)step
{
    //detect tiles status and update needTile status immediately
    [self updateValueDisplay];
    
    //detect high score, if a new score happen, update board status immediately
    if (highScoreUpdate == true) {
        [self updateHighscore];
        highScoreUpdate = false;
    }
    
    //
    if (firstTime == true) {
        [self loadToturial];
        firstTime = false;
    }
    
    if (secondTime == true) {
        [self loadToturialAgain];
        secondTime = false;
    }
    
    
}

- (void)main {
    CCScene *cover = [CCBReader loadAsScene:@"Cover"];
    [[CCDirector sharedDirector]replaceScene:cover];
}


- (void)reset {
    NSNumber *highScore;
    NSInteger new = 0;
    highScore = [NSNumber numberWithInt:new];
    
    [[NSUserDefaults standardUserDefaults]setObject:highScore forKey:@"highscore"];
    
    [self updateHighscore];
    
}

- (void) loadToturial {
    Tutorial *gameEndPopover = (Tutorial *)[CCBReader load:@"Tutorial"];
    gameEndPopover.positionType = CCPositionTypeNormalized;
    gameEndPopover.position = ccp(0.5, 0.5);
    gameEndPopover.zOrder = INT_MAX;
    
    [self addChild:gameEndPopover];
}

- (void) loadToturialAgain {
    TutorialAgain *gameEndPopover = (TutorialAgain *)[CCBReader load:@"TutorialAgain"];
    gameEndPopover.positionType = CCPositionTypeNormalized;
    gameEndPopover.position = ccp(0.5, 0.5);
    gameEndPopover.zOrder = INT_MAX;
    
    [self addChild:gameEndPopover];
}



@end
