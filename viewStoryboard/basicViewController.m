//
//  basicViewController.m
//  viewStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 21/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "basicViewController.h"
#import "mycellCell.h"
#import "ViewController1.h"

@interface basicViewController ()

@end

@implementation basicViewController
@synthesize  showName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    showName =[[NSArray alloc]initWithObjects:@"himym",@"mf",@"got", nil];
    self.title = @"shows";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return showName.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    mycellCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    if(cell == Nil)
    {
        cell= [[mycellCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.btn setTitle:[showName objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    cell.btn.tag = indexPath.row;

    return cell;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController1 *vc = [[ViewController1 alloc]init];
    vc = [segue destinationViewController];
   if([[segue identifier] isEqualToString:@"shift"])
   {
       vc.shownumber = [sender tag];
       //NSLog(@"%i",[sender tag]);
   }
    else if([[segue identifier] isEqualToString:@"Cellshift"])
    {
        NSIndexPath *path=  [self.myTable indexPathForSelectedRow];
        vc.shownumber = path.row;
         
    }
    
}


@end
