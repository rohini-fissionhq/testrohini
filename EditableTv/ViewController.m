//
//  ViewController.m
//  EditableTv
//
//  Created by SUBRAHMANYAM NUKALA on 22/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize numbers,myTableview;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    numbers = [[NSMutableArray alloc]initWithObjects:@"one",@"two",@"three",@"four", nil];
    self.title = @"Editable TV";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIButton *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(btnPressed)];
    self.navigationItem.leftBarButtonItem = btn;
            NSLog(@"%i",numbers.count);
   // NSLog(@"%@")
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [myTableview setEditing:editing animated:animated];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numbers.count;
}
-(void)btnPressed
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"add number" message:@"" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    alert .alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
           // NSLog(@"%i",numbers.count);
    if(buttonIndex == 1)
    {
        NSString * tempfield = [alertView textFieldAtIndex:0].text;
        
        if(!numbers)
        {
            numbers = [[NSMutableArray alloc]init];
        }
        int i =numbers.count;
        NSLog(@"%i",i);


        [numbers insertObject:tempfield atIndex:i];
         NSLog(@"%i",numbers.count);
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:0];
        [self.myTableview insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
        //[self.myTableview reloadData];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell == Nil)
    {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text =[numbers objectAtIndex:indexPath.row];
    return  cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

- (void)tableView:(UITableView *)tableview commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [numbers removeObjectAtIndex:indexPath.row];
        [tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
