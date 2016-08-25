//
//  InstalledAppReader.h
//  EZLauncher-Installer
//
//  Created by brianliu on 2016/8/24.
//  Copyright © 2016  winnerwave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstalledAppReader : NSObject

/**
 Show names of installed apps. Sync call.
 @note Recursively finding out installed apps under /Application is a very expansive operation.
 */
+(NSArray<NSString*>*)installedAppsByName:(BOOL)recursive;

/**
 Show paths(NSURL) of installed apps. Sync call.
@note Recursively finding out installed apps under "/Application" is a very expansive operation.
 */
+(NSArray<NSURL*>*)installedAppsByPath:(BOOL)recursive;

/**
 Show bundle identifier of installed apps. Sync call.
@note Recursively finding out installed apps under "/Application" is a very expansive operation.
 */
+(NSArray<NSString*>*)installedAppsByBundleId:(BOOL)recursive;

@end
