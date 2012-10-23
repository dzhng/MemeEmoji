//
//  MemeModel.m
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import "MemeModel.h"

@implementation MemeModel

static MemeModel* model = nil;

+ (MemeModel*)model
{
    if (model == nil) {
        model = [[super alloc] init];
    }
    return model;
}

- (id)init
{
    self = [super init];
    if (self) {
        // initialize memes
        self.memes = [NSArray arrayWithObjects:
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"Actually it's not ok"},
                      @{@"file": @"actually_pretty_badass.png", @"title": @"Actually pretty badass", @"text": @""},
                      @{@"file": @"all_the_things.png", @"title": @"All the things", @"text": @""},
                      @{@"file": @"are_you_fucking_kidding_me.png", @"title": @"Are you kidding me", @"text": @"Are you fucking kidding me?"},
                      @{@"file": @"are_you_serious.png", @"title": @"Are you serious", @"text": @"Are you serious?"},
                      @{@"file": @"awww_yyyeeeaaa.png", @"title": @"Awwww yeaaaa", @"text": @"Awwwwwwww yyyyyyeeeeeeaaaaaaa"},
                      @{@"file": @"badass_over_here.png", @"title": @"Badass over here", @"text": @"Watch out, we got a badass over here"},
                      @{@"file": @"bitch_please.png", @"title": @"Bitch please", @"text": @"Bitch please"},
                      @{@"file": @"challenge_accepted.png", @"title": @"Challenge accepted", @"text": @""},
                      @{@"file": @"challenge_considered.png", @"title": @"Challenge considered", @"text": @""},
                      @{@"file": @"challenge_denied.png", @"title": @"Challenge denied", @"text": @""},
                      @{@"file": @"challenge_failed.png", @"title": @"Challenge failed", @"text": @"challenge failed"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok", @"text": @"actually it's not ok"},
                      nil];
    }
    return self;
}

@end
