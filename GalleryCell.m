//
//  GalleryCell.m
//  NewsAppTabBar
//
//  Created by Pramod on 03/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import "GalleryCell.h"

@implementation GalleryCell
@synthesize cellImage,cellLabel,dGImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 80, 50)];
        [self.contentView addSubview:self.cellImage];
        
        cellLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 90, 80)];
        cellLabel.backgroundColor = [UIColor clearColor];
        cellLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.cellLabel];

        dGImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 160, 110)];
        [self.contentView addSubview:self.dGImage];
    }
    return self;
}

@end
