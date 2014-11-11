//
//  CUCustomTransitionNavigationControllerDelegate.h
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/11/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

@interface CUCustomTransitionNavigationControllerDelegate : NSObject <UINavigationControllerDelegate>

- (instancetype)initWithNavigationController:(UINavigationController *)navController;

@end

@interface CUCustomTransitionNavigationControllerDelegate (CUUnavailable)

- (instancetype)init __attribute__((unavailable("Use initWithNavigationController:")));

@end
