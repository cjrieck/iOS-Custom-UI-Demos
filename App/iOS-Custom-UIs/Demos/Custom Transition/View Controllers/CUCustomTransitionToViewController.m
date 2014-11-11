//
//  CUCustomTransitionToViewController.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CUCustomTransitionToViewController.h"

@implementation CUCustomTransitionToViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor colorWithWhite:0.859 alpha:1.000];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.delegate = nil;
    [super viewWillDisappear:animated];
}

@end
