//
//  HSRateViewController.h
//  Assignment5
//
//  Created by Harsh Shah on 11/17/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "HSRateView.h"

enum {
    HSRateAlertViewButtonTagRate = 1000,
    HSRateAlertViewButtonTagCancel = 1001
};

@class HSRateAlertView;
@protocol HSRateAlertViewDelegate
-(void)HSRateAlertView:(HSRateAlertView *)rateAlertView wasDismissedWithValue:(NSInteger) value;
-(void)HSRateAlertViewWasCancelled;
@end

@interface HSRateAlertView : UIViewController <HSRateViewDelegate>
@property NSInteger rating;
@property id <HSRateAlertViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIButton *buttonCancel;
@property (strong, nonatomic) IBOutlet UIButton *buttonRate;
@property (strong, nonatomic) IBOutlet HSRateView *rateView;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;

- (void)show;
- (IBAction)dismiss:(id)sender;
@end
