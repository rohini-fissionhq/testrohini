//
//  ViewController.h
//  view2
//
//  Created by SUBRAHMANYAM NUKALA on 12/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UIButton *button1;

- (IBAction)sliderPressed:(id)sender;


@end
