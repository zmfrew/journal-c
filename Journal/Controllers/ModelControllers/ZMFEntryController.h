//
//  ZMFEntryController.h
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMFEntry.h"

@interface ZMFEntryController : NSObject

@property (nonatomic, strong, readonly) NSArray* entries;

+ (ZMFEntryController *)sharedController;

- (void) createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;
- (void) updateEntry:(ZMFEntry *)entry withTitle:(NSString *)title andBodyText:(NSString *)bodyText;
- (void) deleteEntry:(ZMFEntry *)entry;

@end
