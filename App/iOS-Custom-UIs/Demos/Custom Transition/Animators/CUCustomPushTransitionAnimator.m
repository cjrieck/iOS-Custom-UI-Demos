//
//  CUCustomTransitionAnimator.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomPushTransitionAnimator.h"

@implementation CUCustomPushTransitionAnimator

#pragma mark - UIViewControllerAnimatedTransitioning protocol

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:fromViewController.view];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(toViewController.view.frame), 0.0f);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0f
         usingSpringWithDamping:0.9f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromViewController.view.alpha = 0.7f;
                         fromViewController.view.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
                         toViewController.view.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished){
                         fromViewController.view.transform = CGAffineTransformIdentity; // reset the view below so that when the next animation starts the setup will look correct (it'll be scaled by 0.9)
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
