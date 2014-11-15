//
//  SegmentTabController.m
//  Assignment4
//
//  Created by Harsh Shah on 10/28/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "SegmentTabController.h"
#define SegmentProgress 0
#define SegmentText 1
#define SegmentAlert 2

@interface SegmentTabController()

@end

@implementation SegmentTabController
@synthesize segmentedControl;
@synthesize progressSwitch;
@synthesize activityIndicator;
@synthesize showAlertButton;
@synthesize textView;
@synthesize alert;

- (void)viewDidLoad {
    [super viewDidLoad];
    segmentedControl.selectedSegmentIndex = 0;
    
    progressSwitch.hidden = activityIndicator.hidden = NO;
    showAlertButton.hidden = YES;
    textView.hidden = YES;
    
    progressSwitch.on = NO;
    [activityIndicator stopAnimating];
    
    [[textView layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[textView layer] setBorderWidth:.5];
    [[textView layer] setCornerRadius:10];
    
    alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Do you like iPhone?" delegate:nil cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentValueChanged:(id)sender {
    if (segmentedControl.selectedSegmentIndex == SegmentProgress) {
        progressSwitch.hidden = activityIndicator.hidden = NO;
        showAlertButton.hidden = YES;
        textView.hidden = YES;
        progressSwitch.on = NO;
        [activityIndicator stopAnimating];
    } else if (segmentedControl.selectedSegmentIndex == SegmentText) {
        progressSwitch.hidden = activityIndicator.hidden = YES;
        showAlertButton.hidden = YES;
        textView.hidden = NO;
    } else {
        progressSwitch.hidden = activityIndicator.hidden = YES;
        showAlertButton.hidden = NO;
        textView.hidden = YES;
    }
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)switchToggled:(id)sender {
    if (progressSwitch.on) {
        [activityIndicator startAnimating];
    } else {
        [activityIndicator stopAnimating];
    }
}

- (IBAction)showAlertClicked:(id)sender {
    [alert show];
}
@end