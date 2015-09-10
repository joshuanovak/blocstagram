//
//  Comment.m
//  Blocstagram
//
//  Created by Joshua on 8/20/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import "Comment.h"
#import "User.h"

@implementation Comment

- (instancetype) initWithDictionary:(NSDictionary *)commentDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = commentDictionary[@"id"];
        self.text = commentDictionary[@"text"];
        self.from = [[User alloc] initWithDictionary:commentDictionary[@"from"]];
        //how does this work ^^^
    }
    return self;
}



@end
