//
//  LibraryCollectionView.h
//  Blocstagram
//
//  Created by Joshua on 1/23/16.
//  Copyright © 2016 Joshua Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryCollectionView : UICollectionViewCell

- (UICollectionViewCell *)libraryCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UICollectionViewCell *)layoutImageView:(UICollectionView *)collectionView


@end
