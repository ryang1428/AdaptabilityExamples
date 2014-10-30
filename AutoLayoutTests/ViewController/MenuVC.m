//
//  MenuVC.m
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 10/27/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import "MenuVC.h"
#import "ScrollViewExampleVC.h"
#import "TableViewExampleVC.h"
#import "SizeClassExampleVC.h"
#import <QuartzCore/QuartzCore.h>

@interface MenuVC ()

@end

@implementation MenuVC

- (void) loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Adaptability Examples";
    
    UIColor *buttonColor = [UIColor colorWithRed:0.89 green:0.27 blue:0.27 alpha:1];
    
    UIButton *btnScrollViewExample = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnScrollViewExample setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnScrollViewExample setBackgroundColor:buttonColor];
    [btnScrollViewExample setTitle:@"Scroll View" forState:UIControlStateNormal];
    [btnScrollViewExample addTarget:self action:@selector(btnScrollViewExampleTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnTableViewExample = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTableViewExample setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnTableViewExample setBackgroundColor:buttonColor];
    [btnTableViewExample setTitle:@"Dynamic Table Cells" forState:UIControlStateNormal];
    [btnTableViewExample addTarget:self action:@selector(btnTableViewExampleTouch:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *btnSizeClassesExample = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSizeClassesExample setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnSizeClassesExample setBackgroundColor:buttonColor];
    [btnSizeClassesExample setTitle:@"Size Classes" forState:UIControlStateNormal];
    [btnSizeClassesExample addTarget:self action:@selector(btnSizeClassesExampleTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    [self roundButtonCorners:btnScrollViewExample];
    [self roundButtonCorners:btnTableViewExample];
    [self roundButtonCorners:btnSizeClassesExample];
    
    [self.view addSubview:btnScrollViewExample];
    [self.view addSubview:btnTableViewExample];
    [self.view addSubview:btnSizeClassesExample];

    NSDictionary *views = @{@"btnScroll":btnScrollViewExample, @"btnTable":btnTableViewExample, @"btnSize":btnSizeClassesExample};
    NSDictionary *metrics = @{@"btnWidth":@(44.f), @"btnPadding":@(30.f)};

    //horizontal constraints
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnPadding-[btnScroll]-btnPadding-|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnPadding-[btnTable]-btnPadding-|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnPadding-[btnSize]-btnPadding-|" options:0 metrics:metrics views:views]];

    //vertical constraints
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-88-[btnScroll(btnWidth)]-20-[btnTable(==btnScroll)]-20-[btnSize(==btnScroll)]" options:0 metrics:metrics views:views]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)roundButtonCorners:(UIButton *)btn {
    btn.layer.cornerRadius = 5.f;
}

- (IBAction)btnScrollViewExampleTouch:(id)sender {
    ScrollViewExampleVC *vc = [[ScrollViewExampleVC alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btnTableViewExampleTouch:(id)sender {
    TableViewExampleVC *vc = [[TableViewExampleVC alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btnSizeClassesExampleTouch:(id)sender {
    SizeClassExampleVC *vc = [[SizeClassExampleVC alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
