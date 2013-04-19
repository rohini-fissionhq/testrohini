//
//  ViewController1.m
//  viewStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 20/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1
@synthesize showImage,showname1,shownumber,tabView,array1;

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
    switch (shownumber) {
        case 0:
            showImage.image = [UIImage imageNamed:@"himym.jpg"];
            break;
        case 1:
            showImage.image = [UIImage imageNamed:@"mf.jpg"];
            break;
        case 2:
            showImage.image = [UIImage imageNamed:@"got.jpg"];
            break;
            
        default:
            break;
    }
    [self.view addSubview:showImage];
    NSArray *array2 = [[NSArray alloc]initWithObjects:@"himym",@"season6",@"1996", nil];
    NSArray *array3 = [[NSArray alloc]initWithObjects:@"mf",@"season6",@"19", nil];
    NSArray *array4 = [[NSArray alloc]initWithObjects:@"got",@"season3",@"199", nil];
    array1 = [[NSArray alloc]initWithObjects:array2,array3,array4, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"id";
    UITableViewCell *mycell = [[UITableViewCell alloc]init];
    mycell = [tabView dequeueReusableCellWithIdentifier:cellid ];
    if(mycell == Nil)
    {
        mycell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    NSArray *myarray =  [[NSArray alloc]init];
   // myarray = [array1 objectAtIndex:shownumber];
    mycell.textLabel.text = [[array1 objectAtIndex:shownumber ] objectAtIndex:indexPath.row];
    return mycell;
}
@end
