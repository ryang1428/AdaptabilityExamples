//
//  AutoLayoutCollectCell.m
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 11/3/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import "AutoLayoutCollectCell.h"

@interface AutoLayoutCollectCell ()

@property (nonatomic, strong) UIView *infoView;

@end

@implementation AutoLayoutCollectCell


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.63 green:0.8 blue:0.35 alpha:1];
    
    self.infoView = [UIView new];
    self.infoView.backgroundColor = [UIColor lightGrayColor];
    self.infoView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.infoView];
    
    NSDictionary *views = @{@"info":self.infoView};

    //horizontal
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[info]|" options:0 metrics:nil views:views]];

    //vertical
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[info]|" options:0 metrics:nil views:views]];
    
    [self layoutInfoSubview];
}

- (void)layoutInfoSubview {
    self.nameLabel = [UILabel new];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.text = @"test";
    
    self.priceLabel = [UILabel new];
    self.priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.priceLabel.text = @"123.00";
    
    [self.infoView addSubview:self.nameLabel];
    [self.infoView addSubview:self.priceLabel];

    NSDictionary *views = @{@"name":self.nameLabel, @"price":self.priceLabel};
    
    //horizontal
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[name]|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[price]|" options:0 metrics:nil views:views]];

    //vertical
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[name]-[price]-|" options:0 metrics:nil views:views]];
}

@end
