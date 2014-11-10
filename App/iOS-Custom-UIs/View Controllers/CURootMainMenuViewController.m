//
//  ViewController.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/10/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CURootMainMenuViewController.h"

@interface CURootMainMenuViewController ()

@end

@implementation CURootMainMenuViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
