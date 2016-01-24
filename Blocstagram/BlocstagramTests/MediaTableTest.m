//
//  MediaTableTest.m
//  Blocstagram
//
//  Created by Joshua on 1/23/16.
//  Copyright © 2016 Joshua Novak. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MediaTableViewCell.h"
#import "Media.h"

@interface MediaTableTest : XCTestCase

@end

@implementation MediaTableTest

static UIImage *someImage1 = nil;
static UIImage *someImage2 = nil;


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testImageHeight
{
    NSDictionary *mediaDictionary = @{@"id": @"838921",
                                      @"url": @"1.jpg",
                                      @"caption": @{@"wow look at this": @"this is neat"},
                                      //@"comments": @{@"data": @[someComment]},
                                      //@"user_has_liked": @"YES",
                                      };
    Media *testMedia = [[Media alloc] initWithDictionary:mediaDictionary];
                
    
    
    NSString *firstImage = @"1.jpg";
    someImage1 = [UIImage imageNamed:firstImage];
    CGFloat width1 = someImage1.size.width;
    
    NSString *secondImage = @"1.jpg";
    someImage2 = [UIImage imageNamed:secondImage];
    //CGFloat width2 = someImage2.size.width;
    
    
    MediaTableViewCell *layoutCell = [[MediaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"layoutCell"];
    
//    layoutCell.mediaItem = self.testMedia;
//    
//    layoutCell.frame = CGRectMake(0, 0, width1, CGRectGetHeight(layoutCell.frame));
//    layoutCell.overrideTraitCollection = layoutCell.overrideTraitCollection;
//    
//    [layoutCell setNeedsLayout];
//    [layoutCell layoutIfNeeded];
    
    //Get actual height required for the cell
    //return CGRectGetMaxY(layoutCell.commentView.frame);
    
    
    
    
    XCTAssertEqual(width1, [MediaTableViewCell heightForMediaItem:testMedia width:width1 traitCollection:layoutCell.overrideTraitCollection], @"The widths should be equal");
    

}

/*
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Media *item = [DataSource sharedInstance].mediaItems[indexPath.row];
    
    return [MediaTableViewCell heightForMediaItem:item width:CGRectGetWidth(self.view.frame) traitCollection:self.view.traitCollection];
}
*/
//    layoutCell.mediaItem = self.testMedia;
//
//    layoutCell.frame = CGRectMake(0, 0, width1, CGRectGetHeight(layoutCell.frame));
//    layoutCell.overrideTraitCollection = layoutCell.overrideTraitCollection;
//
//    [layoutCell setNeedsLayout];
//    [layoutCell layoutIfNeeded];

//Get actual height required for the cell
//return CGRectGetMaxY(layoutCell.commentView.frame);









@end
