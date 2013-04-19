//
//  GalleryFlowLayout.h
//  NewsAppTabBar
//
//  Created by Pramod on 03/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryFlowLayout : UICollectionViewFlowLayout
{
    UICollectionViewScrollDirection scrollDirection;
}
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

-(UICollectionViewScrollDirection) scrollDirection;

@end
