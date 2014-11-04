//
//  AutoLayoutCollectCell.m
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 11/3/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import "AutoLayoutCollectCell.h"

@interface AutoLayoutCollectCell ()


@end

@implementation AutoLayoutCollectCell


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.63 green:0.8 blue:0.35 alpha:1];
    
    self.infoView = [UIScrollView new];
    self.infoView.backgroundColor = [UIColor lightGrayColor];
    self.infoView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.infoView];
    
    NSDictionary *views = @{@"info":self.infoView};

    //horizontal
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[info]|" options:0 metrics:nil views:views]];

    //vertical
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[info(65)]|" options:0 metrics:nil views:views]];
    
    [self layoutInfoSubview];
    [self layoutHeartButton];
}

- (void)layoutInfoSubview {
    self.lblName = [UILabel new];
    self.lblName.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblName.backgroundColor = [UIColor greenColor];
    self.lblName.text = @"Hipster Fanny Pack";
    
    self.lblPrice = [UILabel new];
    self.lblPrice.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblPrice.backgroundColor = [UIColor orangeColor];
    self.lblPrice.text = @"$123.00";
    
    [self.infoView addSubview:self.lblName];
    [self.infoView addSubview:self.lblPrice];

    NSDictionary *views = @{@"name":self.lblName, @"price":self.lblPrice};
    
    //horizontal
    [self.infoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[name]" options:0 metrics:nil views:views]];
    [self.infoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[price]" options:0 metrics:nil views:views]];

    //vertical
    [self.infoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[name]-[price]-|" options:0 metrics:nil views:views]];
    
    //add swatches to info scroll view
    UIView *lastSwatch;
    NSDictionary *metrics = @{@"swatchWidth":@(50.f)};
    
    for(int i = 1; i <= 10; i++) {
        UIView *swatch = [UIView new];
        swatch.translatesAutoresizingMaskIntoConstraints = NO;
        [swatch setBackgroundColor:[UIColor redColor]];
        [self.infoView addSubview:swatch];
        
        //first swatch
        if(i == 1) {
            NSDictionary *views2 = @{@"name":self.lblName, @"price":self.lblPrice, @"swatch":swatch};
            [self.infoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[name]-[swatch(swatchWidth)]" options:0 metrics:metrics views:views2]];
        }
        //middle swatches
        else {
            [self.infoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lastSwatch]-[swatch(swatchWidth)]" options:0 metrics:metrics views:NSDictionaryOfVariableBindings(lastSwatch, swatch)]];
        }
        
        //all have the same vertical constraints
        [self.infoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[swatch]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(swatch)]];
        lastSwatch = swatch;
    }
    
    //end swatch. must pin to edge for contentSize to be calcualted
    [self.infoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lastSwatch]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lastSwatch)]];
}

- (void)layoutHeartButton {
    
    //** cannot get a uibutton onto the view without the app freezing.. UIView works fine but UIButton is having issues for some reason
    //self.btnHeart = [UIButton new];
    //[self.btnHeart setTitle:@"Heart" forState:UIControlStateNormal];

    UIView *vw = [UIView new];
    [vw setBackgroundColor:[UIColor blueColor]];
    vw.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:vw];
    
    NSDictionary *views = @{@"heart":vw};
    
    //horizontal
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[heart(65)]-|" options:0 metrics:nil views:views]];
    
    //vertical
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[heart(20)]" options:0 metrics:nil views:views]];
}

@end
