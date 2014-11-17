//
//  InstructorsTableViewController.m
//  Assignment5
//
//  Created by Harsh Shah on 11/14/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSInstructorsTableViewController.h"
#import "HSConstants.h"
#import "HSInstructor.h"
#import "HSInstructorInfoTableViewController.h"

@interface HSInstructorsTableViewController ()

@end

@implementation HSInstructorsTableViewController
@synthesize instructors = _instructors;
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    _instructors = [[NSMutableArray alloc] init];
    //_tableView.delegate = self;
    [self populateTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)populateTable {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:HSGetInstructorNameURL]
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSArray *instaructorsArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                for (NSInteger i=0; i < [instaructorsArray count]; i++) {
                                                    NSDictionary *instructorDictionary = [instaructorsArray objectAtIndex:i];
                                                    NSString *firstName = [instructorDictionary objectForKey:HSKeyFirstName];
                                                    NSString *lastName = [instructorDictionary objectForKey:HSKeyLastName];
                                                    NSUInteger instructorID = [[instructorDictionary objectForKey:HSKeyInstructorID] integerValue];
                                                    HSInstructor *instructor = [[HSInstructor alloc] initWithInstructorID:instructorID FirstName:firstName LastName:lastName];
                                                    [_instructors addObject:instructor];
                                                }
                                                // reload table view data on main thread
                                                dispatch_async(dispatch_get_main_queue(), ^ {
                                                    [_tableView reloadData];
                                                });
                                            }];
    
    [dataTask resume];

}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_instructors count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:HSInstructorCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HSInstructorCellIdentifier];
    }
    
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [_instructors[row] fullName];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:HSSequeIdentifierShowInstructorDetail]) {
        NSIndexPath *indexPath = [_tableView indexPathForSelectedRow];
        NSUInteger row = indexPath.row;
        HSInstructorInfoTableViewController *instructorInfoViewController = segue.destinationViewController;
        instructorInfoViewController.instructor = _instructors[row];
    }
}

@end
