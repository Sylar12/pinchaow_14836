

#import "CCNode.h"

extern BOOL *highScoreUpdate;
extern BOOL *firstTime;
extern BOOL *secondTime;

@interface MainScene : CCNode
@property (nonatomic, assign) NSInteger level;

-(void) removeFromParentAndCleanup:(BOOL)cleanup;

@end
