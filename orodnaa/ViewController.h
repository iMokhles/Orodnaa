//
//  ViewController.h
//  orodnaa
//
//  Created by iMokhles on 13/12/2016.
//  Copyright © 2016 imokhles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSString *webPageURL;
@property (strong, nonatomic) IBOutlet UIWebView *mainWebView;
- (void)loadNewWebPage:(NSString *)pageURL;
@end

