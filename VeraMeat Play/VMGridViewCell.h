//
//  VMGridViewCell.h
//  VeraMeat Play
//
//  Created by Pavel Marosin on 12/21/14.
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
