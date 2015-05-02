//
//  Cover.m
//  RainbowTiles
//
//  Created by PinchaoWang on 15/4/28.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

#import "Cover.h"

@implementation Cover


- (void)normal {
    
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:mainScene];
    eraserNum = 1;
}

- (void)hard {
    
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:mainScene];
    eraserNum = 2;

}

- (void)crazy {
    
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector]replaceScene:mainScene];
    eraserNum = 3;

}

-(void) share {
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    
    // this should link to FB page for your app or AppStore link if published
    content.contentURL = [NSURL URLWithString:@"https://www.facebook.com/makeschool"];
    // URL of image to be displayed alongside post
    content.imageURL = [NSURL URLWithString:@"https://git.makeschool.com/MakeSchool-Tutorials/News/f744d331484d043a373ee2a33d63626c352255d4//663032db-cf16-441b-9103-c518947c70e1/cover_photo.jpeg"];
    // title of post
    
    NSNumber *HighScore = [[NSUserDefaults standardUserDefaults]objectForKey:@"highscore"];
    
    NSString *str = [NSString stringWithFormat:@"%d", [HighScore intValue]];
    
    content.contentTitle = [NSString stringWithFormat:@"My Rainbow Tiles Score is %@!", str];
    // description/body of post
    content.contentDescription = @"Check out Rainbow Tiles to get your own.";
    
    [FBSDKShareDialog showFromViewController:[CCDirector sharedDirector]
                                 withContent:content
                                    delegate:nil];
}




@end

