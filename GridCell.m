//
//  GridCell.m
//  Sample Grid
//
//  Created by Aravind Ramalingam on 24/04/13.
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

@end
