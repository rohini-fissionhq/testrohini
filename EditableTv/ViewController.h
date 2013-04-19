//
//  ViewController.h
//  EditableTv
//
//  Created by SUBRAHMANYAM NUKALA on 22/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property (strong , nonatomic) NSMutableArray *numbers;

@end
