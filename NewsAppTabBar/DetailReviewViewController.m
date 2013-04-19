//
//  DetailReviewViewController.m
//  NewsAppTabBar
//
//  Created by Pramod on 06/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import "DetailReviewViewController.h"

@interface DetailReviewViewController ()

@end

@implementation DetailReviewViewController
@synthesize reviewImage,detailLabel,label,img;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)passImage:(UIImage *)DetailReviewImage
{
    img=DetailReviewImage;
   
}
-(void)passLabel:(NSString *)Headlabel
{
   
    label.text=Headlabel;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    reviewImage =[[UIImageView alloc]initWithFrame:CGRectMake(30, 50, 250, 200)];
    reviewImage.image=img;
    [self.view addSubview:reviewImage];
    
    detailLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 200, 320, 200)];
    [self.view addSubview:detailLabel];
    
    label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
  
    NSLog(@"the label ------>%@",label);
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
