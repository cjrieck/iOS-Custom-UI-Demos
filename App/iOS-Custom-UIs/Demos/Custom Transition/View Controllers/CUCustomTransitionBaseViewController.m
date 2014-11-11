//
//  CUCustomTransitionBaseViewController.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomTransitionBaseViewController.h"
#import "CUCustomTransitionToViewController.h"
#import "CUCustomTransitionNavigationControllerDelegate.h"
#import "CUCustomTransitionAnimator.h"

static NSString * const kCUCustomPushTransitionButtonTitle = @"Push";

@interface CUCustomTransitionBaseViewController ()

@property (strong, nonatomic) id<UINavigationControllerDelegate> navControllerDelegate;

@end

@implementation CUCustomTransitionBaseViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pushViewControllerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [pushViewControllerButton setTitle:kCUCustomPushTransitionButtonTitle forState:UIControlStateNormal];
    [pushViewControllerButton setTitleColor:[UIColor colorWithRed:0.000 green:0.570 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    pushViewControllerButton.center = self.view.center;
    [pushViewControllerButton addTarget:self action:@selector(pushCustomAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushViewControllerButton];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navControllerDelegate = [[CUCustomTransitionNavigationControllerDelegate alloc] initWithNavigationController:self.navigationController];
    self.navigationController.delegate = self.navControllerDelegate;
}

- (void)pushCustomAnimation
{
    CUCustomTransitionToViewController *toViewController = [[CUCustomTransitionToViewController alloc] init];
    [self.navigationController pushViewController:toViewController animated:YES];
}

@end
