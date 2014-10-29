//
//  NSString_URL_Extras.h
//  Assignment4
//
//  Created by Harsh Shah on 10/27/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSString_URL_Extras)
//Adds http:// prefix if required
-(NSString *)addHttpPrefix;
@end