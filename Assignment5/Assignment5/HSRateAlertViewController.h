//
//  HSRateAlertViewController.h
//  Assignment5
//
//  Created by Harsh Shah on 11/17/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSRateView.h"

@class HSRateAlertViewController;

@protocol HSRateAlertViewDelegate
-(void)HSRateAlertView:(HSRateAlertViewController *)rateAlertView wasDismissedWithValue:(NSInteger) value;
@end

@interface HSRateAlertViewController : UIViewController <HSRateViewDelegate>
@property NSInteger rating;
@property id <HSRateAlertViewDelegate> delegate;
@property UIView *parentView;
@property NSString *instructorName;

@property (strong, nonatomic) IBOutlet UILabel *labelInstructorName;
@property (strong, nonatomic) IBOutlet HSRateView *rateView;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UIView *container;

-(id)initWithView:(UIView *)view instructorName:(NSString *)instructorName delegate:(id <HSRateAlertViewDelegate>) delegate;
- (void)show;
- (IBAction)dismiss:(id)sender;

@end

//Reference: http://iphonedevelopment.blogspot.com/2010/05/custom-alert-views.html