//
//  HelpViewController.m
//  MemeEmoji
//
//  Created by David Zhang on 10/23/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray* viewArray = [[NSBundle mainBundle] loadNibNamed:@"HelpViewPhone" owner:self options:nil];
    scrollView = [viewArray objectAtIndex:0];
    scrollView.contentSize = scrollView.frame.size;
    scrollView.frame = self.view.frame;
    [self.view addSubview:scrollView];
    
    // wire up feedback button
    UIButton* feedbackButton = (UIButton*)[scrollView viewWithTag:10];
    [feedbackButton addTarget:self action:@selector(feedbackPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)feedbackPressed:(id)sender {
    // start mail app
    NSURL* url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"mailto:?to=%@&subject=%@",
                                                @"founders@tigervine.com",
                                                [@"Meme Emoji Feedback" stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
    [[UIApplication sharedApplication] openURL:url];
}

@end
