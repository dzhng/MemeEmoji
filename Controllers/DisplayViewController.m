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
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        confirmView = [[UIImageView alloc] initWithFrame:CGRectMake(234, 5, 300, 100)];
    } else {
        confirmView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 300, 100)];
    }
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
    [self.collectionView reloadData];
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
        NSMutableDictionary* meme = [_models objectAtIndex:row];
        [cell setMeme:meme];
        
        // layer favorite icon on top of the cell
        UIButton* favButton = cell.favoriteButton;
        
        UIImage* iconImage = nil;
        UIImage* selectedImage = nil;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            iconImage = [UIImage imageNamed:@"favorite_icon_pad.png"];
            selectedImage = [UIImage imageNamed:@"favorite_icon_selected_pad.png"];
            favButton.frame = CGRectMake(2, 0, 52, 52);
        } else {
            iconImage = [UIImage imageNamed:@"favorite_icon.png"];
            selectedImage = [UIImage imageNamed:@"favorite_icon_selected.png"];
            favButton.frame = CGRectMake(2, 0, 26, 26);
        }
        [favButton setImage:iconImage forState:UIControlStateNormal];
        [favButton setImage:selectedImage forState:UIControlStateSelected];
    
        // set button action
        [favButton addTarget:cell action:@selector(favoritePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // check if fav button is in favorites list
        if (meme[@"favorite"] && [meme[@"favorite"] boolValue] == YES) {
            [favButton setSelected:YES];
        } else {
            [favButton setSelected:NO];
        }
        
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
        
        NSString* imageName = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:meme[@"file"]];
        UIImage* sourceImage = [UIImage imageWithContentsOfFile:imageName];
        
        // we need to add a border on top and bottom of the image, so the entire meme can be displayed correctly in imessages
        CGSize size = [sourceImage size];
        NSInteger borderTop = 40;
        NSInteger borderBottom = 100;
        NSInteger borderRight = 0.2*size.width;
        NSInteger borderLeft = 0.02*size.width;
        CGSize actualSize = CGSizeMake(size.width + borderLeft + borderRight, size.height + borderTop + borderBottom);
        
        UIGraphicsBeginImageContext(actualSize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // set color
        if (meme[@"background"] && [meme[@"background"] isEqualToString:@"black"]) {
            CGContextSetRGBFillColor(context, 0, 0, 0, 1.0);
        } else {
            CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
        }
        
        // draw image with background
        CGRect backgroundRect = CGRectMake(0, 0, actualSize.width, actualSize.height);
        CGContextFillRect(context, backgroundRect);
        
        CGRect imageRect = CGRectMake(borderLeft, borderTop, size.width, size.height);
        [sourceImage drawInRect:imageRect blendMode:kCGBlendModeNormal alpha:1.0];
        
        UIImage *finalImage =  UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        NSData* imData = UIImagePNGRepresentation(finalImage);
        
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
