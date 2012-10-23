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
    
    self.collectionView.allowsMultipleSelection = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"collection view received memory warning");
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
        
        //NSString *imageName = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:meme[@"file"]];
        cell.image.image = [UIImage imageNamed:meme[@"file"]];
        cell.title.text = meme[@"title"];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell_bg_phone.png"]];
    }
    
    return cell;
}

#pragma mark Collection View Delegate functions

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    // run sanity check first
    if(row < [[[MemeModel model] memes] count]) {
        // get the meme selected
        NSDictionary* meme = [[[MemeModel model] memes] objectAtIndex:row];
        // copy meme to clipboard
        UIPasteboard* pb = [UIPasteboard generalPasteboard];
        
        NSString *imageName = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:meme[@"file"]];
        NSData* imData = [NSData dataWithContentsOfFile:imageName];
        
        [pb setData:imData forPasteboardType:@"public.png"];
        NSLog(@"%@ copied", meme[@"title"]);
    }
}

@end
