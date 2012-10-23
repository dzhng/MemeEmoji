//
//  DisplayViewController.m
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

// confirmation timer callback
- (void)confirmTimerDone:(NSTimer*)timer;

@end

@implementation DisplayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.allowsMultipleSelection = false;
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"view_bg.png"]];
    
    // make confirmation view
    confirmView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 300, 100)];
    UIImage* confirmImage = [UIImage imageNamed:@"select_confirm.png"];
    confirmView.image = confirmImage;
    confirmView.alpha = 0;
    [self.view addSubview:confirmView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"collection view received memory warning");
}

- (void)refresh
{
    [self.collectionView setNeedsDisplay];
}

#pragma mark Collection View Data Source functions

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    // add extra one for new roadtrip picture
    return [_models count];
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
    if(row < [_models count]) {
        // set view settings
        NSDictionary* meme = [_models objectAtIndex:row];
        
        cell.image.image = [UIImage imageNamed:meme[@"file"]];
        cell.title.text = meme[@"title"];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell_bg_phone.png"]];
        
        // layer favorite icon on top of the cell
        UIButton* favButton = [[UIButton alloc] init];
        UIImage* iconImage = [UIImage imageNamed:@"favorite_icon.png"];
        UIImage* selectedImage = [UIImage imageNamed:@"favorite_icon_selected.png"];
        [favButton setImage:iconImage forState:UIControlStateNormal];
        [favButton setImage:selectedImage forState:UIControlStateSelected];
        favButton.frame = CGRectMake(2, 2, 26, 26);
        
        [cell.contentView addSubview:favButton];
    }
    
    return cell;
}

#pragma mark Collection View Delegate functions

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    // run sanity check first
    if(row < [_models count]) {
        // get the meme selected
        NSDictionary* meme = [_models objectAtIndex:row];
        // copy meme to clipboard
        UIPasteboard* pb = [UIPasteboard generalPasteboard];
        
        NSString *imageName = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:meme[@"file"]];
        NSData* imData = [NSData dataWithContentsOfFile:imageName];
        
        [pb setData:imData forPasteboardType:@"public.png"];
        NSLog(@"%@ copied", meme[@"title"]);
        
        // show copy confirm image
        confirmView.alpha = 1;
        
        // set off timer
        [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(confirmTimerDone:) userInfo:nil repeats:NO];
    }
}

- (void)confirmTimerDone:(NSTimer*)timer
{
    // remove confirm view
    [UIView animateWithDuration:0.4
                     animations:^{confirmView.alpha = 0.0;}
                     completion:^(BOOL finished){
                     }];
}

@end
