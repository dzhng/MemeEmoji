//
//  FavoritesViewController.m
//  MemeEmoji
//
//  Created by David Zhang on 10/23/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.models = [[MemeModel model] favorites];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"collection view received memory warning");
}

@end
