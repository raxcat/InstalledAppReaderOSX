//
//  ViewController.m
//  InstalledAppReaderOSX_Example
//
//  Created by brianliu on 2016/8/25.
//  Copyright © 2016  raxcat. All rights reserved.
//

#import "ViewController.h"
@import InstalledAppReaderOSX;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.recursive = YES;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)showByName:(id)sender {
    NSLog(@"%@", [InstalledAppReader installedAppsByName:self.recursive]);
}
- (IBAction)showByPath:(id)sender {
    NSLog(@"%@", [InstalledAppReader installedAppsByPath:self.recursive]);
}
- (IBAction)showByBundleID:(id)sender {
    NSLog(@"%@", [InstalledAppReader installedAppsByBundleId:self.recursive]);
}

@end
