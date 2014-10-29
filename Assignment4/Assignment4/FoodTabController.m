//
//  FirstViewController.m
//  Assignment4
//
//  Created by Harsh Shah on 10/27/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "FoodTabController.h"
#define kCountryComponent 0
#define kFoodComponent 1

@interface FoodTabController ()

@end

@implementation FoodTabController
@synthesize foodPicker;
@synthesize countryAndFood;
@synthesize countries;
@synthesize foods;
@synthesize foodSlider;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.foodPicker.delegate = self;
    self.foodPicker.dataSource = self;
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *pListPath = [bundle pathForResource:@"food" ofType:@"plist"];
    countryAndFood = [[NSDictionary alloc]initWithContentsOfFile:pListPath];
    
    NSArray *components = [countryAndFood allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    countries = sorted;
    
    NSString *selectCountry = [countries objectAtIndex:0];
    components = [countryAndFood objectForKey:selectCountry];
    sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    foods = sorted;
    
    [foodPicker selectRow:0 inComponent:kFoodComponent animated:YES];
    [foodPicker reloadComponent:kFoodComponent];
    [self updateSliderWithFoodRow:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kCountryComponent) {
        return [countries count];
    }
    return [foods count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component {
    if (component == kCountryComponent) {
        return [countries objectAtIndex:row];
    }
    return [foods objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component {
    if (component == kCountryComponent) {
        NSString *selectCountry = [countries objectAtIndex:row];
        NSArray *components = [countryAndFood objectForKey:selectCountry];
        NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
        foods = sorted;
        [foodPicker selectRow:0 inComponent:kFoodComponent animated:YES];
        [foodPicker reloadComponent:kFoodComponent];
        [self updateSliderWithFoodRow:0];
    } else {
        [self updateSliderWithFoodRow:row];
    }
}

-(void)updateSliderWithFoodRow:(NSInteger)row {
    NSInteger numberOfRows = [self pickerView:foodPicker numberOfRowsInComponent:kFoodComponent];
    float effectiveSliderValue = (float)row/(float)(numberOfRows-1);
    [foodSlider setValue:effectiveSliderValue animated:YES];
}

- (IBAction)sliderValueChanged:(id)sender {
    float sliderValue = [foodSlider value];
    NSInteger numberOfRows = [self pickerView:foodPicker numberOfRowsInComponent:kFoodComponent];
    NSInteger effectiveRow = sliderValue * (numberOfRows-1);
    [foodPicker selectRow:effectiveRow inComponent:kFoodComponent animated:YES];
    [self updateSliderWithFoodRow:effectiveRow];
}

@end
