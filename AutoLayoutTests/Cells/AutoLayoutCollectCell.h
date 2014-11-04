//
//  AutoLayoutCollectCell.h
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 11/3/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoLayoutCollectCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *lblName;
@property (nonatomic, strong) UILabel *lblPrice;
@property (nonatomic, strong) UIScrollView *infoView;

@property (nonatomic, strong) UIButton *btnHeart;


@end
