//
//  Instructor.h
//  Assignment5
//
//  Created by Harsh Shah on 11/13/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSInstructor : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSInteger instructorID;
@property NSString *office;
@property NSString *phone;
@property NSString *email;

-(id) initWithInstructorID:(NSInteger) instructorID FirstName:(NSString *) firstName LastName:(NSString *) lastName;
-(NSString *)fullName;

@end
