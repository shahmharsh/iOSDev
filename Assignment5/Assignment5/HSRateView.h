//
//  HSRateView.h
//  Assignment5
//
//  Created by Harsh Shah on 11/14/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HSRateView;

@protocol HSRateViewDelegate
- (void)rateView:(HSRateView *)rateView ratingDidChange:(float)rating;
@end

@interface HSRateView : UIView

@property (strong, nonatomic) UIImage *notSelectedImage;
@property (strong, nonatomic) UIImage *fullSelectedImage;
@property (strong, nonatomic) UIImage *halfSelectedImage;
@property (nonatomic) float rating;
@property BOOL editable;
@property (strong) NSMutableArray * imageViews;
@property (nonatomic) int maxRating;
@property int midMargin;
@property int leftMargin;
@property CGSize minImageSize;
@property id <HSRateViewDelegate> delegate;

@end




// Reference: http://www.raywenderlich.com/1768/uiview-tutorial-for-ios-how-to-make-a-custom-uiview-in-ios-5-a-5-star-rating-view