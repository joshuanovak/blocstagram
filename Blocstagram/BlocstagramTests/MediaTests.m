//
//  MediaTests.m
//  Blocstagram
//
//  Created by Joshua on 1/17/16.
//  Copyright © 2016 Joshua Novak. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Media.h"
//#import "Media.m"
#import "User.h"

@interface MediaTests : XCTestCase

@end

@implementation MediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializationWorks
{
    NSDictionary *user = @{@"username": @"novakjoshua",
                                     @"full_name": @"Joshua Novak",
                                     @"id": @"3",
                                     @"profile_picture": @"http://www.pic.com"};
    
    NSDictionary *mediaDictionary = @{@"type": @"image",
                                      //@"users_in_photo": @"user",
                                      @"caption": @"null",
                                      //@"comments": @"commentsDictionary"
                                      @"filter": @"waldon"};
    
    Media *testMedia = [[Media alloc] initWithDictionary:mediaDictionary];
    
    
    XCTAssertEqualObjects(testMedia.idNumber, mediaDictionary[@"id"], @"The ID number should be equal");
    //XCTAssertEqualObjects(testMedia.user, mediaDictionary[@"user"], @"The user shoudld be equal");
    XCTAssertEqualObjects(testMedia.image, [NSURL URLWithString:mediaDictionary[@"image"]], @"The image should be equal");
    //How do we check the user dictionary or other dictionaries that are declared in the JSON?
    
}

- (void) testComposeCommentView
{
    
}

- (void) testMediaTableViewHeight {
    
}



@end









