//
//  ZMFEntryController.m
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFEntryController.h"
#import "ZMFEntry.h"

static NSString *const keyEntries = @"entries";

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
        [sharedController loadFromPersistentStore];
    });
    return sharedController;
}

#pragma mark - Methods

- (void) createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    ZMFEntry *entry = [[ZMFEntry alloc] initWithTitle:title bodyText:bodyText timestamp:[NSDate new]];
    [self.internalEntries addObject:entry];
    [self saveToPersistentStore];
}

- (void) updateEntry:(ZMFEntry *)entry withTitle:(NSString *)title andBodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
    [self saveToPersistentStore];
}

- (void) deleteEntry:(ZMFEntry *)entry
{
    [self.internalEntries removeObject:entry];
    [self saveToPersistentStore];
}

#pragma mark - Persistence
- (void)saveToPersistentStore
{
    NSMutableArray *entryDicts = [NSMutableArray new];
    
    for (ZMFEntry *entry in self.entries) {
        [entryDicts addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDicts forKey:keyEntries];
}

- (void) loadFromPersistentStore
{
    NSArray *entryDicts = [[NSUserDefaults standardUserDefaults] objectForKey:keyEntries];
    for (NSDictionary *dictionary in entryDicts) {
        ZMFEntry *entry = [[ZMFEntry alloc] initWithDictionary:dictionary];
        [self.internalEntries addObject:entry];
    }
}

@end
