//
//  DisplayViewController.h
//  MemeEmoji
//
//  Created by David Zhang on 10/23/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemeModel.h"
#import "MemeCell.h"

@interface DisplayViewController : UICollectionViewController
{
    // view to show confirm image
    UIImageView* confirmView;
    
    // compose button view
    UIButton* composeButton;
}

// model array
@property(retain, nonatomic) NSArray* models;

- (void)composePressed:(id)sender;

- (void)refresh;

@end
