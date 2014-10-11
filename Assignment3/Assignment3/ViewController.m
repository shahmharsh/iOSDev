//
//  ViewController.m
//  Assignment3
//
//  Created by Harsh Shah on 10/6/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.xCordinate.delegate = self;
    self.yCordinate.delegate = self;
    self.xCordinate.keyboardType = UIKeyboardTypeNumberPad;
    self.yCordinate.keyboardType = UIKeyboardTypeNumberPad;
    
    [self updateViewsWithSavedValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateButtonPressed {
    [self.view endEditing:YES];
    NSInteger xCord = [self.xCordinate.text integerValue];
    NSInteger yCord = [self.yCordinate.text integerValue];
    self.movingLabel.center = CGPointMake(xCord, yCord);
    self.movingLabel.text = self.inputText.text;
    [self.movingLabel sizeToFit];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *aTouch = [touches anyObject];
    CGPoint touchLocation = [aTouch locationInView:self.view];
    self.movingLabel.center = touchLocation;
    NSInteger xCord = touchLocation.x + 0.5f;
    NSInteger yCord = touchLocation.y + 0.5f;
    self.xCordinate.text = [@(xCord) stringValue];
    self.yCordinate.text = [@(yCord) stringValue];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 3) ? NO : YES;
}

- (void) updateViewsWithSavedValues {
    self.inputText.text = savedInputText;
    self.xCordinate.text = savedXCord;
    self.yCordinate.text = savedYCord;
    [self updateButtonPressed];
}


@end
