//
//  Comment.h
//  Blocstagram
//
//  Created by Joshua on 8/20/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;

@end
