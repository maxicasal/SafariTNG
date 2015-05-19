//
//  ViewController.m
//  SafariTNG
//
//  Created by Maxi Casal on 10/1/14.
//  Copyright (c) 2014 Maxi Casal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadHomePage];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = @"Bad Error... No biscuit";
    alertView.message = error.localizedDescription;
    [alertView addButtonWithTitle:@"That sucks!"];
    [alertView addButtonWithTitle:@"Go home"];
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [super viewDidLoad];
        [self loadHomePage];
    }
}

-(void) loadURLString: (NSString *) urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

-(void) loadHomePage{
    [self loadURLString:@"http://www.mobilemakers.co/"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self loadURLString:  textField.text];
    return YES;
}
@end
