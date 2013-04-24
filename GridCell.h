//
//  GridCell.h
//  Sample Grid
//
//  Created by Madan Parameswaran on 24/04/13.
//  Copyright (c) 2013 MobileBrigade. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GridCellDelegate <NSObject>

-(void)itemTapped:(id)sender;

@end

@interface GridCell : UITableViewCell
@property(nonatomic) IBOutlet UIButton *item1;
@property(nonatomic) IBOutlet UIButton *item2;
@property(nonatomic) IBOutlet UIButton *item3;
+(GridCell *)cellFromNib:(NSString *)nibName;
@property(nonatomic, weak) id<GridCellDelegate> delegate;
@end
