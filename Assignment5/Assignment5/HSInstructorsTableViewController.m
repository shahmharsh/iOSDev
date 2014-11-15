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
                                                NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                for (NSInteger i=0; i < [json count]; i++) {
                                                    NSDictionary *subDictionary = [json objectAtIndex:i];
                                                    NSString *firstName = [subDictionary objectForKey:HSKeyFirstName];
                                                    NSString *lastName = [subDictionary objectForKey:HSKeyLastName];
                                                    NSUInteger instructorID = [[subDictionary objectForKey:HSKeyInstructorID] integerValue];
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
