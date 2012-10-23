//
//  MemeModel.h
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemeModel : NSObject

// array containing dictionary of memes
@property(retain, nonatomic) NSArray* memes;

// get singleton instance
+ (MemeModel*)meme;

// initialize instance
- (id)init;

@end
