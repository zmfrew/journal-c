//
//  ZMFEntriesListTableViewController.m
//  Journal
//
//  Created by Zachary Frew on 7/23/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFEntriesListTableViewController.h"
#import "ZMFEntryDetailViewController.h"
#import "ZMFEntryController.h"
#import "ZMFEntry.h"

@interface ZMFEntriesListTableViewController ()

@end

@implementation ZMFEntriesListTableViewController

#pragma mark - Life Cycle Methods
- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[ZMFEntryController sharedController] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell" forIndexPath:indexPath];
    ZMFEntry *entry = [[ZMFEntryController sharedController] entries][indexPath.row];
    cell.textLabel.text = entry.title;
    NSString *dateString = [ZMFEntry dateToString: entry.timestamp];
    cell.detailTextLabel.text = dateString;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ZMFEntry *entry = [[ZMFEntryController sharedController] entries][indexPath.row];
        [[ZMFEntryController sharedController] deleteEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ToDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ZMFEntryDetailViewController *destinationVC = segue.destinationViewController;
        ZMFEntry *entry = [[[ZMFEntryController sharedController] entries] objectAtIndex:indexPath.row];
        destinationVC.entry = entry;
    }
}

@end
