//
//  CUCustomPopTransitionAnimator.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomPopTransitionAnimator.h"

@implementation CUCustomPopTransitionAnimator

#pragma mark - UIViewControllerAnimatedTransitioning protocol

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    [[transitionContext containerView] addSubview:fromViewController.view];
    toViewController.view.alpha = 0.7f;
    toViewController.view.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0f
         usingSpringWithDamping:0.9f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toViewController.view.alpha = 1.0f;
                         toViewController.view.transform = CGAffineTransformIdentity;
                         fromViewController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(fromViewController.view.frame), 0.0f);
                     }
                     completion:^(BOOL finished){
                         toViewController.view.transform = CGAffineTransformIdentity; // we always need to reset the view's transform because we scale it down every time the animation starts whether or not it was previoulsy cancelled or succeeded
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         
                     }];
}

@end
