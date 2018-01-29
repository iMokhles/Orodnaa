//
//  ODRightViewController.m
//  orodnaa
//
//  Created by iMokhles on 13/12/2016.
//  Copyright © 2016 imokhles. All rights reserved.
//

#import "ODRightViewController.h"
#import "ODRightMenuCell.h"
#import "ViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import "ODHelper.h"
#import "ODMainViewController.h"

#define kMainViewController                            (ODMainViewController *)[UIApplication sharedApplication].delegate.window.rootViewController


@interface ODRightViewController () <UITableViewDelegate, UITableViewDataSource> {
    BOOL isLoggedIn;
}

@property (strong, nonatomic) NSArray *titlesArray;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@end

@implementation ODRightViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableViewNotification:) name:@"ODChangeSideMenu" object:nil];
    
    [self updateTableView];
}

- (void)updateTableViewNotification:(NSNotification *)notification {
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([ODHelper loadSideMenuTitles].count > 0) {
            isLoggedIn = YES;
            self.titlesArray = [ODHelper loadSideMenuTitles];
            
        } else {
            isLoggedIn = NO;
            self.titlesArray = @[@"الرئيسية",
                                 @"تسجيل دخول",
                                 @"التسجيل"];
            
        }
        
        [self.mainTableView reloadData];
    });
    
}

- (void)updateTableView {
    
    if ([ODHelper loadSideMenuTitles].count > 0) {
        isLoggedIn = YES;
        self.titlesArray = [ODHelper loadSideMenuTitles];
    } else {
        isLoggedIn = NO;
        self.titlesArray = @[@"الرئيسية",
                             @"تسجيل دخول",
                             @"التسجيل"];
        
    }
    
    [self.mainTableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titlesArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ODRightMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ODRightMenuCell"];
    
    cell.cellLabel.text = self.titlesArray[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ViewController *pageVC = (ViewController *)[kMainViewController rootViewController];
    
    if (isLoggedIn) {
        if (indexPath.section == 0) {
            [kMainViewController hideRightViewAnimated:YES completionHandler:^{
                [pageVC loadNewWebPage:[ODHelper siteURL]];
            }];
        } else if (indexPath.section == 1) {
            [kMainViewController hideRightViewAnimated:YES completionHandler:^{
                [pageVC loadNewWebPage:[ODHelper profileURL]];
            }];
        } else if (indexPath.section == 2) {
            [kMainViewController hideRightViewAnimated:YES completionHandler:^{
                [pageVC loadNewWebPage:[ODHelper logoutURL]];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self updateTableView];
                });
                
            }];
        }
    } else {
        if (indexPath.section == 0) {
            [kMainViewController hideRightViewAnimated:YES completionHandler:^{
                [pageVC loadNewWebPage:[ODHelper siteURL]];
            }];
        } else if (indexPath.section == 1) {
            [kMainViewController hideRightViewAnimated:YES completionHandler:^{
                [pageVC loadNewWebPage:[ODHelper signinURL]];
            }];
        } else if (indexPath.section == 2) {
            [kMainViewController hideRightViewAnimated:YES completionHandler:^{
                [pageVC loadNewWebPage:[ODHelper signupURL]];
            }];
        }
    }
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:8/255.0 green:8/255.0 blue:8/255.0 alpha:1];
    [cell setSelectedBackgroundView:bgColorView];
    
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
