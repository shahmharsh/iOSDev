//
//  InstructorDetailsTableViewController.h
//  Assignment5
//
//  Created by Harsh Shah on 11/14/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSInstructor.h"
#import "HSRateView.h"
#import "HSRateAlertViewController.h"

@interface HSInstructorInfoTableViewController : UITableViewController<HSRateAlertViewDelegate>

@property HSInstructor *instructor;
@property NSMutableArray *dataArray;
@property NSMutableArray *commentsArray;

@property (strong, nonatomic) IBOutlet UITableView *instructorInfoTable;

-(void) getInstructorData;
-(void) populateTable:(BOOL)isComment;

@end
