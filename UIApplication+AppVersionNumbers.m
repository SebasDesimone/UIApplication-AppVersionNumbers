//
//  UIApplication+AppVersionNumbers.m
//
//  Created by Sebastian Desimone on 5/2/12.
//  Copyright (c) 2013 Sebastian Desimone. NO rights reserved.
//

#import "UIApplication+AppVersionNumbers.h"

@implementation UIApplication (AppVersionNumbers)

+ (NSString *) appVersionNumber{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *) appBuildNumber{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *) appVersion {
    NSString *build = [self appBuildNumber];
    NSString *version = [self appVersionNumber];

    if (version == nil || [version length] == 0 ) {
        return build; // it doesn't matters if it's nil
    } else if (build == nil || [build length] == 0 || [version isEqualToString:build]) { // version can't be nil
        return version;
    } else { // version & build not nil and not @"" and not equal
        return [NSString stringWithFormat:@"%@ (%@)", version, build];
    }
}

@end
