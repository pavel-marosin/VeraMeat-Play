//
//  VMGridViewCell.m
//  VeraMeat Play
//
//  Created by Ryan Gordon on 8/24/14.
//  Copyright (c) 2014 VeraMeat. All rights reserved.
//

#import "VMGridViewCell.h"

@implementation VMGridViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frontShown = NO;
        self.canFlip = YES;
    }
    return self;
}

-(void) flip {
    UIView* from;
    UIView* to;
    
    self.canFlip = NO;
    if (!self.frontShown) {
        from = self.backView;
        to = self.frontView;
    } else {
        from = self.frontView;
        to = self.backView;
    }
    
    [UIView transitionFromView:from
                        toView:to
                      duration:.5f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:^(BOOL finished) {self.canFlip = YES;}];
    
    self.frontShown = !self.frontShown;
}

@end
