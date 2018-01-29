//
//  ViewController.m
//  orodnaa
//
//  Created by iMokhles on 13/12/2016.
//  Copyright © 2016 imokhles. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import "ODHelper.h"
#import "DRPLoadingSpinner.h"

@interface ViewController () <UIWebViewDelegate> {
    BOOL isLogginIn;
}
@property (strong, nonatomic) IBOutlet DRPLoadingSpinner *spinnerView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.spinnerView setTintColor:[ODHelper od_orangeColor]];
    self.spinnerView.rotationCycleDuration = 1.6;
    self.spinnerView.minimumArcLength = M_PI / 3.;
    self.spinnerView.drawCycleDuration = .8;
    self.spinnerView.colorSequence = @[ [ODHelper od_orangeColor] ];
    self.spinnerView.lineWidth = 2.;
    [self.spinnerView startAnimating];
    
    [self.mainWebView setHidden:YES];
    [self.mainWebView setDelegate:self];
    if (self.webPageURL.length < 1) {
        [self loadNewWebPage:[ODHelper siteURL]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)loadNewWebPage:(NSString *)pageURL {
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:pageURL] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval: 10.0]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (webView.isLoading)
        return;
    
    [self.spinnerView stopAnimating];
    [self.mainWebView setHidden:NO];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ((long)navigationType == 5) {
        if ([request.URL.absoluteString containsString:@"index.php"]) {
            if (isLogginIn) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ODChangeSideMenu" object:nil];
                isLogginIn = NO;
            }
        }
    }
    
    if ((long)navigationType == 1) {
        if ([request.URL.absoluteString containsString:@"login"]) {
            isLogginIn = YES;
        }
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
