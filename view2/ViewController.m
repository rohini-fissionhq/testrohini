//
//  ViewController.m
//  view2
//
//  Created by SUBRAHMANYAM NUKALA on 12/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textField,slider,button1;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)sliderPressed:(id)sender
{
    float i = slider.value;
    textField.text = [NSString stringWithFormat:@"%.1f",slider.value];
    
    self.view.backgroundColor=[UIColor colorWithRed:i/255 green:(128-i)/255 blue:(128+i)/255 alpha:1];

}



@end

