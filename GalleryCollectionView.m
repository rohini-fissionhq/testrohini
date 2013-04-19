//
//  GalleryCollectionView.m
//  NewsAppTabBar
//
//  Created by Pramod on 03/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import "GalleryCollectionView.h"
#import "GalleryCell.h"
#import "DetailGalleryController.h"
#import "GalleryFlowLayout.h"

@interface GalleryCollectionView ()
{
    GalleryCell *cells;
}
@end

@implementation GalleryCollectionView
@synthesize textArray,imageArray,selectedrow;
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
    self.title =@"Gallery";
    //self.collectionView.backgroundColor =[UIColor whiteColor];
        [self.collectionView registerClass:[GalleryCell class] forCellWithReuseIdentifier:@"CellID"];
     textArray =[[NSArray alloc]initWithObjects:@"Chiru",@"BalaKrishna",@"Nagarjuna",@"Venkatesh",@"Pawan",@"Mahesh",@"charan",@"NTR",@"Prabas", nil];
     imageArray =[[NSArray alloc]initWithObjects:@"chiru.jpg",@"balayya1.jpg",@"nagarjuna.jpg",@"venkatesh.jpg",@"pawan.jpg",@"maheshbabu.jpg",@"charan.jpg",@"ntr1.jpg",@"prabas.jpg", nil];
    actressTextArray =[[NSArray alloc]initWithObjects:@"kajol",@"Sruthi",@"Anushka",@"Samanta", nil];
    actressImageArray =[[NSArray alloc]initWithObjects:@"Kajol.jpg",@"Sruthi.jpg",@"Anushka.jpg",@"Samantha.jpg", nil];
    cells = [[GalleryCell alloc]init];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        
         return [textArray count];
    }
    if (section==1) {
        
        return [actressTextArray count];
    }
    return 0;
   
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cells = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    if (indexPath.section==0) {
        
    cells.cellLabel.text =[textArray objectAtIndex:indexPath.item];
    cells.cellImage.image =[UIImage imageNamed:[imageArray objectAtIndex:indexPath.item]];
    
    }
    if (indexPath.section==1) {
        cells.cellLabel.text =[actressTextArray objectAtIndex:indexPath.item];
        cells.cellImage.image =[UIImage imageNamed:[actressImageArray objectAtIndex:indexPath.item]];
    }
   
    return cells;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GalleryFlowLayout *gfl = [[GalleryFlowLayout alloc]init];
    DetailGalleryController *detailGalleryView =[[DetailGalleryController alloc]initWithCollectionViewLayout:gfl];
    detailGalleryView.selectedItem=indexPath.item;
    
    gfl.itemSize = CGSizeMake(110, 110);
    gfl.sectionInset = UIEdgeInsetsMake(0, 0, 30, 40);
    gfl.minimumLineSpacing = 30.0;
    
    if (indexPath.section==0) {
        if (detailGalleryView.selectedItem==0)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"chiru1.jpg",@"chiru2.jpg",@"chiru3.jpg", @"chiru4.jpg",@"chiru5.jpg",@"chiru6.jpg",@"chiru7.jpg",@"chiru8.jpg",@"chiru9.jpg",nil];
            
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==1)
        {
        NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"balayya.jpg",@"balayya1.jpg",@"balayya2.jpg",@"balayya4.jpg",@"balayya5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==2)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"nag1.jpg",@"nag2.jpg",@"nag3.jpg",@"nag4.jpg",@"nag5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==3)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"venki1.jpg",@"venki2.jpg",@"venki3.jpg",@"venki4.jpg",@"venki5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==4)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"pawan1.jpg",@"pawan2.jpg",@"pawan3.jpg",@"pawan4.jpg",@"pawan5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==5)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"ma.png",@"ma2.png",@"ma3.png",@"ma4.png",@"ma5.png",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==6)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"ram.jpg",@"ram2.jpg",@"ram3.jpg",@"ram4.jpg",@"ram5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==7)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"ntr.jpg",@"ntr1.jpg",@"ntr3.jpg",@"ntr4.jpg",@"ntr5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==8)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"pra1.jpg",@"pra2.jpg",@"pra3.jpg",@"pra4.jpg",@"pra5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }

    }
    if (indexPath.section==1) {
        if (detailGalleryView.selectedItem==0)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"kajol.jpg",@"kajol1.jpg",@"kajol2.jpg",@"kajol3.jpg",@"kajol4.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==1)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"sruthi.jpg",@"sruthi1.jpg",@"sruthi2.jpg",@"sruthi4.jpg",@"sruthi5.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==2)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"anu.jpg",@"anu1.jpg",@"anu2.jpg",@"anu3.jpg",@"anu4.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
        if (detailGalleryView.selectedItem==3)
        {
            NSArray *detailImageArray =[[NSArray alloc]initWithObjects:@"sam.jpg",@"sam1.jpg",@"sam2.jpg",@"sam3.jpg",@"sam4.jpg",nil];
            [detailGalleryView passArray:detailImageArray];
        }
    }
    [self.navigationController pushViewController:detailGalleryView animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
