//
//  DetailGalleryController.h
//  NewsAppTabBar
//
//  Created by Pramod on 03/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailGalleryController : UICollectionViewController
{
    NSArray *detailImageArray;
    int selectedItem;
}
@property(nonatomic,retain)  NSArray *detailImageArray,*functionArray;
@property(nonatomic) int selectedItem;


-(void)passArray:(NSArray *)detailArray;
@end
