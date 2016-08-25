//
//  NSApplication+Running.h
//  Pods
//
//  Created by brianliu on 2016/8/25.
//
//

#import <Cocoa/Cocoa.h>

@interface NSApplication (Running)
+(BOOL)isApplicationRunning:(NSString *)bundleId;
@end
