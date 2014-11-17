//
//  Constants.m
//  Assignment5
//
//  Created by Harsh Shah on 11/13/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSConstants.h"

NSString *const HSGetInstructorNameURL = @"http://bismarck.sdsu.edu/rateme/list";
NSString *const HSGetInstructorInfoURL = @"http://bismarck.sdsu.edu/rateme/instructor/";
NSString *const HSGetInstructorCommentsURL = @"http://bismarck.sdsu.edu/rateme/comments/";

NSString *const HSKeyFirstName = @"firstName";
NSString *const HSKeyLastName = @"lastName";
NSString *const HSKeyInstructorID = @"id";
NSString *const HSKeyOffice = @"office";
NSString *const HSKeyPhone = @"phone";
NSString *const HSKeyEmail = @"email";
NSString *const HSKeyRating = @"rating";
NSString *const HSKeyRatingAverage = @"average";
NSString *const HSKeyRatingTotal = @"totalRatings";
NSString *const HSKeyCommentText = @"text";
NSString *const HSKeyCommentDate = @"date";

NSString *const HSTitleName = @"Instructor Name";
NSString *const HSTitleOffice = @"Office";
NSString *const HSTitlePhone = @"Phone";
NSString *const HSTitleEmail = @"Email";
NSString *const HSTitleRating = @"Rating";
NSString *const HSTitleComments = @"Comments";

NSInteger const HSTableViewSectionName = 0;
NSInteger const HSTableViewSectionOffice = 1;
NSInteger const HSTableViewSectionPhone = 2;
NSInteger const HSTableViewSectionEmail = 3;
NSInteger const HSTableViewSectionRating = 4;
NSInteger const HSTableViewSectionComments = 5;

NSString *const HSInstructorCellIdentifier = @"InstructorCell";
NSString *const HSInstructorInfoCellIdentifier = @"InstructorInfoCell";
NSString *const HSRatingCellIdentifier = @"RatingTableCell";

NSString *const HSSequeIdentifierShowInstructorDetail = @"showInstructorDetails";
NSString *const HSRatingCellNib = @"HSTableViewRatingCell";

NSString *const HSImageStarFull = @"StarFull.png";
NSString *const HSImageStarEmpty = @"StarEmpty.png";
NSString *const HSImageStarHalf = @"StarHalf.png";

NSString *const HSRateNow = @"Rate Now";
NSString *const HSCommentNow = @"Comment Now";