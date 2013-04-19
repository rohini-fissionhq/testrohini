//
//  DetailReviewViewController.h
//  NewsAppTabBar
//
//  Created by Pramod on 06/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailReviewViewController : UIViewController
{
    UIImageView *reviewImage;
    UILabel *label,*detailLabel;
}
@property(nonatomic,retain)UIImageView *reviewImage;
@property UILabel *label,*detailLabel;
@property (nonatomic,retain)UIImage *img;
-(void)passImage:(UIImage *)DetailReviewImage;
-(void)passLabel:(NSString *)Headlabel;

@end
