//
//  Entry.m
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFEntry.h"

#pragma mark - Properties
static NSString *const TimestampKey = @"timestamp";
static NSString *const TitleKey = @"title";
static NSString *const BodyTextKey = @"bodyText";

@implementation ZMFEntry

#pragma mark - Initializers

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *bodyText = dictionary[BodyTextKey];
    NSDate *timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title bodyText:bodyText timestamp:timestamp];
}

#pragma mark - Methods
-(NSDictionary *)dictionaryCopy
{
    NSDictionary *dictionary = @{
        TitleKey : self.title,
        BodyTextKey : self.bodyText,
        TimestampKey : self.timestamp
    };
    return dictionary;
}

- (BOOL)isEqual:(id)object
{
    if(![object isKindOfClass:[ZMFEntry class]]) { return NO; }
    
    ZMFEntry *entry = object;
    
    if (![entry.title isEqualToString:self.title] && entry.title != self.title) { return NO; }
    if (![entry.bodyText isEqualToString:self.bodyText] && entry.bodyText != self.bodyText) { return NO; }
    
    return YES;
}

+ (NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM d, yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

@end
