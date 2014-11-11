//
//  CUCustomTransitionNavigationControllerDelegate.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomTransitionNavigationControllerDelegate.h"
#import "CUCustomPopTransitionAnimator.h"
#import "CUCustomTransitionAnimator.h"

@interface CUCustomTransitionNavigationControllerDelegate ()

@property (strong, nonatomic) CUCustomTransitionAnimator *pushTransitionAnimator;
@property (strong, nonatomic) CUCustomPopTransitionAnimator *popTransitionAnimator;

@end

@implementation CUCustomTransitionNavigationControllerDelegate

- (instancetype)init {
    self = [super init];
    if ( self ) {
        _pushTransitionAnimator = [[CUCustomTransitionAnimator alloc] init];
        _popTransitionAnimator = [[CUCustomPopTransitionAnimator alloc] init];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    switch (operation) {
        case UINavigationControllerOperationPush:
            return self.pushTransitionAnimator;
            
        case UINavigationControllerOperationPop:
            return self.popTransitionAnimator;
            
        default:
            return nil;
    }
}

@end
