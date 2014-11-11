//
//  CUCustomTransitionBaseViewController.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomTransitionBaseViewController.h"
#import "CUCustomTransitionAnimator.h"

@interface CUCustomTransitionBaseViewController () <UINavigationControllerDelegate>

@property (strong, nonatomic) CUCustomTransitionAnimator *transitionAnimator;

@end

@implementation CUCustomTransitionBaseViewController

- (instancetype)init {
    self = [super init];
    if ( self ) {
        _transitionAnimator = [[CUCustomTransitionAnimator alloc] init];
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if ( operation == UINavigationControllerOperationPush ) {
        return self.transitionAnimator;
    }
    
    return nil;
}

@end
