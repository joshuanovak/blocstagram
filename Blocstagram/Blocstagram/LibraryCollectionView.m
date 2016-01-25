//
//  LibraryCollectionView.m
//  Blocstagram
//
//  Created by Joshua on 1/23/16.
//  Copyright © 2016 Joshua Novak. All rights reserved.
//

#import "LibraryCollectionView.h"

@implementation LibraryCollectionView

- (UICollectionViewCell *)libraryCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    collectionView = [libraryCollectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[self.contentView viewWithTag:imageView];
    
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
        imageView.tag = imageViewTag;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [cell.contentView addSubview:imageView];

}


@end
