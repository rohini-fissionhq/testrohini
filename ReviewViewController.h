//
//  ReviewViewController.h
//  NewsAppTabBar
//
//  Created by Pramod on 06/01/13.
//  Copyright (c) 2013 BRN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieItem.h"

@interface ReviewViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    
    UILabel *reviewLabel;
    
    NSArray *reviewArray,*reviewImageArray;
    UIToolbar *toolbar;
    UIBarButtonItem *tollyWoodButton,*bollywoodButton,*otherbutton;
    int i;
}
typedef enum toolBarItems
{
    kTollywoodItem,
    kBollywooditem,
}toolBarItems;

@property(nonatomic,retain) UIToolbar *toolbar;
@property(nonatomic,retain) UIBarButtonItem *tollyWoodButton,*bollywoodButton,*otherbutton;
@property(nonatomic,retain) NSArray *reviewArray,*reviewImageArray;
@property(nonatomic,retain) UITableView *table;
@property (nonatomic) int i;
@property(nonatomic,retain) UILabel *reviewLabel;
@property  int selectedItem;
@property NSString *selectedString;
@property(nonatomic,retain) NSArray *array;
@property NSString * woodName;

@property NSMutableArray * bollywoodMovies;

@property NSMutableArray * tollywoodMovies;

@end
