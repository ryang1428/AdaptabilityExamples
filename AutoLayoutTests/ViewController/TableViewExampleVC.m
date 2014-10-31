//
//  TableViewExampleVCTableViewController.m
//  AutoLayoutTests
//
//  Created by Ryan Garchinsky on 10/28/14.
//  Copyright (c) 2014 rgarchinsky. All rights reserved.
//

#import "TableViewExampleVC.h"
#import "AutoLayoutCell.h"
#import "UIImageView+WebCache.h"


@interface TableViewExampleVC ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *dataArray2;
@property (nonatomic, strong) NSMutableArray *imgURLArray;

@end

@implementation TableViewExampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //estimate is the 'placeholder' height.
    self.tableView.estimatedRowHeight = 68.0;
    //by setting this, the cell heights will be determinted as you scroll the tableview based off of the cells auto-layout views & their constraints
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationItem.title = @"Dynamic Cell Heights";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.dataArray = [NSMutableArray new];
    self.dataArray2 = [NSMutableArray new];
    self.imgURLArray = [NSMutableArray new];

    int x = arc4random_uniform(100);
    for(int i = 0; i <= x; i++) {
        [self.dataArray addObject:[self randomLengthString]];
        [self.dataArray2 addObject:[self randomLengthString]];
        
        int rWidth = arc4random_uniform(320);
        [self.imgURLArray addObject:[NSString stringWithFormat:@"http://lorempixel.com/%d/%d/", rWidth, 128]];
    }
    
    //this forces the first visible cells to reload & layout correctly.
    //without it, the cells do not layout correctly until scrolling
    // info here: http://stackoverflow.com/a/17166033/480415
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoLayoutCell *cell = (AutoLayoutCell *)[tableView dequeueReusableCellWithIdentifier:@"AutoCell"];
    if (cell == nil) {
        cell = [[AutoLayoutCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AutoCell"];
    }
    
    cell.lblTitle.text = [NSString stringWithFormat:@"Cell number: %@", @(indexPath.row + 1)];
    cell.lblText.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.lblText2.text = [self.dataArray2 objectAtIndex:indexPath.row];

    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[self.imgURLArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeHolder"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //[cell updateConstraints];
        //[cell setNeedsLayout];
        //playing around with updating the cell height once the image was loaded
        /*
        if([tableView indexPathForCell:cell]) {
            [tableView beginUpdates];
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [tableView endUpdates];
        }*/
    }];
    
    if(indexPath.row % 2 == 0) {
        [cell.contentView setBackgroundColor:[UIColor lightGrayColor]];
    }
    else {
        [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)randomLengthString {
    NSString *str = @"";
    int x = arc4random_uniform(444);
    for (int i = 0; i <= x; i++) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%i", i]];
    }
    return str;
}

@end
