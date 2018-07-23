//
//  ZMFEntryDetailViewController.h
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZMFEntry;

@interface ZMFEntryDetailViewController : UIViewController

@property (nonatomic, strong) ZMFEntry *entry;

@end
