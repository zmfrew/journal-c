//
//  ZMFEntry.h
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMFEntry : NSObject

@property (nonatomic, strong) NSString* title;

@property (nonatomic, strong) NSString* bodyText;

@property (nonatomic, strong) NSDate* timestamp;

- (instancetype) initWithTitle:(NSString *)title
                      bodyText:(NSString *)bodyText;

+ (NSString *)dateToString:(NSDate *)date;

@end
