//
//  ComposeCommentView.h
//  Blocstagram
//
//  Created by Joshua on 9/26/15.
//  Copyright © 2015 Joshua Novak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComposeCommentView;

@protocol ComposeCommentViewDelegate <NSObject>

- (void) commentViewDidPressCommentButton:(ComposeCommentView *)sender;
- (void) commentView:(ComposeCommentView *)sender textDidChange:(NSString *)text;
- (void) commentViewWillStartEditing:(ComposeCommentView *)sender;

@end

@interface ComposeCommentView : UIView

@property (nonatomic, weak) NSObject <ComposeCommentViewDelegate> *delegate;

@property (nonatomic, assign) BOOL isWritingComment;

@property (nonatomic, strong) NSString *text;

- (void) stopComposingComment;

@end