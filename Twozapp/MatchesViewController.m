//
//  MatchesViewController.m
//  Twozapp
//
//  Created by Priya on 10/01/16.
//  Copyright © 2016 Priya. All rights reserved.
//

#import "MatchesViewController.h"

@interface MatchesViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation MatchesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *imgViewProfile = (UIImageView *)[cell viewWithTag:10];
    imgViewProfile.layer.cornerRadius = 5.0;
    [imgViewProfile.layer setMasksToBounds:YES];
    
    UIView *viewName = (UIView *)[cell viewWithTag:30];
    viewName.layer.cornerRadius = 5.0;
    [viewName.layer setMasksToBounds:YES];
    
    UIImageView *imgOnline = (UIImageView *)[cell viewWithTag:20];
    imgOnline.layer.cornerRadius = 5.0;
    [imgOnline.layer setMasksToBounds:YES];
    
        return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
        CGFloat side = collectionView.frame.size.width/2-10;
        return CGSizeMake(side, side);
}
@end
