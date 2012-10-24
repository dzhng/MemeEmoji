//
//  MemeModel.h
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FavoritesViewController;
@class MemeViewController;

@interface MemeModel : NSObject

// controller objects
@property(retain, nonatomic) MemeViewController* memeController;
@property(retain, nonatomic) FavoritesViewController* favoriteController;

// array containing dictionary of memes
@property(retain, nonatomic) NSMutableArray* memes;

// array containing dictionary of favorites
@property(retain, nonatomic) NSMutableArray* favorites;

// get singleton instance
+ (MemeModel*)model;

// initialize instance
- (id)init;

// set favorite status
- (void)addItemToFavorite:(NSMutableDictionary*)item;
- (void)removeItemFromFavorite:(NSMutableDictionary*)item;

@end
