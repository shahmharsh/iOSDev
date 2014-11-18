//
//  HSCommentAlertView.h
//  Assignment5
//
//  Created by Harsh Shah on 11/18/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSCommentAlertView;

@protocol HSCommentAlertViewDelegate
- (void)HSCommentAlertViewWasDismissedWithComment:(NSString *)comment;
- (void)HSCommentAlertViewWasDismissed;
@end

@interface HSCommentAlertView : UIViewController<UITextViewDelegate>

@property id<HSCommentAlertViewDelegate> delegate;
@property NSString *instructorName;
@property UIViewController *HSCommentAlertViewController;

@property (strong, nonatomic) IBOutlet UILabel *labelInstructorName;
@property (strong, nonatomic) IBOutlet UITextView *textViewComment;
@property (strong, nonatomic) IBOutlet UIView *container;

- (id)initWithInstructorName:(NSString *)instructorName delegate:(id <HSCommentAlertViewDelegate>) delegate;
- (void)show;
- (IBAction)dismiss:(id)sender;

@end
