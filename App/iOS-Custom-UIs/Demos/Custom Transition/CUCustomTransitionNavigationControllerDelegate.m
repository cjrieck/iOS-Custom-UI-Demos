//
//  CUCustomTransitionNavigationControllerDelegate.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomTransitionNavigationControllerDelegate.h"
#import "CUCustomPopTransitionAnimator.h"
#import "CUCustomPushTransitionAnimator.h"

@interface CUCustomTransitionNavigationControllerDelegate ()

/**
 *  A weak reference to the navigation controller this delegate is attached to. We use this to reference properties necessary for the animations
 */
@property (weak, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) CUCustomPushTransitionAnimator *pushTransitionAnimator;
@property (strong, nonatomic) CUCustomPopTransitionAnimator *popTransitionAnimator;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation CUCustomTransitionNavigationControllerDelegate

- (instancetype)initWithNavigationController:(UINavigationController *)navController {
    self = [super init];
    if ( self ) {
        _navigationController = navController;
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [_navigationController.view addGestureRecognizer:panGesture];
        
        _pushTransitionAnimator = [[CUCustomPushTransitionAnimator alloc] init];
        _popTransitionAnimator = [[CUCustomPopTransitionAnimator alloc] init];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)panGestureRecongnizer
{
    UIView *interactionView = self.navigationController.view;
    switch (panGestureRecongnizer.state) {
        case UIGestureRecognizerStateBegan: {
            CGPoint fingerLocation = [panGestureRecongnizer locationInView:interactionView];
            
            if ( fingerLocation.x < CGRectGetMidX(interactionView.bounds) && self.navigationController.viewControllers.count >= 3 ) {
                self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
                [self.navigationController popViewControllerAnimated:YES];
            }
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            CGPoint point = [panGestureRecongnizer translationInView:interactionView];
            CGFloat translationX = fabs(point.x / CGRectGetWidth(interactionView.frame));
            
            // The interactiveTransition works with the custom pop animation we have out of the box, and since we use a UIView animation the interactiveTransition controls the progress for us too!
            [self.interactiveTransition updateInteractiveTransition:translationX];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled: {
            CGFloat longitudinalVelocity = [panGestureRecongnizer velocityInView:interactionView].x;
            CGFloat translationX = [panGestureRecongnizer translationInView:interactionView].x;
            if ( longitudinalVelocity > 0.2f && translationX > CGRectGetWidth(interactionView.bounds) / 4.0f ) {
                [self.interactiveTransition finishInteractiveTransition];
            }
            else {
                [self.interactiveTransition cancelInteractiveTransition];
            }
            
            self.interactiveTransition = nil;
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - UINavigationController delegate

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

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactiveTransition;
}

@end
