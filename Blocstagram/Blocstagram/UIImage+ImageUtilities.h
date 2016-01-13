//
//  UIImage+ImageUtilities.h
//  Blocstagram
//
//  Created by Joshua on 10/3/15.
//  Copyright © 2015 Joshua Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtilities)

- (UIImage *) imageWithFixedOrientation;
//- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize)size;
//- (UIImage *) imageCroppedToRect:(CGRect)cropRect;
- (UIImage *) imageByScalingToSize:(CGSize)size andCroppingWithRect:(CGRect)rect;

@end
