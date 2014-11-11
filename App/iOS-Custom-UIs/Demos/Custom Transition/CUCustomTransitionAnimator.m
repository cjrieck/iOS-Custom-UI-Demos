//
//  CUCustomTransitionAnimator.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomTransitionAnimator.h"

@interface CUCustomTransitionAnimator ()

@end

@implementation CUCustomTransitionAnimator

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
    toViewController.view.alpha = 0.0f;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromViewController.view.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
                         toViewController.view.alpha = 1.0f;
                     }
                     completion:^(BOOL finished){
                         fromViewController.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end