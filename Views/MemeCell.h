//
//  MemeCell.h
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemeModel.h"

@interface MemeCell : UICollectionViewCell
{
    // meme model object
    NSMutableDictionary* meme;
}

@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;

- (void)setMeme:(NSMutableDictionary*)meme;
- (void)favoritePressed:(id)sender;

@end
