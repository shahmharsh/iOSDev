//
//  InstructorDetailsTableViewController.h
//  Assignment5
//
//  Created by Harsh Shah on 11/14/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSInstructor.h"

@interface HSInstructorInfoViewController : UIViewController

@property HSInstructor *instructor;

-(void) getInstructorData;

@end
