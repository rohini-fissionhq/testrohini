//
//  ReviewViewController.m
//  NewsAppTabBar
//
//  Created by Pramod on 06/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import "ReviewViewController.h"
#import "DetailReviewViewController.h"
@interface ReviewViewController ()
#define ktollywood
#define kbollywood


@end

@implementation ReviewViewController
@synthesize toolbar,tollyWoodButton,bollywoodButton,otherbutton,reviewArray,reviewImageArray,table,i,reviewLabel,selectedItem,selectedString,array;
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
    self.title =@"Reviews";
    table =[[UITableView alloc]initWithFrame:CGRectMake(0, 50, 320, 350) style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    
    toolbar =[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    tollyWoodButton =[[UIBarButtonItem alloc]initWithTitle:@"TollyWood" style:UIBarButtonItemStyleBordered target:self action:@selector(TWButton:)];
    tollyWoodButton.tag=0;
    UIBarButtonItem *flexible =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    bollywoodButton =[[UIBarButtonItem alloc]initWithTitle:@"BollyWood" style:UIBarButtonItemStyleBordered target:self action:@selector(BWButton)];
    bollywoodButton.tag=1;
    //UIBarButtonItem *flexible1 =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    // otherbutton =[[UIBarButtonItem alloc]initWithTitle:@"Other Films" style:UIBarButtonItemStyleBordered target:self action:@selector(OthersButton)];
    [toolbar setItems:@[tollyWoodButton,flexible,bollywoodButton]];
    array =[[NSArray alloc]initWithObjects:tollyWoodButton,flexible,bollywoodButton, nil];
   
    toolbar.items =array;
    
    _woodName = @"Tollywood";
   // self.navigationItem.leftBarButtonItem =tollyWoodButton;
   // self.navigationItem.rightBarButtonItem =bollywoodButton;
    [self.view addSubview:toolbar];
    
    
    
}


-(void)TWButton:(id)sender
{
   // NSLog(@"tollywood");
    
    _woodName = @"Tollywood";
    
    reviewArray =[[NSArray alloc]initWithObjects:@"Nayak",@"SVSC",@"Gabber Singh",@"Business Man",@"Yamudiki Mogudu",@"Sarochcharu",@"Damarukam",@"KVJ" ,nil];
    reviewImageArray=[[NSArray alloc]initWithObjects:@"nayak.jpg",@"svsc.jpg",@"gabber.jpg",@"business.jpg",@"yamudu.jpg",@"sir.png",@"damarukam.jpg",@"kvj.jpg" ,nil];
   // NSLog(@"%u",[reviewArray count]);
    [table reloadData];
    
        }



-(void)BWButton
{
   // NSLog(@"bollywood");
    
    _woodName = @"Bollywood";
    
    reviewArray =[[NSArray alloc]initWithObjects:@"Dabang2",@"jab thak hi jaan",@"Thalash",@"OMG",@"Singam",@"RajDhani Express",@"Rush",@"Bhoot Returns" ,nil];
    reviewImageArray =[[NSArray alloc]initWithObjects:@"Dabang.jpg",@"jab.jpg",@"talash1.jpg",@"omg.jpg",@"singam1.jpg",@"rajdhani.jpg",@"rush.jpg",@"bhoot.jpg", nil];
    [table reloadData];
    }
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int size=60;
    return size;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tollywoodMovies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    selectedString =[array objectAtIndex:selectedItem];
    NSLog(@"the ss is %@",selectedString);
    NSLog(@"%@",_tollywoodMovies);
    cell.textLabel.text =[[_tollywoodMovies objectAtIndex:indexPath.row]movieName];
    cell.imageView.image =[UIImage imageNamed:[[_tollywoodMovies objectAtIndex:indexPath.row]movieImagePath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailReviewViewController *drvc = [[DetailReviewViewController alloc] initWithNibName:@"DetailReviewViewController" bundle:nil];
            
  
    
    if([_woodName isEqualToString:@"Tollywood"])
    {
        [drvc passImage:[UIImage imageNamed:[reviewImageArray objectAtIndex:indexPath.row]]];
        
        
    
    } else if([_woodName isEqualToString:@"Bollywood"])
    {
        
        [drvc passImage:[UIImage imageNamed:[reviewImageArray objectAtIndex:indexPath.row]]];
    }
    
[self.navigationController pushViewController:drvc animated:YES];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTollywoodMoviesArr
{
    
    MovieItem * tm1 = [[MovieItem alloc]init];
    
    tm1.movieName = @"Nayak";
    tm1.movieImagePath = @"nayak.jpg";
    tm1.movieRating = @"5";
    
    MovieItem * tm2 = [[MovieItem alloc]init];
    
    tm2.movieName = @"SVSC";
    tm2.movieImagePath = @"svsc.jpg";
    tm2.movieRating = @"4";
    
    MovieItem * tm3 = [[MovieItem alloc]init];
    
    tm3.movieName = @"KVJ";
    tm3.movieImagePath = @"kvj.jpg";
    tm3.movieRating = @"4";
    
    _tollywoodMovies = [[NSMutableArray alloc]initWithObjects:tm1,tm2,tm3, nil];
    NSLog(@"the toolywoodmoview %@",_tollywoodMovies);
    
}


-(void)createBollywoodMoviesArr
{
    
    MovieItem * tm1 = [[MovieItem alloc]init];
    
    tm1.movieName = @"Nayak";
    tm1.movieImagePath = @"nayak.jpg";
    tm1.movieRating = @"5";
    
    MovieItem * tm2 = [[MovieItem alloc]init];
    
    tm2.movieName = @"SVSC";
    tm2.movieImagePath = @"svsc.jpg";
    tm2.movieRating = @"4";
    
    MovieItem * tm3 = [[MovieItem alloc]init];
    
    tm3.movieName = @"KVJ";
    tm3.movieImagePath = @"kvj.jpg";
    tm3.movieRating = @"4";
    
    _bollywoodMovies = [[NSMutableArray alloc]initWithObjects:tm1,tm2,tm3, nil];
    
    
}

@end
