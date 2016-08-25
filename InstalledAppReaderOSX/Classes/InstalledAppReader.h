//
//  InstalledAppReader.h
//  EZLauncher-Installer
//
//  Created by brianliu on 2016/8/24.
//  Copyright © 2016年 winnerwave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstalledAppReader : NSObject

/**
 Recursively.
 Show names of installed apps.
 */
+(NSArray<NSString*>*)installedAppsByName;

/**
 Recursively.
 Show paths(NSURL) of installed apps.
 */
+(NSArray<NSURL*>*)installedAppsByPath;

/**
 Recursively.
 Show bundle identifier of installed apps.
 */
+(NSArray<NSString*>*)installedAppsByBundleId;

@end
