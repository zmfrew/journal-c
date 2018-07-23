//
//  Entry.m
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFEntry.h"

@implementation ZMFEntry

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = [NSDate new];
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    if(![object isKindOfClass:[ZMFEntry class]]) { return NO; }
    
    ZMFEntry *entry = object;
    
    if (![entry.title isEqualToString:self.title] && entry.title != self.title) { return NO; }
    if (![entry.bodyText isEqualToString:self.bodyText] && entry.bodyText != self.bodyText) { return NO; }
    
    return YES;
}

@end
