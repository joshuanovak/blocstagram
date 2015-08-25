//
//  MediaTableViewCell.h
//  Blocstagram
//
//  Created by Joshua on 8/24/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaTableViewCell : UITableViewCell

@property (nonatomic, strong) Media *mediaItem;

// HIDDEN METHODS
//get media item
//- (Media *)mediaItem;
//
//set new media item
//- (void)setMediaItem:(Media *)mediaItem;

+ (CGFloat) heightForMediaItem:(Media *)mediaItem width:(CGFloat)width;

@end
