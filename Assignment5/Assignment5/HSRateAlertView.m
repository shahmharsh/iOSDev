//
//  HSRateViewController.m
//  Assignment5
//
//  Created by Harsh Shah on 11/17/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSRateAlertView.h"
#import "UIView+AlertAnimations.h"

@interface HSRateAlertView ()

@end

@implementation HSRateAlertView
@synthesize rating = _rating;
@synthesize delegate = _delegate;
@synthesize rateView = _rateView;
@synthesize labelTitle = _labelTitle;
@synthesize buttonCancel = _buttonCancel, buttonRate = _buttonRate;

- (void)show {
    // We need to add it to the window, which we can get from the delegate
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    [window addSubview:self.view];
    
    // Make sure the alert covers the whole window
    self.view.frame = window.frame;
    self.view.center = window.center;
}

- (IBAction)dismiss:(id)sender {
    [UIView beginAnimations:nil context:nil];
    self.view.alpha = 0.0;
    [UIView commitAnimations];
    [self.view removeFromSuperview];
    
    if (sender == self || [sender tag] == HSRateAlertViewButtonTagRate) {
        [_delegate HSRateAlertView:self wasDismissedWithValue:_rating];
    } else {
        [_delegate HSRateAlertViewWasCancelled];
    }
}

-(void)HSRateView:(HSRateView *)rateView ratingDidChange:(float)rating {
    _rating = rating;
}

@end
