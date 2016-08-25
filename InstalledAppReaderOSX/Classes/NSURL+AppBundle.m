//
//  NSURL+AppBundle.m
//  Pods
//
//  Created by brianliu on 2016/8/25.
//
//

#import "NSURL+AppBundle.h"

@implementation NSURL (AppBundle)
-(NSString*)appName{
    if(self.isAppBundle == NO){
        return nil;
    }
    return [[self lastPathComponent] stringByDeletingPathExtension];
}
-(NSURL*__nullable)infoPlistFileURL{
    NSURL* infoPlistURL = [self URLByAppendingPathComponent:@"Contents/Info.plist"];
    return infoPlistURL;
}
-(BOOL)isAppInfoPlistExist{
    BOOL isDir = NO;
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:self.infoPlistFileURL.path isDirectory:&isDir];
    return (exist && !isDir);
}
-(BOOL)isDir{
    NSError * error = nil;
    NSDictionary* a = [[NSFileManager defaultManager] attributesOfItemAtPath:self.path error:&error];
    NSString * fileType = [a objectForKey:NSFileType];
    if ([fileType isEqualToString:NSFileTypeDirectory])
        return YES;
    return NO;
}
-(BOOL)isAppBundle{
    return self.isDir && [self.lastPathComponent.pathExtension isEqualToString:@"app"] && self.isAppInfoPlistExist;
}
-(BOOL)isFramework{
    return self.isDir && [self.lastPathComponent.pathExtension isEqualToString:@"framework"];
}
-(NSString*__nullable)appBundleVersion{
    if(self.isAppBundle == NO){
        return nil;
    }
    NSDictionary * infoPlist = [NSDictionary dictionaryWithContentsOfURL:self.infoPlistFileURL];
    return [infoPlist objectForKey:@"CFBundleVersion"];
}
-(NSString*__nullable)appShortVersion{
    if(self.isAppBundle == NO){
        return nil;
    }
    NSDictionary * infoPlist = [NSDictionary dictionaryWithContentsOfURL:self.infoPlistFileURL];
    return [infoPlist objectForKey:@"CFBundleShortVersionString"];
}
@end
