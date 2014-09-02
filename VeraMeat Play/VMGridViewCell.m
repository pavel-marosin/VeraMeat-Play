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
        // Initialization code
    }
    return self;
}

-(void) flip {
    UIView* from;
    UIView* to;
    
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
                    completion:^(BOOL finished) {}];
    
    self.frontShown = !self.frontShown;
}

@end
