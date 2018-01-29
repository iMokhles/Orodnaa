//
//  ODHelper.m
//  orodnaa
//
//  Created by iMokhles on 13/12/2016.
//  Copyright © 2016 imokhles. All rights reserved.
//

#import "ODHelper.h"

@implementation ODHelper

+ (UIColor *)od_blackColor {
    return [UIColor colorWithRed:34 green:34 blue:34 alpha:1];
}
+ (UIColor *)od_orangeColor {
    
    return [UIColor colorWithRed:228 green:75 blue:47 alpha:1];
}

+ (NSString *)siteURL {
    return @"http://3orodnaa.com/index.php";
}

+ (NSString *)aboutusURL {
    return @"http://3orodnaa.com/about_us.php";
}

+ (NSString *)contactusURL {
    return @"http://3orodnaa.com/contact.php";
}

+ (NSString *)signinURL {
    return @"http://3orodnaa.com/login.php";
}

+ (NSString *)signupURL {
    return @"http://3orodnaa.com/signup.php";
}

+ (NSString *)logoutURL {
    return @"http://3orodnaa.com/logout.php";
}

+ (NSString *)profileURL {
    return @"http://3orodnaa.com/profile.php";
}

+ (NSArray *)loadSideMenuTitles {
    
    NSURL *orodnaaUrl = [NSURL URLWithString:@"http://3orodnaa.com/index.php"];
    NSData *orodnaaHtmlData = [NSData dataWithContentsOfURL:orodnaaUrl];
    
    TFHpple *orodnaaParser = [TFHpple hppleWithHTMLData:orodnaaHtmlData];
    
    NSString *orodnaaXpathQueryString = @"//div[@id='navbar']/ul/li/a";
    NSArray *orodnaaNodes = [orodnaaParser searchWithXPathQuery:orodnaaXpathQueryString];
    
    NSMutableArray *pageItems = [[NSMutableArray alloc] init];
    for (TFHppleElement *element in orodnaaNodes) {
        
        if ([[element objectForKey:@"href"] isEqualToString:@"profile.php"]) {
            [pageItems addObject:@"الرئيسية"];
            [pageItems addObject:@"الملف الشخصي"];
            [pageItems addObject:@"تسجيل الخروج"];
            break;
        }
    }
    
    return pageItems.copy;
}
+ (void)loadCairoFonts {
    NSArray *fontsArray = [[NSBundle mainBundle] URLsForResourcesWithExtension:nil subdirectory:@"Fonts.bundle"];
    if (!CTFontManagerRegisterFontsForURLs((__bridge CFArrayRef)fontsArray, kCTFontManagerScopeProcess, nil)) {
        NSLog(@"Failed to load fonts !!!!");
    }
}
@end
