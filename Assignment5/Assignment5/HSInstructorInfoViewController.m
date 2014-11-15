//
//  InstructorDetailsTableViewController.m
//  Assignment5
//
//  Created by Harsh Shah on 11/14/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSInstructorInfoViewController.h"

@interface HSInstructorInfoViewController ()

@end

@implementation HSInstructorInfoViewController
@synthesize instructor = _instructor;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [_instructor fullName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getInstructorData {
    
}

@end
