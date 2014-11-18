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
#import "HSRateAlertViewController.h"

@interface HSInstructorInfoTableViewController ()

@end

@implementation HSInstructorInfoTableViewController
@synthesize instructor = _instructor;
@synthesize dataArray = _dataArray;
@synthesize instructorInfoTable = _instructorInfoTable;
@synthesize commentsArray = _commentsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [_instructor fullName];
    _instructorInfoTable.rowHeight = 44;
    _dataArray = [[NSMutableArray alloc] init];
    _commentsArray = [[NSMutableArray alloc] init];
    [self getInstructorData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)getInstructorData {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *getInstructorCommentsURL = [NSString stringWithFormat:@"%@%ld", HSGetInstructorCommentsURL, (long)_instructor.instructorID];
    NSURLSessionDataTask *dataTaskGetInstructorComments = [session dataTaskWithURL:[NSURL URLWithString:getInstructorCommentsURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *comments = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSInteger i = 0; i < [comments count]; i++) {
            NSDictionary *comment = [comments objectAtIndex:i];
            NSString *text = [comment objectForKey:HSKeyCommentText];
            [_commentsArray addObject:text];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            [self populateTable:true];
        });
    }];

    
    NSString *getInstructorInfoURL = [NSString stringWithFormat:@"%@%ld", HSGetInstructorInfoURL, (long)_instructor.instructorID];
    NSURLSessionDataTask *dataTaskGetInstructorInfo = [session dataTaskWithURL:[NSURL URLWithString:getInstructorInfoURL]
                                                               completionHandler:^(NSData *data, NSURLResponse *response,NSError *error) {
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
                                                
                                                [dataTaskGetInstructorComments resume];
                                                dispatch_async(dispatch_get_main_queue(), ^ {
                                                    [self populateTable:false];
                                                });
                                            }];
    [dataTaskGetInstructorInfo resume];
}

-(void) populateTable:(BOOL)isComment {
    [_dataArray removeAllObjects];
        NSArray *name = [[NSArray alloc] initWithObjects:[_instructor fullName], nil];
        [_dataArray addObject:name];
        
        NSArray *office = [[NSArray alloc] initWithObjects:[_instructor office], nil];
        [_dataArray addObject:office];
        
        NSArray *phone = [[NSArray alloc] initWithObjects:[_instructor phone], nil];
        [_dataArray addObject:phone];
        
        NSArray *email = [[NSArray alloc] initWithObjects:[_instructor email], nil];
        [_dataArray addObject:email];
        
        NSArray *ratings = [[NSArray alloc] initWithObjects:[_instructor averageRating], [NSNumber numberWithInteger: [_instructor totalRatings]], nil];
        NSArray *ratingArray = [[NSArray alloc] initWithObjects:ratings, nil];
        [_dataArray addObject:ratingArray];

        [_dataArray addObject:_commentsArray];

    
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
    NSString *title = nil;
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
    } else if(section == HSTableViewSectionComments) {
        title = HSTitleComments;
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
        float decimalValue = [averageRating floatValue] - [averageRating integerValue];
        
        if (decimalValue > 0.66) {
            averageRating = [NSNumber numberWithInteger:([averageRating integerValue] + 1)];
        } else if(decimalValue > 0.33){
            averageRating = [NSNumber numberWithFloat:([averageRating integerValue] + 0.5)];
        } else {
            averageRating = [NSNumber numberWithFloat:[averageRating integerValue]];
        }
        
        [cell.rating setRating: [averageRating floatValue]];
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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == HSTableViewSectionRating || section == HSTableViewSectionComments) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, (tableView.frame.size.width/2), 18)];
        [label setFont:[UIFont boldSystemFontOfSize:14]];
        [view addSubview:label];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self
                action:@selector(buttonClicked:)
                forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
        [view setBackgroundColor:[UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f]];
        
        if (section == HSTableViewSectionRating) {
            [label setText:HSTitleRating];
            [button setTitle:HSStringRateNow forState:UIControlStateNormal];
            CGSize stringSize = [HSStringRateNow sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
            float buttonXPosition = tableView.frame.origin.x + tableView.frame.size.width - stringSize.width - 5;
            [button setFrame:CGRectMake(buttonXPosition, 2, stringSize.width, 18)];
        } else {
            [label setText:HSTitleComments];
            [button setTitle:HSStringCommentNow forState:UIControlStateNormal];
            CGSize stringSize = [HSStringCommentNow sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
            float buttonXPosition = tableView.frame.origin.x + tableView.frame.size.width - stringSize.width - 5;
            [button setFrame:CGRectMake(buttonXPosition, 2, stringSize.width, 18)];
        }
        
        return view;
    }
    
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.section < HSTableViewSectionRating);
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    return (action == @selector(copy:));
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (action == @selector(copy:)) {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        [[UIPasteboard generalPasteboard] setString:cell.textLabel.text];
    }
}

- (void) buttonClicked:(UIButton*)sender {
    [_instructorInfoTable setScrollEnabled:NO];
    NSString *buttonName = sender.titleLabel.text;
    if ([buttonName isEqualToString:HSStringRateNow]) {
        HSRateAlertViewController *rateAlert = [[HSRateAlertViewController alloc] initWithInstructorName:[_instructor fullName] delegate:self];
        [rateAlert show];
    } else {
        HSCommentAlertView *commentAlert = [[HSCommentAlertView alloc] initWithInstructorName:[_instructor fullName] delegate:self];
        [commentAlert show];
    }
}

- (void)HSRateAlertViewWasDismissedWithValue:(NSInteger)value {
    [_instructorInfoTable setScrollEnabled:YES];
        NSString *postInstructorRatingURL = [NSString stringWithFormat:@"%@%d/%ld",HSPostInstructorRatingURL, _instructor.instructorID, (long)value];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTaskPostRatings = [session dataTaskWithURL:[NSURL URLWithString:postInstructorRatingURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            NSDictionary *ratings = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSNumber *averageRating = [NSNumber numberWithFloat:[[ratings objectForKey:HSKeyRatingAverage] floatValue]];
            NSInteger totalRatings = [[ratings objectForKey:HSKeyRatingTotal] integerValue];
            [_instructor setAverageRating:averageRating];
            [_instructor setTotalRatings:totalRatings];

            dispatch_async(dispatch_get_main_queue(), ^ {
                [self populateTable:false];
            });
        }];
        
        [dataTaskPostRatings resume];
}

- (void)HSRateAlertViewWasDismissed {
    [_instructorInfoTable setScrollEnabled:YES];
}

- (void)HSCommentAlertViewWasDismissedWithComment:(NSString *)comment {
    [_instructorInfoTable setScrollEnabled:YES];
    NSLog(@"%@",comment);
}

- (void)HSCommentAlertViewWasDismissed {
    [_instructorInfoTable setScrollEnabled:YES];
}

@end

//Reference: http://www.raywenderlich.com/67081/cookbook-using-nsurlsession
