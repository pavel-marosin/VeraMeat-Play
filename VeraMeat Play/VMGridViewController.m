//
//  VMGridViewController.m
//  VeraMeat Play
//
//  Created by Ryan Gordon on 8/24/14.
//  Copyright (c) 2014 VeraMeat. All rights reserved.
//

#import "VMGridViewController.h"
#import "VMGridViewCell.h"

#define INVALID_POSITION -1

@interface VMGridViewController ()

@end

@implementation VMGridViewController
NSString *const DogBacks = @"back_card_dog";
NSString *const CatBacks = @"back_card_cat";
NSString *const ManBacks = @"back_card_man1";
NSString *const WomanBacks = @"back_card_man2";

NSString *const DogPrefix = @"dog_";
NSString *const CatPrefix = @"cat_";
NSString *const WomanPrefix = @"power_animal_";
NSString *const ManPrefix = @"man_";

NSInteger const dogCount = 25;
NSInteger const catCount = 25;
NSInteger const manCount = 13;
NSInteger const womanCount = 18;

NSInteger const cardCount = 12;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initCards];
}

- (void)initCards {
    self.flippedPosition1 = INVALID_POSITION;
    self.flippedPosition2 = INVALID_POSITION;
    NSMutableSet *cardSet = [[NSMutableSet alloc] init];
    NSMutableSet *positionSet = [[NSMutableSet alloc] init];
    
    srand ( time(NULL) );
    
    self.collectionView.delegate = self;
    self.cardLocations = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < cardCount; i++) {
        [self.cardLocations addObject:[NSNumber numberWithInt:0]];
    }
    
    while (cardSet.count < cardCount / 2) {
        NSInteger card = rand() % dogCount + 1;
        [cardSet addObject: [NSNumber numberWithInteger:card]];
    }
    int cardIndex = 0;
    NSArray *cardValues = cardSet.allObjects;
    while (positionSet.count < cardCount) {
        NSInteger position = rand() % cardCount;
        NSNumber *positionNum = [NSNumber numberWithInt:position];
        if (![positionSet containsObject:positionNum]) {
            [positionSet addObject: [NSNumber numberWithInteger:position]];
            [self.cardLocations replaceObjectAtIndex:position withObject:cardValues[cardIndex / 2]];
            cardIndex++;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return cardCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VMGridViewCell *cell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"Cell"
                                    forIndexPath:indexPath];
    
    cell.backView.image = [self getBackView];
    cell.frontView.image = [self getFrontView:indexPath.item];
//    [cell.frontView setHidden:YES];
    
    return cell;
}

-(UIImage*)getBackView {
    return [UIImage imageNamed:DogBacks];
}

-(UIImage*)getFrontView: (NSInteger)position {
    NSMutableString *file = [DogPrefix mutableCopy];
    NSNumber *postfix = self.cardLocations[position];
    [file appendFormat:@"%d", [postfix intValue]];
    return [UIImage imageNamed:file];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    VMGridViewCell *cell =  (VMGridViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [cell flip];
}

@end
