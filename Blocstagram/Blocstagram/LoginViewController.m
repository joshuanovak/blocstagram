//
//  LoginViewController.m
//  Blocstagram
//
//  Created by Joshua on 9/3/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import "LoginViewController.h"
#import "DataSource.h"


@interface LoginViewController () <UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;
//+ (UIColor) instagramBlue;

@end

@implementation LoginViewController

NSString *const LoginViewControllerDidGetAccessTokenNotification = @"LoginViewControllerDidGetAccessTokenNotification";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    
    [self.view addSubview:webView];
    self.webView = webView;
    
    self.title = NSLocalizedString(@"Login", @"Login");
    
    NSString *urlString = [NSString stringWithFormat:@"https://instagram.com/oauth/authorize/?client_id=%@&scope=likes+comments+relationships&redirect_uri=%@&response_type=token", [DataSource instagramClientID], [self redirectURI]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style: UIBarButtonItemStylePlain target:self action:@selector(Back:)];
    backButton.enabled = false;
    self.navigationItem.leftBarButtonItem = backButton;
    
}

- (void) viewWillLayoutSubviews {
    self.webView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)redirectURI {
    return @"http://bloc.io";
}

- (void) dealloc {
    //try commenting out to see difference
    [self clearInstagramCookies];
    
    //see https://developer.apple.com/library/ios/documentation/uikit/reference/UIWebViewDelegate_Protocol/Reference/Reference.html#//apple_ref/doc/uid/TP40006951-CH3-DontLinkElementID_1
    self.webView.delegate = nil;

}

- (void) clearInstagramCookies {
    for (NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]) {
        NSRange domainRange = [cookie.domain rangeOfString:@"instagram.com"];
        if (domainRange.location != NSNotFound) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *urlString = request.URL.absoluteString;
    if ([urlString hasPrefix:[self redirectURI]]) {
        //this contains auth token
        NSRange rangeOfAccessTokenParameter = [urlString rangeOfString:@"access_token="];
        NSUInteger indexOfTokenStarting = rangeOfAccessTokenParameter.location + rangeOfAccessTokenParameter.length;
        NSString *accessToken = [urlString substringFromIndex:indexOfTokenStarting];
        [[NSNotificationCenter defaultCenter] postNotificationName:LoginViewControllerDidGetAccessTokenNotification object:accessToken];
        
        return NO;
    } else if ([urlString hasPrefix:@"https://instagram.com/accounts/login/"]) {
        self.navigationItem.leftBarButtonItem.title = @"";
        self.navigationItem.leftBarButtonItem.enabled = false;
        self.navigationItem.leftBarButtonItem.tintColor = [self instagramBlue];
    }
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        self.navigationItem.leftBarButtonItem.title = @"Back";
        self.navigationItem.leftBarButtonItem.enabled = true;
    }
    return YES;
}

- (IBAction)Back: (id)sender {
    [_webView goBack];
}

- (UIColor *) instagramBlue {
    return [UIColor colorWithRed:18.0f/255.0f green:86.0f/255.0f blue:136.0f/255.0f alpha:1.0f];
}


@end
