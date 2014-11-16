//
//  HSRatingTableCellTableViewCell.m
//  Assignment5
//
//  Created by Harsh Shah on 11/16/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "HSRatingTableCell.h"

@implementation HSRatingTableCell
@synthesize rating = _rating;
@synthesize textViewTotalRating = _textViewTotalRating;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
