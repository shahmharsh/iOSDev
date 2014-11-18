//
//  HSRateAlertViewController.m
//  Assignment5
//
//  Created by Harsh Shah on 11/17/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSRateAlertViewController.h"
#import "HSConstants.h"

@interface HSRateAlertViewController ()

@end

@implementation HSRateAlertViewController
@synthesize rating = _rating;
@synthesize rateView = _rateView;
@synthesize delegate = _delegate;
@synthesize container = _container;
@synthesize parentView = _parentView;
@synthesize instructorName = _instructorName;
@synthesize labelInstructorName = _labelInstructorName;


-(void)viewDidLoad {
    [super viewDidLoad];
    [_rateView setMaxRating:5];
    [_rateView setEditable:YES];
    _rateView.delegate = self;
    _labelInstructorName.text = [NSString stringWithFormat:@"%@ %@",HSStringRate, _instructorName];
    
    _container.layer.borderWidth = 0.5;
    _container.layer.borderColor = [UIColor blackColor].CGColor;
    _container.layer.cornerRadius = 4;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithView:(UIView *)view instructorName:(NSString *)instructorName delegate:(id<HSRateAlertViewDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _parentView = view;
        _instructorName = instructorName;
    }
    return self;
}

-(void)show {
    [_parentView addSubview:self.view];
    self.view.frame = _parentView.frame;
    self.view.center = _parentView.center;
}

- (IBAction)dismiss:(id)sender {
    [self.view removeFromSuperview];
    
    NSString *buttonName = ((UIButton*) sender).titleLabel.text;
    
    if ([buttonName isEqualToString:HSStringRate]) {
        [_delegate HSRateAlertView:self wasDismissedWithValue:_rating];
    }
}

-(void)HSRateView:(HSRateView *)rateView ratingDidChange:(float)rating {
    _rating = rating;
}

@end
