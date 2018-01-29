//
//  ODHelper.h
//  orodnaa
//
//  Created by iMokhles on 13/12/2016.
//  Copyright © 2016 imokhles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "TFHpple.h"
#import "TFHppleElement.h"

@interface ODHelper : NSObject

+ (UIColor *)od_blackColor;
+ (UIColor *)od_orangeColor;
+ (NSString *)siteURL;
+ (NSString *)contactusURL;
+ (NSString *)aboutusURL;
+ (NSString *)signinURL;
+ (NSString *)signupURL;
+ (NSString *)logoutURL;
+ (NSString *)profileURL;
+ (void)loadCairoFonts;
+ (NSArray *)loadSideMenuTitles;
@end
