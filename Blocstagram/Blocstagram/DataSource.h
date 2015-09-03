//
//  DataSource.h
//  Blocstagram
//
//  Created by Joshua on 8/20/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

typedef void (^NewItemCompletionBloc)(NSError *error);

@interface DataSource : NSObject

+(instancetype) sharedInstance;

@property (nonatomic, strong, readonly) NSMutableArray *mediaItems;
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, assign) BOOL isLoadingOlderItems;

- (void) deleteMediaItem:(Media *)item;
- (void) removeObjectFromMediaItemsAtIndex:(NSUInteger)index;

- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBloc)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBloc)completionHandler;

@end
