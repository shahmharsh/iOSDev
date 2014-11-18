//
//  UIView+AlertAnimations.m
//  Assignment5
//
//  Created by Harsh Shah on 11/17/14.
//  Copyright (c) 2014 Harsh Shah. All rights reserved.
//

#import "UIView+AlertAnimations.h"
#import <QuartzCore/QuartzCore.h>

#define kAnimationDuration  0.2555

@implementation UIView(AlertAnimations)
- (void)doPopInAnimation {
    CALayer *viewLayer = self.layer;
    CAKeyframeAnimation* popInAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    popInAnimation.duration = kAnimationDuration;
    popInAnimation.values = [NSArray arrayWithObjects:
                             [NSNumber numberWithFloat:0.6],
                             [NSNumber numberWithFloat:1.1],
                             [NSNumber numberWithFloat:.9],
                             [NSNumber numberWithFloat:1],
                             nil];
    popInAnimation.keyTimes = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0],
                               [NSNumber numberWithFloat:0.6],
                               [NSNumber numberWithFloat:0.8],
                               [NSNumber numberWithFloat:1.0],
                               nil];
    popInAnimation.delegate = nil;
    
    [viewLayer addAnimation:popInAnimation forKey:@"transform.scale"];
}

- (void)doFadeInAnimation {
    CALayer *viewLayer = self.layer;
    CABasicAnimation *fadeInAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeInAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    fadeInAnimation.toValue = [NSNumber numberWithFloat:1.0];
    fadeInAnimation.duration = kAnimationDuration;
    fadeInAnimation.delegate = nil;
    [viewLayer addAnimation:fadeInAnimation forKey:@"opacity"];
}
@end
