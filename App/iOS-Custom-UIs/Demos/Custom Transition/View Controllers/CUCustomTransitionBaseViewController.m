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

static NSString * const kCUCustomPushTransitionButtonTitle = @"Push View Controller";

@interface CUCustomTransitionBaseViewController ()

@property (strong, nonatomic) id<UINavigationControllerDelegate> navControllerDelegate;

@end

@implementation CUCustomTransitionBaseViewController

- (instancetype)init {
    self = [super init];
    if ( self ) {
        _navControllerDelegate = [[CUCustomTransitionNavigationControllerDelegate alloc] init];
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pushViewControllerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    pushViewControllerButton.titleLabel.text = kCUCustomPushTransitionButtonTitle;
    pushViewControllerButton.titleLabel.textColor = [UIColor blueColor];
    pushViewControllerButton.backgroundColor = [UIColor blackColor];
    pushViewControllerButton.center = self.view.center;
    [pushViewControllerButton addTarget:self action:@selector(pushCustomAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushViewControllerButton];
}

- (void)viewWillDisappear:(BOOL)animated
{
//    self.navigationController.delegate = nil;
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate = self.navControllerDelegate;
}

- (void)pushCustomAnimation
{
    CUCustomTransitionToViewController *toViewController = [[CUCustomTransitionToViewController alloc] init];
    [self.navigationController pushViewController:toViewController animated:YES];
}

@end
