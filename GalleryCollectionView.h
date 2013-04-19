//
//  GalleryCollectionView.h
//  NewsAppTabBar
//
//  Created by Pramod on 03/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryCollectionView : UICollectionViewController
{
    NSArray *textArray,*imageArray,*actressTextArray,*actressImageArray;
    int selectedrow;
    
}
@property(nonatomic,retain) NSArray *textArray,*imageArray;
@property(nonatomic)  int selectedrow;
@end
