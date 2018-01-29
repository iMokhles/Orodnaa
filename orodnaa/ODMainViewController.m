//
//  ODMainViewController.m
//  orodnaa
//
//  Created by iMokhles on 13/12/2016.
//  Copyright © 2016 imokhles. All rights reserved.
//

#import "ODMainViewController.h"
#import "ODRightViewController.h"
#import "AppDelegate.h"

@interface ODMainViewController ()
@property (nonatomic, strong) ODRightViewController *rightViewController;
@property (assign, nonatomic) NSUInteger type;
@end

@implementation ODMainViewController

- (void)setupWithPresentationStyle:(LGSideMenuPresentationStyle)style type:(NSUInteger)type {
    self.type = type;
    
    self.rightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightViewController"];
    
    if (type == 0) {
        [self setRightViewEnabledWithWidth:195
                         presentationStyle:style
                      alwaysVisibleOptions:LGSideMenuAlwaysVisibleOnNone];
        
        self.rightViewStatusBarStyle = UIStatusBarStyleLightContent;
        self.rightViewStatusBarVisibleOptions = LGSideMenuStatusBarVisibleOnNone;
        
        if (style == LGSideMenuPresentationStyleScaleFromLittle) {
            
        }
    }
    [self.rightView addSubview:self.rightViewController.view];
    
}

- (void)rightViewWillLayoutSubviewsWithSize:(CGSize)size
{
    [super rightViewWillLayoutSubviewsWithSize:size];
    if (![UIApplication sharedApplication].isStatusBarHidden && (_type == 2 || _type == 3))
        _rightViewController.view.frame = CGRectMake(0.f , 20.f, size.width, size.height-20.f);
    else
        _rightViewController.view.frame = CGRectMake(0.f , 0.f, size.width, size.height);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
