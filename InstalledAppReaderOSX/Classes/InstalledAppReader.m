//
//  InstalledAppReader.m
//  EZLauncher-Installer
//
//  Created by brianliu on 2016/8/24.
//  Copyright © 2016  winnerwave. All rights reserved.
//

#import "InstalledAppReader.h"
@interface NSURL (InfoPlist)
-(NSString*)appName;
-(NSURL*)infoPlistFileURL;
-(BOOL)isAppInfoPlistExist;
-(BOOL)isDir;
-(BOOL)isAppBundle;
-(BOOL)isFramework;
@end
@implementation NSURL (InfoPlist)

-(NSString*)appName{
    return [[self lastPathComponent] stringByDeletingPathExtension];
}
-(NSURL*)infoPlistFileURL{
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
@end


@implementation InstalledAppReader
+(NSArray <NSString*> *)installedAppsByName:(BOOL)recursive{
    NSArray * array = [[self class] installedAppsByPath:recursive];
    
    if (array.count == 0 ){
        return nil;
    }
    
    NSMutableArray * mArray = [NSMutableArray new];
    for (NSURL *appUrl in array) {
        [mArray addObject:[appUrl appName]];
    }
    return [[NSArray alloc] initWithArray:mArray];
}

+(NSArray <NSURL*> *)installedAppsByPath:(BOOL)recursive{
    return [[self class] installedAppsByPaths:[[[NSFileManager defaultManager] URLsForDirectory:NSApplicationDirectory inDomains:NSLocalDomainMask] objectAtIndex:0] recursive:recursive];
}

+(NSArray <NSURL*> *)installedAppsByPaths:(NSURL*)directory recursive:(BOOL)recursive{
    
    NSError *error = nil;
    
    NSArray *properties = [NSArray arrayWithObjects: NSURLLocalizedNameKey, NSURLCreationDateKey, NSURLLocalizedTypeDescriptionKey, nil];
    
    NSArray <NSURL*> *array = [[NSFileManager defaultManager]
                      contentsOfDirectoryAtURL:directory
                      includingPropertiesForKeys:properties
                      options:(NSDirectoryEnumerationSkipsHiddenFiles)
                      error:&error];
    if (array == nil) {
        NSDictionary* a = [[NSFileManager defaultManager] attributesOfItemAtPath:directory.path error:&error];
        NSLog(@"Error: Unable to read installed app paths, error path: %@ \n\nattributes:%@", directory, a);
        
        
    }
    NSMutableArray * m = [[NSMutableArray alloc] init];
    for (NSURL * appUrl in array) {
        
        if ([appUrl isAppBundle]){
            [m addObject:appUrl];
        }else if([appUrl isDir] && appUrl.isAppBundle == NO && appUrl.isFramework == NO && recursive){
//            NSLog(@"[%@] maybe a folder, digging in ...", appUrl);
            NSArray * sub = [[self class] installedAppsByPaths:appUrl recursive:YES];
            if (sub.count > 0 ){
//                NSLog(@"sub -> \n%@", sub);
                [m addObjectsFromArray:sub];
            }
        }
    }
    
    return [[NSArray alloc] initWithArray:m];
}

+(NSArray <NSString*> *)installedAppsByBundleId:(BOOL)recursive{
    NSArray * array = [[self class] installedAppsByPath:recursive];
    
    if (array.count == 0 ){
        return nil;
    }
    
    NSMutableArray * mArray = [NSMutableArray new];
    for (NSURL *appUrl in array) {
        NSURL* infoPlistURL =  [appUrl URLByAppendingPathComponent:@"Contents/Info.plist"];
        NSDictionary * info = [[NSDictionary alloc] initWithContentsOfURL:infoPlistURL];
        NSString * bundleId = [info objectForKey:@"CFBundleIdentifier"];
        [mArray addObject:bundleId];
    }
    return [[NSArray alloc] initWithArray:mArray];
}
@end

