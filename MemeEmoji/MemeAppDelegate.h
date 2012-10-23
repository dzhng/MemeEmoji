//
//  MemeAppDelegate.h
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeAppDelegate : UIResponder <UIApplicationDelegate>
{
    // where the save file is located
    NSString* savePath;
    
    // app settings
    NSMutableDictionary* settings;
    
    BOOL shouldSave;
}

@property (strong, nonatomic) UIWindow *window;

@end
