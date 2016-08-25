//
//  NSApplication+Running.m
//  Pods
//
//  Created by brianliu on 2016/8/25.
//
//

#import "NSApplication+Running.h"

@implementation NSApplication (Running)
+(BOOL)isApplicationRunning:(NSString *)bundleId{
    BOOL alreadyRunning = NO;
    NSArray *running = [[NSWorkspace sharedWorkspace] runningApplications];
    for (NSRunningApplication *app in running) {
        if ([[app bundleIdentifier] isEqualToString:bundleId]) {
            alreadyRunning = YES;
            break;
        }
    }
    return alreadyRunning;
}

@end
