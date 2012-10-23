//
//  MemeAppDelegate.m
//  MemeEmoji
//
//  Created by David Zhang on 10/22/12.
//  Copyright (c) 2012 David Zhang. All rights reserved.
//

#import "MemeAppDelegate.h"

@implementation MemeAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    shouldSave = false;
    
    // get save path
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    savePath = [docPath stringByAppendingPathComponent:@"meme.plist"];
    NSLog(@"save path: %@", savePath);
    
    // get app settings
    NSData* settingsXML = [[NSFileManager defaultManager] contentsAtPath:savePath];
    if (settingsXML) {
        NSError* readError = nil;
        NSPropertyListFormat format;
        settings = (NSMutableDictionary *)[NSPropertyListSerialization
                                propertyListWithData:settingsXML
                                options:NSPropertyListMutableContainersAndLeaves
                                format:&format
                                error:&readError];
    } else {
        // since we can't read form property list, create a new settings array
        settings = [[NSMutableDictionary alloc] init];
    }
    
    if (!settings[@"emojiEnabled"]) {
        NSLog(@"Emoji not enabled");
        
        settings[@"emojiEnabled"] = [NSNumber numberWithBool:TRUE];
        
        // enable emoji keyboard
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:
                          @"../../Library/Preferences/com.apple.Preferences.plist"];
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
        [dict setObject:[NSNumber numberWithBool:YES] forKey:@"KeyboardEmojiEverywhere"];
        if (![dict writeToFile:path atomically:NO]) {
            NSLog(@"error writing to emoji plist");
        }
        
        // set save flag
        shouldSave = true;
    }
    
    // set favoriates array for model
    if (!settings[@"favorites"]) {
        NSMutableArray* favorites = [[NSMutableArray alloc] init];
        settings[@"favorites"] = favorites;
        [[MemeModel model] setFavorites:favorites];
        shouldSave = true;
    } else {
        [[MemeModel model] setFavorites:settings[@"favorites"]];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // save settings
    if (shouldSave) {
        NSLog(@"saving");
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:savePath]) {
            NSLog(@"First time using app, creating file");
            [[NSFileManager defaultManager] createFileAtPath:savePath contents:nil
                                                  attributes:@{NSFileType:NSFileTypeRegular}];
        }
        
        NSString *error = nil;
        NSData *data = [NSPropertyListSerialization
                        dataFromPropertyList:settings
                        format:NSPropertyListXMLFormat_v1_0
                        errorDescription:&error];
        
        if (data) {
            [data writeToFile:savePath atomically:NO];
        } else {
            NSLog(@"plist error: %@", error);
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
