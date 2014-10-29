//
//  NSString_URL_Extras.m
//  Assignment4
//
//  Created by Harsh Shah on 10/27/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString_URL_Extras.h"

@implementation NSString (NSString_URL_Extras)

-(NSString *)addHttpPrefix {
    NSString *url = self;
    if ([url hasPrefix:@"http://"]) {
        return url;
    } else {
        return [NSString stringWithFormat:@"http://%@", url];
    }
}

@end