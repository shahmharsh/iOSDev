//
//  InstructorDetailsTableViewController.m
//  Assignment5
//
//  Created by Harsh Shah on 11/14/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSInstructorInfoTableViewController.h"
#import "HSConstants.h"
#import "HSRatingTableCell.h"

@interface HSInstructorInfoTableViewController ()

@end

@implementation HSInstructorInfoTableViewController
@synthesize instructor = _instructor;
@synthesize dataArray = _dataArray;
@synthesize instructorInfoTable = _instructorInfoTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [_instructor fullName];
    _instructorInfoTable.rowHeight = 44;
    _dataArray = [[NSMutableArray alloc] init];
    [self getInstructorData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getInstructorData {
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *getInstructorInfoURL = [NSString stringWithFormat:@"%@%ld",HSGetInstructorInfoURL, (long)_instructor.instructorID];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:getInstructorInfoURL]
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSDictionary *instructorData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                NSString *office = [instructorData objectForKey:HSKeyOffice];
                                                NSString *phone = [instructorData objectForKey:HSKeyPhone];
                                                NSString *email = [instructorData objectForKey:HSKeyEmail];
                                                NSDictionary *allRating = [instructorData objectForKey:HSKeyRating];
                                                
                                                NSNumber *averageRating = [NSNumber numberWithFloat:[[allRating objectForKey:HSKeyRatingAverage] floatValue]];
                                                NSInteger totalRatings = [[allRating objectForKey:HSKeyRatingTotal] integerValue];
                                                
                                                [_instructor setOffice:office];
                                                [_instructor setPhone:phone];
                                                [_instructor setEmail:email];
                                                [_instructor setAverageRating:averageRating];
                                                [_instructor setTotalRatings:totalRatings];
                                                
                                                // reload table view data on main thread
                                                dispatch_async(dispatch_get_main_queue(), ^ {
                                                    [self populateTable];
                                                });
                                            }];
    
    [dataTask resume];

}

-(void) populateTable {
    NSArray *name = [[NSArray alloc] initWithObjects:[_instructor fullName], nil];
    [_dataArray addObject:name];
    NSArray *office = [[NSArray alloc] initWithObjects:[_instructor office], nil];
    [_dataArray addObject:office];
    NSArray *phone = [[NSArray alloc] initWithObjects:[_instructor phone], nil];
    [_dataArray addObject:phone];
    NSArray *email = [[NSArray alloc] initWithObjects:[_instructor email], nil];
    [_dataArray addObject:email];
    
    //NSLog(@"Average: %@ Total: %ld",[_instructor averageRating], [_instructor totalRatings]);
    NSArray *ratings = [[NSArray alloc] initWithObjects:[_instructor averageRating], [NSNumber numberWithInteger: [_instructor totalRatings]], nil];
    NSArray *ratingArray = [[NSArray alloc] initWithObjects:ratings, nil];
    [_dataArray addObject:ratingArray];
    
    [_instructorInfoTable reloadData];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [_dataArray objectAtIndex:section];
    return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"";
    if(section == HSTableViewSectionName) {
        title = HSTitleName;
    } else if(section == HSTableViewSectionOffice) {
        title = HSTitleOffice;
    } else if(section == HSTableViewSectionPhone) {
        title = HSTitlePhone;
    } else if(section == HSTableViewSectionEmail) {
        title = HSTitleEmail;
    } else if(section == HSTableViewSectionRating) {
        title = HSTitleRating;
    }
    
    return title;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    
    if (section == HSTableViewSectionRating) {
        
        HSRatingTableCell *cell = [tableView dequeueReusableCellWithIdentifier:HSRatingCellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:HSRatingCellNib owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [cell.rating setMaxRating:5];
        }
        NSArray *array = [_dataArray objectAtIndex:section];
        NSArray *ratings = [array objectAtIndex:indexPath.row];
        NSNumber *averageRating = [ratings objectAtIndex:0];
        NSString *totalRatings = [NSString stringWithFormat:@"(%@)", [ratings objectAtIndex:1]];
        [cell.rating setRating:[averageRating integerValue]];
        cell.textViewTotalRating.text = totalRatings;
        return cell;
    } else {
        UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:HSInstructorInfoCellIdentifier];
    
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HSInstructorInfoCellIdentifier];
        }
    
        NSArray *array = [_dataArray objectAtIndex:section];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
        return cell;
    }
}


@end
