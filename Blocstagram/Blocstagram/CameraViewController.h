//
//  CameraViewController.h
//  Blocstagram
//
//  Created by Joshua on 10/3/15.
//  Copyright © 2015 Joshua Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraViewController;

@protocol CameraViewControllerDelegate <NSObject>

- (void) cameraViewController:(CameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image;

@end

@interface CameraViewController : UIViewController

@property (nonatomic, weak) NSObject <CameraViewControllerDelegate> *delegate;

@end
