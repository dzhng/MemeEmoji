//
//  MemeCell.m
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import "MemeCell.h"

@implementation MemeCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (selected) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell_bg_phone_selected.png"]];
    } else {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell_bg_phone.png"]];
    }
}

- (void)setMeme:(NSMutableDictionary *)newMeme
{
    meme = newMeme;
    self.image.image = [UIImage imageNamed:meme[@"file"]];
    self.title.text = meme[@"title"];
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell_bg_phone.png"]];
}

- (void)favoritePressed:(id)sender
{
    if (meme[@"favorite"] && [meme[@"favorite"] boolValue] == YES) {
        [[MemeModel model] removeItemFromFavorite:meme];
        [[[self.contentView subviews] lastObject] setSelected:NO];
    } else {
        [[MemeModel model] addItemToFavorite:meme];
        [[[self.contentView subviews] lastObject] setSelected:YES];
    }
}

@end
