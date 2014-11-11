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
    toViewController.view.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toViewController.view.transform = CGAffineTransformIdentity;
                         fromViewController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(fromViewController.view.frame), 0.0f);
                     }
                     completion:^(BOOL finished){
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
