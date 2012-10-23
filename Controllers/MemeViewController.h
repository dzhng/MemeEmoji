//
//  MemeViewController.h
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemeModel.h"
#import "MemeCell.h"

@interface MemeViewController : UICollectionViewController
{
    // view to show confirm image
    UIImageView* confirmView;
}

@end
