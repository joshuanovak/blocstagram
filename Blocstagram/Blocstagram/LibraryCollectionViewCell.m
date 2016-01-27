//
//  LibraryCollectionView.m
//  Blocstagram
//
//  Created by Joshua on 1/23/16.
//  Copyright © 2016 Joshua Novak. All rights reserved.
//

#import "LibraryCollectionViewCell.h"

@implementation LibraryCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
        
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:frame];
        self.imageView.tag = imageViewTag;
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


@end
