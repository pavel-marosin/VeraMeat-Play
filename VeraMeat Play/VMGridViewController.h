//
//  VMGridViewController.h
//  VeraMeat Play
//
//  Created by Pavel Marosin on 12/21/14.
//  Copyright (c) 2014 VeraMeat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMGridViewCell.h"
NSMutableArray *cardLocations;
@interface VMGridViewController : UICollectionViewController
@property (nonatomic, retain) NSMutableArray *cardLocations;
@property (atomic) NSInteger flippedPosition1;
@property (atomic) NSInteger flippedPosition2;
@property (nonatomic, retain) VMGridViewCell* flippedCell1;
@end
