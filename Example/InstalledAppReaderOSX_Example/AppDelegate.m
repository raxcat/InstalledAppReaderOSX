//
//  AppDelegate.m
//  InstalledAppReaderOSX_Example
//
//  Created by brianliu on 2016/8/25.
//  Copyright © 2016年 raxcat. All rights reserved.
//

#import "AppDelegate.h"
@import InstalledAppReaderOSX;
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSURL * selfUrl = [[NSBundle mainBundle] bundleURL];
    NSLog(@"%@", [selfUrl appBundleVersion]);
    NSLog(@"%@", [selfUrl appShortVersion]);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
