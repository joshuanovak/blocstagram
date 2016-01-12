//
//  CropImageViewController.h
//  Blocstagram
//
//  Created by Joshua on 12/19/15.
//  Copyright © 2015 Joshua Novak. All rights reserved.
//

#import "MediaFullScreenViewController.h"

@protocol CropImageViewControllerDelegate <NSObject>

- (void) cropControllerFinishedWithImage: (UIImage *)croppedImage;

@end

@interface CropImageViewController : MediaFullScreenViewController

- (instancetype) initWithImage: (UIImage *)sourceImage;

@property (nonatomic, weak) NSObject <CropImageViewControllerDelegate> *delegate;

@end
