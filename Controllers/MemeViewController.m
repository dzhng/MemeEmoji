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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Collection View Data Source functions

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    // add extra one for new roadtrip picture
    return [[[MemeModel model] memes] count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (MemeCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MemeCell";
    
    MemeCell *cell = [cv dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if(cell == nil) {
        NSLog(@"Error: Cannot dequeue collection view cell");
    }
    NSInteger row = [indexPath row];
    
    // run sanity checks
    if(row < [[[MemeModel model] memes] count]) {
        // set view settings
        NSDictionary* meme = [[[MemeModel model] memes] objectAtIndex:row];
        cell.image.image = [UIImage imageNamed:meme[@"file"]];
        cell.title.text = meme[@"title"];
    }
    
    return cell;
}

#pragma mark Collection View Delegate functions

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    // run sanity check first
    if(row < [[[MemeModel model] memes] count]) {
        // get roadtrip
        //RoadtripModel* roadtrip = [[[AppModel model] roadtrips] objectAtIndex:row];
        // set current roadtrip
        //[[AppModel model] setCurrentRoadtrip:roadtrip];
    }
}

#pragma mark Collection View Flow Layout functions

/*- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGSizeMake(500, 400);
    } else {
        return CGSizeMake(300, 264);
    }
}*/

@end
