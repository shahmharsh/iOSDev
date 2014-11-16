//
//  Instructor.m
//  Assignment5
//
//  Created by Harsh Shah on 11/13/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSInstructor.h"

@implementation HSInstructor
@synthesize firstName = _firstName, lastName = _lastName;
@synthesize instructorID = _instructorID;
@synthesize office = _office, phone = _phone, email = _email;
@synthesize averageRating = _averageRating, totalRatings = _totalRatings;

-(id)initWithInstructorID:(NSInteger)instructorID FirstName:(NSString *)firstName LastName:(NSString *)lastName {
    if (self = [super init]) {
        _instructorID = instructorID;
        _firstName = firstName;
        _lastName = lastName;
    }
    
    return self;
}

-(NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
