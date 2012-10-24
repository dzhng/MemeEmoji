//
//  MemeViewController.m
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import "MemeViewController.h"

@interface MemeViewController ()

@end

@implementation MemeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.models = [[MemeModel model] memes];
    [[MemeModel model] setMemeController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"collection view received memory warning");
}

@end
