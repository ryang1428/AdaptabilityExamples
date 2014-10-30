//
//  AutoLayoutCell.m
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 10/28/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import "AutoLayoutCell.h"

@implementation AutoLayoutCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lblTitle = [UILabel new];
        self.lblText = [UILabel new];
        self.lblText2 = [UILabel new];
        self.imgView = [UIImageView new];

        self.lblText.numberOfLines = 0;
        self.lblText2.numberOfLines = 0;
        
        self.imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.lblTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17.0f]];
        [self.lblText setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
        [self.lblText2 setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
        
        [self.lblTitle setTextAlignment:NSTextAlignmentCenter];

        [self.contentView addSubview:self.lblTitle];
        [self.contentView addSubview:self.lblText];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.lblText2];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblText.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblText2.translatesAutoresizingMaskIntoConstraints = NO;
    self.imgView.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *views = @{@"title":self.lblTitle, @"text1":self.lblText, @"text2":self.lblText2, @"img":self.imgView};

    //'-' default spacing is 8 inbetween sibling views, 20 between superviews & siblings
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[title]-8-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[text1]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[text2]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[img]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[title]-[text1]-[text2]-[img]-|" options:0 metrics:nil views:views]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//http://lorempixel.com/400/200
    // Configure the view for the selected state
}

@end
