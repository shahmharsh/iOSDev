//
//  SecondViewController.m
//  Assignment4
//
//  Created by Harsh Shah on 10/27/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "WebTabController.h"
#import "NSString_URL_Extras.h"

@interface WebTabController()

@end

@implementation WebTabController
@synthesize urlTextField;
@synthesize webView;
@synthesize loadingIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    urlTextField.delegate = self;
    webView.delegate = self;
    loadingIndicator.hidden = YES;
    
    urlTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [[webView layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[webView layer] setBorderWidth:.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *url = [urlTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    url = [url addHttpPrefix];
    
    NSURL *nsUrl = [[NSURL alloc] initWithString:url];
    if (nsUrl) {
        NSURLRequest *request = [NSURLRequest requestWithURL:nsUrl];
        [webView loadRequest:request];
    }
    
    [self.view endEditing:YES];
    return NO;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    loadingIndicator.hidden = NO;
    [loadingIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
}

@end
