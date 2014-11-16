//
//  HSRatingTableCellTableViewCell.h
//  Assignment5
//
//  Created by Harsh Shah on 11/16/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSRateView.h"

@interface HSRatingTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet HSRateView *rating;
@property (strong, nonatomic) IBOutlet UILabel *textViewTotalRating;

@end

//Reference: http://www.appcoda.com/customize-table-view-cells-for-uitableview/