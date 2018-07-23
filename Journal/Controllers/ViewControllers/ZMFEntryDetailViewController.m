//
//  ZMFEntryDetailViewController.m
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFEntryDetailViewController.h"
#import "ZMFEntryController.h"
#import "ZMFEntry.h"

@interface ZMFEntryDetailViewController ()

#pragma mark - Outlets

@property (weak, nonatomic) IBOutlet UITextField *titleTF;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextTV;

@end

@implementation ZMFEntryDetailViewController

#pragma mark - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

#pragma mark - Actions

- (IBAction)addButtonPressed:(UIBarButtonItem *)sender {
    if (self.entry) {
        [[ZMFEntryController sharedController] updateEntry:self.entry withTitle:self.titleTF.text andBodyText:self.bodyTextTV.text];
    } else {
        [[ZMFEntryController sharedController] createEntryWithTitle:self.titleTF.text bodyText:self.bodyTextTV.text];
        [[self navigationController] popViewControllerAnimated:YES];
    }
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    self.titleTF.text = @"";
    self.bodyTextTV.text = @"";
}

#pragma mark - Methods
- (void) updateViews
{
    if (self.entry) {
        self.title = self.entry.title;
        self.titleTF.text = self.entry.title;
        self.bodyTextTV.text = self.entry.bodyText;
    }
}

@end
