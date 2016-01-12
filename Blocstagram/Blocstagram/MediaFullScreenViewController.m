//
//  MediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Joshua on 9/15/15.
//  Copyright (c) 2015 Joshua Novak. All rights reserved.
//

#import "MediaFullScreenViewController.h"
#import "Media.h"
#import "MediaTableViewCell.h"
//#import "ImagesTableViewController.m"

@interface MediaFullScreenViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;

@property (nonatomic, strong) UITapGestureRecognizer *borderDismiss;

@end

@implementation MediaFullScreenViewController

- (instancetype) initWithMedia:(Media *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.media.image.size;
    
    
    //is something like this right??
//    UIView *backgroundView = [[UIWindow alloc] initWithFrame:self.view.bounds];
//    backgroundView.backgroundColor = [UIColor blackColor];
//    backgroundView.opaque = NO;
//    [self.view addSubview:backgroundView];
//    
//    self.borderDismiss = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
//    self.borderDismiss.numberOfTapsRequired = 1;
//    [backgroundView addGestureRecognizer:self.borderDismiss];
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
    
    [self.tap requireGestureRecognizerToFail:self.doubleTap];
    
    [self.scrollView addGestureRecognizer:self.tap];
    [self.scrollView addGestureRecognizer:self.doubleTap];
    //[self.fullWindow addGestureRecognizer:self.borderDismiss];

    self.buttonView = [UIImageView new];
    [self.view addSubview:self.buttonView];
    
    
    [self addButtonToScrollView];
}

- (void) addButtonToScrollView {
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect buttonFrame = CGRectMake(self.view.frame.size.width-80.0f, 20.0f, 80.0f, 40.0f);
    
    [shareButton setFrame:buttonFrame];
    [shareButton addTarget:self action:@selector(shareButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [shareButton setTitle:@"Share" forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    
    [self.scrollView addSubview:shareButton];
}


- (IBAction)shareButtonPressed:(id)sender {
    NSMutableArray *itemsToShare = [NSMutableArray array];
    [itemsToShare addObject:self.media.image];
        
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.scrollView.frame = self.view.bounds;
    
    [self recalculateZoomScale];
    
//    CGSize scrollViewFrameSize = self.scrollView.frame.size;
//    CGSize scrollViewContentSize = self.scrollView.contentSize;
//    
//    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
//    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
//    CGFloat minScale = MIN(scaleWidth, scaleHeight);
//    
//    self.scrollView.minimumZoomScale = minScale;
//    self.scrollView.maximumZoomScale = 1;
}

- (void) recalculateZoomScale
{
    CGSize scrollViewFrameSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;

    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    self.scrollView.zoomScale = minScale;
    
    scrollViewContentSize.height *= self.scrollView.zoomScale;
    scrollViewContentSize.width *= self.scrollView.zoomScale;
    
    self.scrollView.contentSize = scrollViewContentSize;
    self.scrollView.bounds = CGRectMake(self.scrollView.frame.origin.x,self.scrollView.frame.origin.y,scrollViewContentSize.width,scrollViewContentSize.height);
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self centerScrollView];
}

- (void)centerScrollView {
    [self.imageView sizeToFit];
    
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
    }else {
        contentsFrame.origin.x = 0;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
    }else {
        contentsFrame.origin.y = 0;
    }
    
    self.imageView.frame = contentsFrame;
}

#pragma mark - UIScrollViewDelegate

- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollView];
}

#pragma mark - Gesture Recognizers

- (void) tapFired:(UIGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doubleTapFired:(UITapGestureRecognizer *)sender {
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        CGPoint locationPoint = [sender locationInView:self.imageView];
        
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x = (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
    }else {
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
}

//- (void) tapFired: (UIGestureRecognizer *)sender{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}









@end
