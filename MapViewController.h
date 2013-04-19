//
//  MapViewController.h
//  ihookupnow
//
//  Created by Daniel Brooks on 2/12/13.
//  Copyright (c) 2013 Daniel Brooks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomBottomBarViewController.h"


@interface MapViewController : UIViewController<MKMapViewDelegate,MKAnnotation,CustomBottomBarViewControllerDelegate>
{
    HookUpAPIClient * sharedClient;
}

@property(nonatomic,retain)NSMutableArray * recent, * proximity, *hookups, *favorites;


-(void)showRecent;
-(void)showProximity;

@end
