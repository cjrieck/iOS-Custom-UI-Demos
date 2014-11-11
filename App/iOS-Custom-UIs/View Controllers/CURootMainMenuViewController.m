//
//  ViewController.m
//  iOS-Custom-UIs
//
//  Created by Clayton Rieck on 11/10/14.
//  Copyright (c) 2014 Clayton Rieck. All rights reserved.
//

#import "CURootMainMenuViewController.h"

// ----- VIEW CONTROLLERS -----
#import "CUCustomTransitionBaseViewController.h"

static NSString * const kCURootViewControllerTitle = @"Demos";

@interface CURootMainMenuViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *rootTableView;
@property (strong, nonatomic) NSArray *demoTitles;

@end

@implementation CURootMainMenuViewController

- (instancetype)init {
    self = [super init];
    if ( self ) {
        _demoTitles = @[@"Custom Transition"];
        
        self.title = kCURootViewControllerTitle;
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.autoresizesSubviews = YES;
    
    UITableView *rootTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    rootTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    rootTableView.delegate = self;
    rootTableView.dataSource = self;
    [self.view addSubview:rootTableView];
    _rootTableView = rootTableView;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.delegate = nil;
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *demoViewController;
    switch (indexPath.row) {
        case 0:
            demoViewController = [[CUCustomTransitionBaseViewController alloc] init];
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:demoViewController animated:YES];
}

#pragma mark - UITableView datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [self.demoTitles objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
