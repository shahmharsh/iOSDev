
//
//  SegmentTabController.h
//  Assignment4
//
//  Created by Harsh Shah on 10/28/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

/*#ifndef Assignment4_SegmentTabController_h
#define Assignment4_SegmentTabController_h


#endif*/
#import <UIKit/UIKit.h>

@interface SegmentTabController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UISwitch *progressSwitch;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIButton *showAlertButton;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property UIAlertView *alert;

- (IBAction)segmentValueChanged:(id)sender;
- (IBAction)switchToggled:(id)sender;
- (IBAction)showAlertClicked:(id)sender;

@end
