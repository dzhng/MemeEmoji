//
//  MemeCell.h
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
