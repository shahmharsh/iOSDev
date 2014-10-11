//
//  ViewController.h
//  Assignment3
//
//  Created by Harsh Shah on 10/6/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    @package
    NSString *savedInputText;
    NSString *savedXCord;
    NSString *savedYCord;
}

@property (strong, nonatomic) IBOutlet UITextField *inputText;
@property (strong, nonatomic) IBOutlet UITextField *xCordinate;
@property (strong, nonatomic) IBOutlet UITextField *yCordinate;
@property (strong, nonatomic) IBOutlet UILabel *movingLabel;

- (IBAction)updateButtonPressed;
- (void) updateViewsWithSavedValues;

@end

