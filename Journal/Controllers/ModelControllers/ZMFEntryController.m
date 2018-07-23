//
//  ZMFEntryController.m
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFEntryController.h"

@interface ZMFEntryController()

#pragma mark - Properties
@property (nonatomic, strong, readwrite) NSMutableArray* internalEntries;

@end

@implementation ZMFEntryController

- (NSArray *)entries { return self.internalEntries; }

#pragma mark - Initializers
- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Shared Instance
+ (ZMFEntryController *)sharedController
{
    static ZMFEntryController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [ZMFEntryController new];
    });
    return sharedController;
}

#pragma mark - Methods

- (void) createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    ZMFEntry *entry = [[ZMFEntry alloc] initWithTitle:title bodyText:bodyText];
    [self.internalEntries addObject:entry];
}

- (void) updateEntry:(ZMFEntry *)entry withTitle:(NSString *)title andBodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
}

- (void) deleteEntry:(ZMFEntry *)entry
{
    [self.internalEntries removeObject:entry];
}

@end
