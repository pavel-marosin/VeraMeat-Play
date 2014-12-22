//
//  VMGridViewCell.h
//  VeraMeat Play
//
//  Created by Ryan Gordon on 8/24/14.
//  Copyright (c) 2014 VeraMeat. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface VMGridViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *backView;
@property (strong, nonatomic) IBOutlet UIImageView *frontView;
@property (atomic) BOOL frontShown;
@property (atomic) BOOL canFlip;
-(void)flip;
@end
