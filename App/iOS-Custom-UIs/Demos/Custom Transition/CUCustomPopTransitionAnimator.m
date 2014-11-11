//
//  CUCustomPopTransitionAnimator.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomPopTransitionAnimator.h"

@implementation CUCustomPopTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:fromViewController.view];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toViewController.view.transform = CGAffineTransformIdentity;
                         fromViewController.view.alpha = 0.0f;
                     }
                     completion:^(BOOL finished){
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
