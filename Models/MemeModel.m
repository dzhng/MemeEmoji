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
            @{@"file": @"actually_its_not_ok.png", @"title": @"Actually it's not ok"},
            @{@"file": @"actually_pretty_badass.png", @"title": @"Actually pretty badass"},
            @{@"file": @"all_the_things.png", @"title": @"All the things"},
            @{@"file": @"are_you_fucking_kidding_me.png", @"title": @"Are you kidding me"},
            @{@"file": @"are_you_serious.png", @"title": @"Are you serious"},
            @{@"file": @"awww_yyyeeeaaa.png", @"title": @"Awwww yeaaaa"},
            @{@"file": @"badass_over_here.png", @"title": @"Badass over here"},
            @{@"file": @"bitch_please.png", @"title": @"Bitch please"},
            @{@"file": @"challenge_accepted.png", @"title": @"Challenge accepted"},
            @{@"file": @"challenge_considered.png", @"title": @"Challenge considered"},
            @{@"file": @"challenge_denied.png", @"title": @"Challenge denied"},
            @{@"file": @"challenge_failed.png", @"title": @"Challenge failed"},
            @{@"file": @"computer_stare.png", @"title": @"Blank stare"},
            @{@"file": @"crying.png", @"title": @"Crying"},
            @{@"file": @"dude_come_on.png", @"title": @"Dude, come on"},
            @{@"file": @"epic_win.png", @"title": @"Epic win"},
            @{@"file": @"facepalm.png", @"title": @"Facepalm"},
            @{@"file": @"fapfap.png", @"title": @"Fap fap fap"},
            @{@"file": @"fffuuuuu.png", @"title": @"FFFFFFFUUUUUUUUUU"},
            @{@"file": @"forever_alone.png", @"title": @"Forever alone"},
            @{@"file": @"fuck_yea.png", @"title": @"Fuck yea"},
            @{@"file": @"fucking_done.png", @"title": @"Fucking done"},
            @{@"file": @"gasp.png", @"title": @"WTF"},
            @{@"file": @"good_job.png", @"title": @"Good job"},
            @{@"file": @"gtfo.png", @"title": @"GTFO"},
            @{@"file": @"happy.png", @"title": @"Happy"},
            @{@"file": @"haters_gonna_hate.png", @"title": @"Haters gonna hate"},
            @{@"file": @"herp_derp.png", @"title": @"Herp derp"},
            @{@"file": @"i_lied.png", @"title": @"Gotcha bitch"},
            @{@"file": @"i_see_what_you_did_there.png", @"title": @"I see what you did there"},
            @{@"file": @"im_watching_u.png", @"title": @"I'm watching you"},
            @{@"file": @"indeed.png", @"title": @"Indeed"},
            @{@"file": @"little_kid.png", @"title": @"I'm innocent"},
            @{@"file": @"lol.png", @"title": @"LOL"},
            @{@"file": @"me_gusta.png", @"title": @"Me gusta"},
            @{@"file": @"mission_accomlished.png", @"title": @"Mission accomplished"},
            @{@"file": @"mother_of_gof.png", @"title": @"Mother of god"},
            @{@"file": @"no.png", @"title": @"NO"},
            @{@"file": @"not_bad.png", @"title": @"Not bad"},
            @{@"file": @"nothing_to_do_here.png", @"title": @"Nothing to do here"},
            @{@"file": @"now_kiss.png", @"title": @"Now kiss"},
            @{@"file": @"oh_god_why.png", @"title": @"Oh god, why"},
            @{@"file": @"oh_shop_it_you.png", @"title": @"Oh stop it, you"},
            @{@"file": @"okay.png", @"title": @"Okay"},
            @{@"file": @"pff.png", @"title": @"PFFF"},
            @{@"file": @"pfffftttchch.png", @"title": @"PFFFTTTCHHCHHCHHH"},
            @{@"file": @"poker_face.png", @"title": @"Poker face"},
            @{@"file": @"sad_forever.png", @"title": @"Sad forever"},
            @{@"file": @"sad.png", @"title": @"Sad troll"},
            @{@"file": @"smile.png", @"title": @"Happy smile"},
            @{@"file": @"suprised_cat.png", @"title": @"Suprised cat"},
            @{@"file": @"sweet_jesus_have_mercy.png", @"title": @"Sweet jesus have mercy"},
            @{@"file": @"troll.png", @"title": @"Troll face"},
            @{@"file": @"true_story.png", @"title": @"True story"},
            @{@"file": @"wait.png", @"title": @"Wait"},
            @{@"file": @"what_have_you_done.png", @"title": @"What have you done"},
            @{@"file": @"what.png", @"title": @"WHAT"},
            @{@"file": @"whats_all_this_racket.png", @"title": @"What's all this racket"},
            @{@"file": @"why.png", @"title": @"But why"},
            @{@"file": @"whyyy.png", @"title": @"Whyyyyyy"},
            @{@"file": @"y_u_no.png", @"title": @"Y U NO"},
            @{@"file": @"yes.png", @"title": @"YES"},
            @{@"file": @"you_didnt_say.png", @"title": @"You didn't say"},
            nil];
    }
    return self;
}

@end
