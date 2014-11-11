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
    
    const CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    UILabel *helloLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 100.0f)];
    helloLabel.center = self.view.center;
    helloLabel.textAlignment = NSTextAlignmentCenter;
    helloLabel.lineBreakMode = NSLineBreakByWordWrapping;
    helloLabel.text = @"Hi there. Try panning to the right";
    [self.view addSubview:helloLabel];
}

@end
