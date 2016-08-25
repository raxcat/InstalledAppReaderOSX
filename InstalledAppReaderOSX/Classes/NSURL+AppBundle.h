//
//  NSURL+AppBundle.h
//  Pods
//
//  Created by brianliu on 2016/8/25.
//
//

#import <Foundation/Foundation.h>

@interface NSURL (AppBundle)
/**
  Extract App name from a given NSURL object if it is a app bundle.
 */
-(NSString*__nullable)appName;

/**
 Extract Info.plist from a given NSURL object if it is a app bundle.
 */
-(NSURL*__nullable)infoPlistFileURL;

/**
 Indicates if Info.plist exists from a given NSURL object if it is a app bundle.
 */
-(BOOL)isAppInfoPlistExist;

/**
 Indicates if a given NSURL object is a directory.
 */
-(BOOL)isDir;

/**
 Indicates if a given NSURL object is an app bundle.
 */
-(BOOL)isAppBundle;

/**
 Indicates if if a given NSURL object is a framework bundle.
 */
-(BOOL)isFramework;

/**
 Extract CFBundleVersion from a given NSURL object if it is a app bundle.
 */
-(NSString*__nullable)appBundleVersion;

/**
 Extract CFBundleShortVersionString from a given NSURL object if it is a app bundle.
 */
-(NSString*__nullable)appShortVersion;
@end
