//
//  DisplayViewController.h
//  MemeEmoji
//
//  Created by David Zhang on 10/23/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemeCell.h"

@interface DisplayViewController : UICollectionViewController
{
    // view to show confirm image
    UIImageView* confirmView;
}

// model array
@property(retain, nonatomic) NSArray* models;

- (void)refresh;

@end
