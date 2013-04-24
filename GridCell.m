//
//  GridCell.m
//  Sample Grid
//
//  Created by Madan Parameswaran on 24/04/13.
//  Copyright (c) 2013 MobileBrigade. All rights reserved.
//

#import "GridCell.h"

@implementation GridCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(GridCell *)cellFromNib:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle]loadNibNamed:nibName owner:self options:nil];
    NSObject *cell = nil;
    GridCell *gridCell = nil;
    for (cell in nibContents) {
        if ([cell isKindOfClass:[GridCell class]]) {
            gridCell = (GridCell *)cell;
            break;
        }

    }
    return gridCell;
}

- (IBAction)itemOneTapped:(id)sender {
    [[self delegate]itemTapped:sender];
}

- (IBAction)itemTwoTapped:(id)sender {
     [[self delegate]itemTapped:sender];
}
- (IBAction)itemThreeTapped:(id)sender {
     [[self delegate]itemTapped:sender];
}

@end
