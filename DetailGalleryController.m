//
//  DetailGalleryController.m
//  NewsAppTabBar
//
//  Created by Pramod on 03/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import "DetailGalleryController.h"
#import "GalleryCell.h"


@interface DetailGalleryController ()
{
    GalleryCell *gc;
}
@end

@implementation DetailGalleryController
@synthesize detailImageArray,selectedItem,functionArray;

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
    self.title =@"gallery details";
    detailImageArray =[[NSArray alloc]init];
    gc =[[GalleryCell alloc]init];
    [self.collectionView registerClass:[GalleryCell class] forCellWithReuseIdentifier:@"CellID"];
    
    }
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [functionArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    gc = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    gc.dGImage.image =[UIImage imageNamed:[functionArray objectAtIndex:indexPath.item]];
    return gc;
}

-(void)passArray:(NSArray *)detailArray
{
    functionArray=detailArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
