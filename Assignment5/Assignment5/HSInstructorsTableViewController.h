//
//  InstructorsTableViewController.h
//  Assignment5
//
//  Created by Harsh Shah on 11/14/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSInstructorsTableViewController : UITableViewController

@property NSMutableArray *instructors;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(void) populateTable;

@end
