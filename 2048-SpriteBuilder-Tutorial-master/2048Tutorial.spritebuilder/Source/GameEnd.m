//
//  GameEnd.m
//  2048Tutorial
//
//  Created by Benjamin Encz on 12/04/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "GameEnd.h"
#import "Cover.h"
#import "Grid.h"


@implementation GameEnd {
  CCLabelTTF *_messageLabel;
  CCLabelTTF *_scoreLabel;
    Cover *_cover;
    Grid *_grid;
}

- (void)newGame {
  CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
  [[CCDirector sharedDirector]replaceScene:mainScene];
}



- (void)setMessage:(NSString *)message score:(NSInteger)score {
  _messageLabel.string = message;
  _scoreLabel.string = [NSString stringWithFormat:@"%d", score];
}


-(void) shareToFacebook {
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    
    // this should link to FB page for your app or AppStore link if published
    content.contentURL = [NSURL URLWithString:@"https://www.facebook.com/makeschool"];
    // URL of image to be displayed alongside post
    content.imageURL = [NSURL URLWithString:@"https://git.makeschool.com/MakeSchool-Tutorials/News/f744d331484d043a373ee2a33d63626c352255d4//663032db-cf16-441b-9103-c518947c70e1/cover_photo.jpeg"];
    // title of post
    content.contentTitle = [NSString stringWithFormat:@"My Rainbow Tiles Score is %@!", _scoreLabel.string];
    // description/body of post
    content.contentDescription = @"Check out Rainbow Tiles to get your own.";
    
    [FBSDKShareDialog showFromViewController:[CCDirector sharedDirector]
                                 withContent:content
                                    delegate:nil];
}

@end
