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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
