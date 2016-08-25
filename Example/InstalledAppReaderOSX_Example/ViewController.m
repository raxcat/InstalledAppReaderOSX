//
//  ViewController.m
//  InstalledAppReaderOSX_Example
//
//  Created by brianliu on 2016/8/25.
//  Copyright © 2016年 raxcat. All rights reserved.
//

#import "ViewController.h"
@import InstalledAppReaderOSX;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)showByName:(id)sender {
    NSLog(@"%@", [InstalledAppReader installedAppsByName]);
}
- (IBAction)showByPath:(id)sender {
    NSLog(@"%@", [InstalledAppReader installedAppsByPath]);
}
- (IBAction)showByBundleID:(id)sender {
    NSLog(@"%@", [InstalledAppReader installedAppsByBundleId]);
}

@end
