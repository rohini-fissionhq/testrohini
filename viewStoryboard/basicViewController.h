//
//  basicViewController.h
//  viewStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 21/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface basicViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>


@property (nonatomic,retain) NSArray *showName;

@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end
