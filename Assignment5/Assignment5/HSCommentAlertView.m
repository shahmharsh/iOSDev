//
//  HSCommentAlertView.m
//  Assignment5
//
//  Created by Harsh Shah on 11/18/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSCommentAlertView.h"
#import "HSConstants.h"

@interface HSCommentAlertView ()

@end

@implementation HSCommentAlertView
@synthesize instructorName = _instructorName;
@synthesize delegate = _delegate;
@synthesize labelInstructorName = _labelInstructorName;
@synthesize textViewComment = _textViewComment;
@synthesize container = _container;
@synthesize HSCommentAlertViewController = _HSCommentAlertViewController;


- (void)viewDidLoad {
    [super viewDidLoad];
    _HSCommentAlertViewController = self;
    
    _textViewComment.delegate = self;
    _labelInstructorName.text = _instructorName;
    
    _container.layer.borderWidth = 0.5;
    _container.layer.borderColor = [UIColor blackColor].CGColor;
    _container.layer.cornerRadius = 4;
    
    _textViewComment.layer.borderWidth = 0.5;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithInstructorName:(NSString *)instructorName delegate:(id<HSCommentAlertViewDelegate>)delegate{
    
    if (self = [super init]) {
        _delegate = delegate;
        _instructorName = instructorName;
    }
    
    return self;
}

- (void)show {
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    [window addSubview:self.view];
    self.view.frame = window.frame;
    self.view.center = window.center;
}

- (IBAction)dismiss:(id)sender {
    [self.view removeFromSuperview];
    
    NSString *comment = _textViewComment.text;
    NSString *buttonName = ((UIButton*) sender).titleLabel.text;
    if (([comment length] != 0 && ![comment isEqualToString:HSStringCommentHere]) && [buttonName isEqualToString:HSStringDone]) {
            [_delegate HSCommentAlertViewWasDismissedWithComment:comment];
    } else {
        [_delegate HSCommentAlertViewWasDismissed];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    textView.text = @"";
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
