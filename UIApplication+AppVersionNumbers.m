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

    if ( build == nil || [build length] == 0 || [version isEqualToString:build]) {
        return version;
    } else {
        return [NSString stringWithFormat:@"%@ (%@)", version, build];
    }
}

@end
