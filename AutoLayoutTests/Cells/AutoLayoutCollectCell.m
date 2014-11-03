//
//  AutoLayoutCollectCell.m
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 11/3/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import "AutoLayoutCollectCell.h"

@implementation AutoLayoutCollectCell


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.63 green:0.8 blue:0.35 alpha:1];
}

@end
