//
//  DataSource.h
//  Blocstagram
//
//  Created by Joshua on 8/20/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSMutableArray *mediaItems;

- (void) deleteMediaItem:(Media *)item;
- (void) addMediaItemToTop:(Media *)item;
- (void) removeObjectFromMediaItemsAtIndex:(NSUInteger)index;

@end
