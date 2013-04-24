//
//  ViewController.m
//  Sample Grid
//
//  Created by Madan Parameswaran on 24/04/13.
//  Copyright (c) 2013 MobileBrigade. All rights reserved.
//

#import "ViewController.h"
#import "GridCell.h"
@interface ViewController ()
{
    IBOutlet UITableView *table;
    NSMutableArray *data;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [table setDelegate:self];
    [table setDataSource:self];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    data = [NSMutableArray arrayWithCapacity:36];
    for (int i = 0; i < 36; i ++) {
        [data addObject:[NSString stringWithFormat:@"Item %d",i+1]];
    }
   
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GridCell";
    GridCell *cell = (GridCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [GridCell cellFromNib:CellIdentifier];
        [cell setDelegate:self];
    }
    
    [[cell item1]setTitle:[data objectAtIndex:indexPath.row*3] forState:UIControlStateNormal];
    [[cell item2]setTitle:[data objectAtIndex:indexPath.row*3+1] forState:UIControlStateNormal];
    [[cell item3]setTitle:[data objectAtIndex:indexPath.row*3+2] forState:UIControlStateNormal];

    
    return cell;
}

-(void)itemTapped:(id)sender
{
    NSLog(@"Tapped %@", [(UIButton *)sender titleForState:UIControlStateNormal]);
    NSString *title = [(UIButton *)sender titleForState:UIControlStateNormal];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Grid View" message:[NSString stringWithFormat:@"You selected %@", title]delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
