//
//  SecondViewController.h
//  Assignment4
//
//  Created by Harsh Shah on 10/27/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebTabController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *urlTextField;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@end

