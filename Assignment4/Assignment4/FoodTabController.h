//
//  FirstViewController.h
//  Assignment4
//
//  Created by Harsh Shah on 10/27/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTabController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *foodPicker;
@property (strong, nonatomic) IBOutlet UISlider *foodSlider;

@property NSDictionary *countryAndFood;
@property NSArray *countries;
@property NSArray *foods;

- (IBAction)sliderValueChanged:(id)sender;

@end

