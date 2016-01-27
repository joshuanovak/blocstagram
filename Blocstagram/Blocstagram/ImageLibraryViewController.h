//
//  ImageLibraryViewController.h
//  Blocstagram
//
//  Created by Joshua on 12/19/15.
//  Copyright © 2015 Joshua Novak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibraryCollectionViewCell.h"

@class ImageLibraryViewController;

@protocol ImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibraryViewController:(ImageLibraryViewController *)imageLibraryViewController didCompleteWithImage:(UIImage *)image;

@end

@interface ImageLibraryViewController : UICollectionViewController

@property (nonatomic, weak) NSObject <ImageLibraryViewControllerDelegate> *delegate;


@end
