//
//  ViewController.m
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 10/24/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import "ScrollViewExampleVC.h"

@interface ScrollViewExampleVC ()

@end

@implementation ScrollViewExampleVC

- (void) loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Views in ScrollView";
    
    UIScrollView *scrollView = [UIScrollView new];
    [scrollView setBackgroundColor:[UIColor blueColor]];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:scrollView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(scrollView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(scrollView)]];
    
    UIView *view1 = [UIView new];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [view1 setBackgroundColor:[UIColor redColor]];
    [scrollView addSubview:view1];

    UIView *view2 = [UIView new];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    [view2 setBackgroundColor:[UIColor greenColor]];
    [scrollView addSubview:view2];
    
    UIView *view3 = [UIView new];
    view3.translatesAutoresizingMaskIntoConstraints = NO;
    [view3 setBackgroundColor:[UIColor yellowColor]];
    [scrollView addSubview:view3];
    
    NSDictionary *views = @{@"view1":view1, @"view2":view2, @"view3":view3};
    NSDictionary *metrics = @{@"viewWidth":@(320), @"viewHeight":@(250), @"vPad":@(20.f)};

    //must give views a set width-- UIScrollView's do not play well with auto layout
    // More info here: https://developer.apple.com/library/ios/releasenotes/General/RN-iOSSDK-6_0/index.html (search for auto layout)
    
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view1(viewWidth)]|" options:0 metrics:metrics views:views]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view2(viewWidth)]|" options:0 metrics:metrics views:views]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view3(viewWidth)]|" options:0 metrics:metrics views:views]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vPad-[view1(viewHeight)]-vPad-[view2(viewHeight)]-vPad-[view3(viewHeight)]|" options:0 metrics:metrics views:views]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
