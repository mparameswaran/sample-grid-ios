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
    int total;
    BOOL isList;
    IBOutlet UIButton *toggle;

    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    isList = NO;
	// Do any additional setup after loading the view, typically from a nib.
    [table setDelegate:self];
    [table setDataSource:self];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    total = [[[NSBundle mainBundle]objectForInfoDictionaryKey:@"TOTAL_NUMBER_OF_ITEMS"]intValue];
    
    data = [NSMutableArray arrayWithCapacity:total];
    for (int i = 0; i < total; i ++) {
        [data addObject:[NSString stringWithFormat:@"Item %d",i+1]];
    }
   
    
}
- (IBAction)list:(id)sender {
    
   
    if (isList) {
        isList = NO;
        [toggle setTitle:@"List" forState:UIControlStateNormal];
    }
    else
    {   isList = YES;
        [toggle setTitle:@"Grid" forState:UIControlStateNormal];
    }
    [table reloadData];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!isList) {
        static NSString *CellIdentifier = @"GridCell";
        GridCell *cell = (GridCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [GridCell cellFromNib:CellIdentifier];
            [cell setDelegate:self];
        }
        [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [[cell item1]setTitle:[data objectAtIndex:indexPath.row*3] forState:UIControlStateNormal];
        if (indexPath.row*3+1 < total) {
            [[cell item2]setTitle:[data objectAtIndex:indexPath.row*3+1] forState:UIControlStateNormal];
        }
        else
        {
            [[cell item2]setHidden:YES];
        }
        if (indexPath.row*3+2 <= total-1) {
            [[cell item3]setTitle:[data objectAtIndex:indexPath.row*3+2] forState:UIControlStateNormal];
        }
        else
        {
            [[cell item3]setHidden:YES];
        }
        
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"ListCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        [table setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [[cell textLabel]setText:[data objectAtIndex:indexPath.row]];
        return cell;
    }
    
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
    if (!isList) {
        if(total%3 == 0)
            return total/3;
        else
            return total/3 + 1;
    }
    else
    {
        return [data count];
    }
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!isList) {
        return 120;
    }
    else
    {
        return 60;
    }
  
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
