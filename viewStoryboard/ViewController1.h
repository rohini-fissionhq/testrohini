//
//  ViewController1.h
//  viewStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 20/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController1 : UIViewController<UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (strong , nonatomic) NSString *showname1;
@property int shownumber;
@property (strong , nonatomic) NSArray *array1;

@property (weak, nonatomic) IBOutlet UITableView *tabView;
@end
